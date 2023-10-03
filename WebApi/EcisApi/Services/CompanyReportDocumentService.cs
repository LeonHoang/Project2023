using EcisApi.Models;
using EcisApi.Repositories;
using System.Collections.Generic;

namespace EcisApi.Services
{
    public interface ICompanyReportDocumentService
    {
        ICollection<CompanyReportDocument> GetByReportId(int reportId);
    }
    public class CompanyReportDocumentService : ICompanyReportDocumentService
    {
        protected readonly ICompanyReportDocumentRepository companyReportDocumentRepository;

        public CompanyReportDocumentService(
            ICompanyReportDocumentRepository companyReportDocumentRepository
            )
        {
            this.companyReportDocumentRepository = companyReportDocumentRepository;
        }

        public ICollection<CompanyReportDocument> GetByReportId(int reportId)
        {
            return companyReportDocumentRepository.GetByReportId(reportId);
        }
    }
}
