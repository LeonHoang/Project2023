using EcisApi.Data;
using Microsoft.EntityFrameworkCore.Storage;

namespace EcisApi.Repositories
{
    public interface IUnitOfWork
    {
        IDbContextTransaction BeginTransaction();
    }

    public class UnitOfWork : IUnitOfWork
    {
        private readonly DataContext dataContext;

        public UnitOfWork(DataContext dataContext)
        {
            this.dataContext = dataContext;
        }

        public IDbContextTransaction BeginTransaction()
        {
            return dataContext.Database.BeginTransaction();
        }
    }
}
