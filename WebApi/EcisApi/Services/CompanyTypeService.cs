using EcisApi.Models;
using EcisApi.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Services
{
    public interface ICompanyTypeService
    {
        ICollection<CompanyType> GetAll();
        CompanyType GetById(int id);
    }

    public class CompanyTypeService : ICompanyTypeService
    {
        protected readonly ICompanyTypeRepository companyTypeRepository;

        public CompanyTypeService(
            ICompanyTypeRepository companyTypeRepository
            )
        {
            this.companyTypeRepository = companyTypeRepository;
        }

        public ICollection<CompanyType> GetAll()
        {
            return companyTypeRepository.GetAll().ToList();
        }

        public CompanyType GetById(int id)
        {
            return companyTypeRepository.GetById(id);
        }
    }
}
