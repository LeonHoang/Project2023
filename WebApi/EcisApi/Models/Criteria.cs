using Newtonsoft.Json;
using System.Collections.Generic;

namespace EcisApi.Models
{
    public class Criteria : BaseModel
    {
        public int Id { get; set; }
        public string CriteriaName { get; set; }
        public string Description { get; set; }

        public int? CriteriaTypeId { get; set; }

        public virtual CriteriaType CriteriaType { get; set; }

        [JsonIgnore]
        public virtual ICollection<CriteriaDetail> CriteriaDetails { get; set; }
    }
}
