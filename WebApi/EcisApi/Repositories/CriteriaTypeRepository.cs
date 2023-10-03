using EcisApi.Data;
using EcisApi.Models;

namespace EcisApi.Repositories
{
    public interface ICriteriaTypeRepository : IRepository<CriteriaType>
    {

    }

    public class CriteriaTypeRepository : Repository<CriteriaType>, ICriteriaTypeRepository
    {
        public CriteriaTypeRepository(DataContext dataContext) : base(dataContext)
        {

        }
    }
}
