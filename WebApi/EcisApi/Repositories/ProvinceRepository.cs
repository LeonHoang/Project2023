using EcisApi.Data;
using EcisApi.Models;

namespace EcisApi.Repositories
{
    public interface IProvinceRepository : IRepository<Province>
    {

    }

    public class ProvinceRepository : Repository<Province>, IProvinceRepository
    {
        public ProvinceRepository(DataContext dataContext) : base(dataContext)
        {

        }
    }
}
