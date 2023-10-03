using EcisApi.Data;
using EcisApi.Models;

namespace EcisApi.Repositories
{
    public interface IVerificationConfirmDocumentRepository : IRepository<VerificationConfirmDocument>
    {

    }

    public class VerificationConfirmDocumentRepository : Repository<VerificationConfirmDocument>, IVerificationConfirmDocumentRepository
    {
        public VerificationConfirmDocumentRepository(DataContext dataContext) : base(dataContext)
        {

        }
    }
}
