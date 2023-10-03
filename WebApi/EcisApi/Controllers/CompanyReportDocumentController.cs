using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyReportDocumentController : ControllerBase
    {
        private readonly ICompanyReportDocumentService companyReportDocumentService;

        public CompanyReportDocumentController(ICompanyReportDocumentService companyReportDocumentService)
        {
            this.companyReportDocumentService = companyReportDocumentService;
        }

        [HttpGet("GetByReport/{id}")]
        [Authorize]
        public ActionResult<ICollection<CompanyReportDocument>> GetByReport([FromRoute] int id)
        {
            return Ok(companyReportDocumentService.GetByReportId(id));
        }
    }
}
