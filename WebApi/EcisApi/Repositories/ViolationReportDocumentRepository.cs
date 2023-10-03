using EcisApi.Data;
using EcisApi.Models;
using System.Collections.Generic;
using System.Linq;

namespace EcisApi.Repositories
{
    public interface IViolationReportDocumentRepository : IRepository<ViolationReportDocument>
    {
        ICollection<ViolationReportDocument> GetByReportId(int reportId);
    }

    public class ViolationReportDocumentRepository : Repository<ViolationReportDocument>, IViolationReportDocumentRepository
    {
        public ViolationReportDocumentRepository(DataContext dataContext) : base(dataContext)
        {

        }

        public ICollection<ViolationReportDocument> GetByReportId(int reportId)
        {
            return db.Set<ViolationReportDocument>().Where(x => x.ViolationReportId == reportId).ToList();
        }
    }
}
