using EcisApi.Helpers;
using EcisApi.Services;
using Hangfire;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Threading.Tasks;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class JobController : ControllerBase
    {
        private readonly IServiceScopeFactory serviceScopeFactory;
        private readonly IJobService _jobService;
        private readonly IBackgroundJobClient _backgroundJobClient;
        private readonly IRecurringJobManager _recurringJobManager;

        public JobController(IJobService jobService, IBackgroundJobClient backgroundJobClient, IRecurringJobManager recurringJobManager)
        {
            _jobService = jobService;
            _backgroundJobClient = backgroundJobClient;
            _recurringJobManager = recurringJobManager;
        }

        [HttpPost("CheckGenerateVerification")]
        [Authorize("Admin")]
        public ActionResult<bool> CheckGenerateVerification()
        {
            Task.Run(() =>
            {
                try
                {
                    //using var scope = serviceScopeFactory.CreateScope();
                    //var jobService = scope.ServiceProvider.GetRequiredService<IJobService>();
                    _recurringJobManager.AddOrUpdate("generateJobId", () => _jobService.CheckGenerateVerification(), Cron.Daily);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            });
            return Ok(true);
        }

        [HttpPost("CheckVerificationDeadline")]
        [Authorize("Admin")]
        public ActionResult<bool> CheckVerificationDeadline()
        {
            Task.Run(() =>
            {
                try
                {
                    //using var scope = serviceScopeFactory.CreateScope();
                    //var jobService = scope.ServiceProvider.GetRequiredService<IJobService>();
                    //await jobService.CheckVerificationDeadline();
                    _recurringJobManager.AddOrUpdate("deadlineJobId", () => _jobService.CheckVerificationDeadline(), Cron.Daily);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            });
            return Ok(true);
        }
    }
}
