using EcisApi.Data;
using EcisApi.Models;

namespace EcisApi.Repositories
{
    public interface IViolationReportRepository : IRepository<ViolationReport>
    {

    }

    public class ViolationReportRepository : Repository<ViolationReport>, IViolationReportRepository
    {
        public ViolationReportRepository(DataContext dataContext) : base(dataContext)
        {

        }
    }
}
