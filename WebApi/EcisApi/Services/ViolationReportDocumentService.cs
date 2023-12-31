﻿using EcisApi.Models;
using EcisApi.Repositories;
using System.Collections.Generic;

namespace EcisApi.Services
{
    public interface IViolationReportDocumentService
    {
        ICollection<ViolationReportDocument> GetByReportId(int reportId);
    }
    public class ViolationReportDocumentService : IViolationReportDocumentService
    {
        protected readonly IViolationReportDocumentRepository violationReportDocumentRepository;

        public ViolationReportDocumentService(
            IViolationReportDocumentRepository violationReportDocumentRepository
            )
        {
            this.violationReportDocumentRepository = violationReportDocumentRepository;
        }

        public ICollection<ViolationReportDocument> GetByReportId(int reportId)
        {
            return violationReportDocumentRepository.GetByReportId(reportId);
        }
    }
}
