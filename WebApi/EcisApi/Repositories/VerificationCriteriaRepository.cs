using EcisApi.Data;
using EcisApi.Models;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Repositories
{
    public interface IVerificationCriteriaRepository : IRepository<VerificationCriteria>
    {
        ICollection<VerificationCriteria> GetByProcessId(int processId);
    }

    public class VerificationCriteriaRepository : Repository<VerificationCriteria>, IVerificationCriteriaRepository
    {
        public VerificationCriteriaRepository(DataContext dataContext) : base(dataContext)
        {

        }

        public ICollection<VerificationCriteria> GetByProcessId(int processId)
        {
            return db.Set<VerificationCriteria>().Where(x => x.VerificationProcessId == processId).ToList();
        }
    }
}
