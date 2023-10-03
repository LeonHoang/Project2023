using EcisApi.Data;
using EcisApi.Models;

namespace EcisApi.Repositories
{
    public interface ICriteriaDetailRepository : IRepository<CriteriaDetail>
    {

    }

    public class CriteriaDetailRepository : Repository<CriteriaDetail>, ICriteriaDetailRepository
    {
        public CriteriaDetailRepository(DataContext dataContext) : base(dataContext)
        {

        }
    }
}
