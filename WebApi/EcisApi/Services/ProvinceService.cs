using EcisApi.Models;
using EcisApi.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Services
{
    public interface IProvinceService
    {
        ICollection<Province> GetAll();
    }

    public class ProvinceService : IProvinceService
    {
        protected readonly IProvinceRepository provinceRepository;

        public ProvinceService(IProvinceRepository provinceRepository)
        {
            this.provinceRepository = provinceRepository;
        }

        public ICollection<Province> GetAll()
        {
            return provinceRepository.GetAll().ToList();
        }
    }
}
