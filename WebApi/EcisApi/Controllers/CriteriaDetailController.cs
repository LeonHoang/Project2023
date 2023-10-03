using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CriteriaDetailController : ControllerBase
    {
        private readonly ICriteriaDetailService criteriaDetailService;

        public CriteriaDetailController(ICriteriaDetailService criteriaDetailService)
        {
            this.criteriaDetailService = criteriaDetailService;
        }

        [HttpGet("")]
        [Authorize]
        public ActionResult<ICollection<CriteriaDetail>> GetAll()
        {
            return Ok(criteriaDetailService.GetAll());
        }

        [HttpGet("{id}")]
        [Authorize]
        public ActionResult<CriteriaDetail> GetById([FromRoute] int id)
        {
            return Ok(criteriaDetailService.GetById(id));
        }
    }
}
