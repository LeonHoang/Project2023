using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProvinceController : ControllerBase
    {
        private readonly IProvinceService provinceService;

        public ProvinceController(IProvinceService provinceService)
        {
            this.provinceService = provinceService;
        }

        [HttpGet("GetAll")]
        public ActionResult<ICollection<Province>> GetAll()
        {
            return Ok(provinceService.GetAll());
        }

        [HttpGet("GetAssignments/{provinceId}")]
        [Authorize]
        public ActionResult<ICollection<AgentAssignment>> GetAssignmentsByProvinceId([FromRoute] int provinceId)
        {
            return Ok(provinceService.GetAssignmentsByProvinceId(provinceId));
        }

    }
}