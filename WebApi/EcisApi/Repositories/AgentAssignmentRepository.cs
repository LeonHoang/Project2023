using EcisApi.Data;
using EcisApi.Models;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Repositories
{
    public interface IAgentAssignmentRepository : IRepository<AgentAssignment>
    {
        ICollection<AgentAssignment> GetByAgentId(int agentId);
    }

    public class AgentAssignmentRepository : Repository<AgentAssignment>, IAgentAssignmentRepository
    {
        public AgentAssignmentRepository(DataContext dataContext) : base(dataContext)
        {

        }

        public ICollection<AgentAssignment> GetByAgentId(int agentId)
        {
            return db.Set<AgentAssignment>().Where(x => x.AgentId == agentId).ToList();
        }

    }
}
