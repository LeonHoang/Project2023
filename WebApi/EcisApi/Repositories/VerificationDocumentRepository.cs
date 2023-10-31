using EcisApi.Data;
using EcisApi.Models;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Repositories
{
    public interface IVerificationDocumentRepository : IRepository<VerificationDocument>
    {
        ICollection<VerificationDocument> GetByProcessId(int processId);
    }

    public class VerificationDocumentRepository : Repository<VerificationDocument>, IVerificationDocumentRepository
    {
        public VerificationDocumentRepository(DataContext dataContext) : base(dataContext)
        {

        }

        public ICollection<VerificationDocument> GetByProcessId(int processId)
        {
            return db.Set<VerificationDocument>().Where(x => x.VerificationCriteria.VerificationProcessId == processId && !x.IsDeleted).ToList();
        }
    }
}
