using Newtonsoft.Json;
using System.Collections.Generic;

namespace EcisApi.Models
{
    public class CriteriaDetail : BaseModel
    {
        public int Id { get; set; }
        public string CriteriaDetailName { get; set; }
        public string Description { get; set; }
        public bool? IsRequired { get; set; }

        public int? CriteriaId { get; set; }

        public virtual Criteria Criteria { get; set; }

        [JsonIgnore]
        public virtual ICollection<VerificationCriteria> VerificationCriterias { get; set; }
    }
}
