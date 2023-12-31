﻿using EcisApi.Data;
using EcisApi.Models;
using System.Linq;

namespace EcisApi.Repositories
{
    public interface ISystemConfigurationRepository : IRepository<SystemConfiguration>
    {
        SystemConfiguration GetByKey(string key);
    }

    public class SystemConfigurationRepository : Repository<SystemConfiguration>, ISystemConfigurationRepository
    {
        public SystemConfigurationRepository(DataContext dataContext) : base(dataContext)
        {

        }

        public SystemConfiguration GetByKey(string key)
        {
            return db.Set<SystemConfiguration>().Where(x => x.ConfigurationKey == key && !x.IsDeleted).FirstOrDefault();
        }
    }
}
