using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CriteriaController : ControllerBase
    {
        private readonly ICriteriaService criteriaService;

        public CriteriaController(ICriteriaService criteriaService)
        {
            this.criteriaService = criteriaService;
        }

        [HttpGet("")]
        [Authorize]
        public ActionResult<ICollection<Criteria>> GetAll()
        {
            return Ok(criteriaService.GetAll());
        }

        [HttpGet("{id}")]
        [Authorize]
        public ActionResult<Criteria> GetById([FromRoute] int id)
        {
            return Ok(criteriaService.GetById(id));
        }
    }
}
