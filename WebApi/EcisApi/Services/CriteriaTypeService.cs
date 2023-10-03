using EcisApi.Models;
using EcisApi.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Services
{
    public interface ICriteriaTypeService
    {
        ICollection<CriteriaType> GetAll();
        CriteriaType GetById(int id);
    }

    public class CriteriaTypeService : ICriteriaTypeService
    {
        protected readonly ICriteriaTypeRepository criteriaTypeRepository;

        public CriteriaTypeService(
            ICriteriaTypeRepository criteriaTypeRepository
            )
        {
            this.criteriaTypeRepository = criteriaTypeRepository;
        }

        public ICollection<CriteriaType> GetAll()
        {
            return criteriaTypeRepository.GetAll().ToList();
        }

        public CriteriaType GetById(int id)
        {
            return criteriaTypeRepository.GetById(id);
        }
    }
}
