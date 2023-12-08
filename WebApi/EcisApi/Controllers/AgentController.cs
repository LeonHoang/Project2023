using EcisApi.DTO;
using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AgentController : ControllerBase
    {
        private readonly IAgentService agentService;

        public AgentController(
            IAgentService agentService
            )
        {
            this.agentService = agentService;
        }

        [HttpGet("GetAll")]
        [Authorize]
        public ActionResult<ICollection<Agent>> GetAll()
        {
            return Ok(agentService.GetAll());
        }

        [HttpGet("GetAllAgents")]
        [Authorize]
        public ActionResult<ICollection<Agent>> GetAllAgents()
        {
            return Ok(agentService.GetAllAgents());
        }

        [HttpGet("ByAccount/{accountId}")]
        [Authorize]
        public ActionResult<Agent> GetByAccountId([FromRoute] int accountId)
        {
            return agentService.GetByAccountId(accountId);
        }

        [HttpGet("GetAssignments/{agentId}")]
        [Authorize]
        public ActionResult<ICollection<AgentAssignment>> GetAssignmentsByAgentId([FromRoute] int agentId)
        {
            return Ok(agentService.GetAssignmentsByAgentId(agentId));
        }

        [HttpGet("ById/{id}")]
        [Authorize]
        public ActionResult<Agent> GetById([FromRoute] int id)
        {
            return agentService.GetById(id);
        }

        [HttpPost("Add")]
        [Authorize("Admin")]
        public async Task<ActionResult<Agent>> Add([FromBody] AgentCreateDTO payload)
        {
            try
            {
                var result = await agentService.AddAsync(payload);
                return Ok(result);
            }
            catch (BadHttpRequestException e)
            {
                return BadRequest(new { e.Message });
            }
        }

        [HttpPut("Update")]
        [Authorize]
        public async Task<ActionResult<Agent>> Update([FromBody] Agent payload)
        {
            try
            {
                var updated = await agentService.UpdateAsync(payload);
                return Ok(updated);
            }
            catch (BadHttpRequestException e)
            {
                return BadRequest(new { e.Message });
            }
        }

        [HttpDelete("Delete/{id}")]
        [Authorize("Admin")]
        public async Task<ActionResult> Delete([FromRoute] int id)
        {

            try
            {
                await agentService.DeleteAsync(id);
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest(new
                {
                    e.Message,
                });
            }
        }

        [HttpPost("Activate/{id}")]
        [Authorize("Admin")]
        public async Task<ActionResult<Company>> Activate([FromRoute] int id)
        {
            try
            {
                await agentService.ActivateAsync(id);
                return Ok();
            }
            catch (Exception e)
            {
                return BadRequest(new
                {
                    e.Message,
                });
            }
        }

    }
}
