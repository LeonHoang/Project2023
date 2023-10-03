using EcisApi.Models;
using EcisApi.Repositories;

namespace EcisApi.Services
{
    public interface IRoleService
    {
        Role GetById(int id);
    }

    public class RoleService : IRoleService
    {
        protected readonly IRoleRepository roleRepository;

        public RoleService(
            IRoleRepository roleRepository
            )
        {
            this.roleRepository = roleRepository;
        }

        public Role GetById(int id)
        {
            return roleRepository.GetById(id);
        }
    }
}
