using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Repositories;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcisApi.Services
{
    public interface IJobService
    {
        Task CheckGenerateVerification();
        Task CheckVerificationDeadline();
        Task CheckVerificationAgentDeadline();

        Task CheckVerificationFinishDeadline();
    }

    public class JobService : IJobService
    {
        protected readonly ICompanyRepository companyRepository;
        protected readonly ISystemConfigurationRepository systemConfigurationRepository;
        protected readonly IVerificationProcessRepository verificationProcessRepository;

        protected readonly IVerificationProcessService verificationProcessService;

        protected readonly IEmailHelper emailHelper;
        protected readonly ILogger<JobService> logger;


        public JobService(
            ICompanyRepository companyRepository,
            ISystemConfigurationRepository systemConfigurationRepository,
            IVerificationProcessRepository verificationProcessRepository,

            IVerificationProcessService verificationProcessService,

            IEmailHelper emailHelper,
            ILogger<JobService> logger
            )
        {
            this.companyRepository = companyRepository;
            this.systemConfigurationRepository = systemConfigurationRepository;
            this.verificationProcessRepository = verificationProcessRepository;

            this.verificationProcessService = verificationProcessService;

            this.emailHelper = emailHelper;
            this.logger = logger;
        }

        public async Task CheckGenerateVerification()
        {
            Console.WriteLine($"Job CheckGenerateVerification Started");

            var companies = companyRepository.GetAllActivated();
            var durationConfig = systemConfigurationRepository.GetByKey(ConfigurationKeys.MODIFICATION_VALID_DURATION);
            var duration = durationConfig != null ? durationConfig.ConfigurationValue : "1-year";
            var durationValues = duration.Split("-");
            var durationTime = Convert.ToInt32(durationValues[0]);
            var durationType = durationValues[1];

            var processed = 0;

            foreach (var company in companies)
            {
                processed += 1;
                if (processed % 20 == 0)
                {
                    Console.WriteLine($"Job CheckGenerateVerification Processed {processed} in {companies.Count}");
                }

                var lastVerification = verificationProcessRepository.GetLatestByCompanyId(company.Id);
                if (lastVerification == null)
                {
                    await verificationProcessService.GenerateAsync(company.Id);
                    try
                    {
                        await emailHelper.SendEmailAsync(
                            new string[] { lastVerification.Company.Account.Email },
                            "Yêu cầu doanh nghiệp thực hiện tự đánh giá",
                            EmailTemplate.VerificationRequest,
                            new Dictionary<string, string>());
                    }
                    catch (Exception)
                    {

                    }
                    Console.WriteLine($"Generate verification success for company {company.Id} at: {DateTimeOffset.UtcNow}");
                    return;
                }

                if (
                    lastVerification.Status == AppConstants.VerificationProcessStatus.Finished
                    && DateTime.Today == lastVerification.FinishedAt.GetValueOrDefault(DateTime.Now).AddByType(durationTime, durationType).AddDays(-30))
                {
                    try
                    {
                        await emailHelper.SendEmailAsync(
                            new string[] { lastVerification.Company.Account.Email },
                            "Doanh nghiệp còn 1 tháng sẽ bắt đầu quá trình tự đánh giá",
                            EmailTemplate.VerificationRequestNotifyMonth,
                            new Dictionary<string, string>());
                    }
                    catch (Exception)
                    {

                    }
                    Console.WriteLine($"company {company.Id} at: {DateTimeOffset.UtcNow} has 1 month left until the time verification start");
                }

                if (
                    lastVerification.Status == AppConstants.VerificationProcessStatus.Finished
                    && DateTime.Today > lastVerification.FinishedAt.GetValueOrDefault(DateTime.Now).AddByType(durationTime, durationType))
                {
                    await verificationProcessService.GenerateAsync(company.Id);
                    try
                    {
                        await emailHelper.SendEmailAsync(
                            new string[] { lastVerification.Company.Account.Email },
                            "Yêu cầu doanh nghiệp thực hiện tự đánh giá",
                            EmailTemplate.VerificationRequest,
                            new Dictionary<string, string>());
                    }
                    catch (Exception)
                    {

                    }
                    Console.WriteLine($"Generate verification success for company {company.Id} at: {DateTimeOffset.UtcNow}");
                }
            }

            Console.WriteLine($"Job CheckGenerateVerification Finished {processed} in {companies.Count}");
        }

        public async Task CheckVerificationDeadline()
        {
            Console.WriteLine($"Job CheckVerificationDeadline Started");

            var unfinishedVerifications = verificationProcessRepository.Find(x => !x.IsSubmitted && !x.IsDeleted && x.SubmitDeadline <= DateTime.Now);

            var processed = 0;

            foreach (var verification in unfinishedVerifications)
            {
                processed += 1;
                if (processed % 20 == 0)
                {
                    Console.WriteLine($"Job CheckVerificationDeadline Processed {processed} in {unfinishedVerifications.Count}");
                }
                await verificationProcessService.SubmitProcessAsync(verification.Id);
                Console.WriteLine($"Submit verification pass deadline success for verification {verification.Id} at :{DateTimeOffset.UtcNow}");
            }

            Console.WriteLine($"Job CheckVerificationDeadline Finished {processed} in {unfinishedVerifications.Count}");
        }

        public async Task CheckVerificationAgentDeadline()
        {
            Console.WriteLine($"Job CheckVerificationAgentDeadline Started");

            var unfinishedVerifications = verificationProcessRepository.Find(x => !x.IsReviewed && !x.IsDeleted && (x.SubmitDeadline - DateTime.Now).Value.Days <= 1);

            var processed = 0;

            foreach (var verification in unfinishedVerifications)
            {
                processed += 1;
                if (processed % 20 == 0)
                {
                    Console.WriteLine($"Job CheckVerificationAgentDeadline Processed {processed} in {unfinishedVerifications.Count}");
                }
                try
                {
                    var mailParams = new Dictionary<string, string>
                    {
                        { "companyEmail", verification.Company.Account.Email },
                        { "companyName", verification.Company.CompanyNameVI },
                        { "companyCode", verification.Company.CompanyCode }
                    };

                    await emailHelper.SendEmailAsync(
                        new string[] { verification.AssignedAgentReview.Account.Email },
                        "Doanh nghiệp còn 1 ngày đến hạn xác minh đánh giá, đề nghị cán bộ xử lý",
                        EmailTemplate.VerificationNeedReview,
                        mailParams);
                }
                catch (Exception)
                {

                }
                Console.WriteLine($"Review verification pass deadline success for verification {verification.Id} at :{DateTimeOffset.UtcNow}");
            }

            Console.WriteLine($"Job CheckVerificationAgentDeadline Finished {processed} in {unfinishedVerifications.Count}");
        }

        public async Task CheckVerificationFinishDeadline()
        {
            Console.WriteLine($"Job CheckVerificationFinishDeadline Started");

            var unfinishedVerifications = verificationProcessRepository.Find(x => x.IsReviewed && !x.IsFinished && !x.IsDeleted && x.SubmitDeadline <= DateTime.Now);

            var processed = 0;

            foreach (var verification in unfinishedVerifications)
            {
                processed += 1;
                if (processed % 20 == 0)
                {
                    Console.WriteLine($"Job CheckVerificationFinishDeadline Processed {processed} in {unfinishedVerifications.Count}");
                }
                try
                {
                    var mailParams = new Dictionary<string, string>
                    {
                        { "companyEmail", verification.Company.Account.Email },
                        { "companyName", verification.Company.CompanyNameVI },
                        { "companyCode", verification.Company.CompanyCode }
                    };

                    await emailHelper.SendEmailAsync(
                        new string[] { verification.AssignedAgentReview.Account.Email },
                        "Doanh nghiệp bên dưới sẽ tự động phân loaị do đến hạn xử lý. Vui lòng truy cập ECIS để xem kết quả chi tiết.",
                        EmailTemplate.VerificationNeedReview,
                        mailParams);
                }
                catch (Exception)
                {

                }
                await verificationProcessService.AutoFinishAsync(verification.Id);

                Console.WriteLine($"Review verification pass deadline success for verification {verification.Id} at :{DateTimeOffset.UtcNow}");
            }

            Console.WriteLine($"Job CheckVerificationFinishDeadline Finished {processed} in {unfinishedVerifications.Count}");
        }
    }
}
