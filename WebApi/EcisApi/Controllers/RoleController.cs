using EcisApi.Models;
using EcisApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleService roleService;

        public RoleController(IRoleService roleService)
        {
            this.roleService = roleService;
        }

        [HttpGet("{id}")]
        public ActionResult<Role> GetById([FromRoute] int id)
        {
            return roleService.GetById(id);
        }
    }
}
