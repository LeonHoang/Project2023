using EcisApi.Models;
using EcisApi.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Services
{
    public interface IProvinceService
    {
        ICollection<Province> GetAll();

        ICollection<AgentAssignment> GetAssignmentsByProvinceId(int provinceId);
    }

    public class ProvinceService : IProvinceService
    {
        protected readonly IProvinceRepository provinceRepository;
        protected readonly IAgentAssignmentRepository agentAssignmentRepository;

        public ProvinceService(IProvinceRepository provinceRepository, IAgentAssignmentRepository agentAssignmentRepository)
        {
            this.provinceRepository = provinceRepository;
            this.agentAssignmentRepository = agentAssignmentRepository;
        }

        public ICollection<Province> GetAll()
        {
            return provinceRepository.GetAll().ToList();
        }
        public ICollection<AgentAssignment> GetAssignmentsByProvinceId(int provinceId)
        {
            return agentAssignmentRepository.GetByProvinceId(provinceId);
        }
    }
}
