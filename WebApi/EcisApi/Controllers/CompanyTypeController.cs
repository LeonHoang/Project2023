using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyTypeController : ControllerBase
    {
        private readonly ICompanyTypeService companyTypeService;

        public CompanyTypeController(
            ICompanyTypeService companyTypeService
            )
        {
            this.companyTypeService = companyTypeService;
        }

        [HttpGet("GetAll")]
        [Authorize]
        public ActionResult<ICollection<CompanyType>> GetAll()
        {
            return Ok(companyTypeService.GetAll());
        }

        [HttpGet("{id}")]
        [Authorize]
        public ActionResult<CompanyType> GetById([FromRoute] int id)
        {
            return Ok(companyTypeService.GetById(id));
        }
    }
}
