using EcisApi.Data;
using EcisApi.Models;

namespace EcisApi.Repositories
{
    public interface ICriteriaRepository : IRepository<Criteria>
    {

    }

    public class CriteriaRepository : Repository<Criteria>, ICriteriaRepository
    {
        public CriteriaRepository(DataContext dataContext) : base(dataContext)
        {

        }
    }
}
