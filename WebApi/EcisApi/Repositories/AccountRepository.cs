using EcisApi.Data;
using EcisApi.Models;
using Microsoft.AspNetCore.Http;
using System;
using System.Linq;
using System.Security.Claims;

namespace EcisApi.Repositories
{
    public interface IAccountRepository : IRepository<Account>
    {
        Account GetByEmail(string email);
        Account GetOne(Func<Account, bool> filter);
    }


    public class AccountRepository : Repository<Account>, IAccountRepository
    {
        public AccountRepository(DataContext dataContext) : base(dataContext)
        {

        }

        public Account GetByEmail(string email)
        {
            return db.Set<Account>().Where(x => x.Email == email).FirstOrDefault();
        }
        
        public Account GetOne(Func<Account, bool> filter)
        {
            return db.Set<Account>().Where(filter).FirstOrDefault();
        }
    }
}
