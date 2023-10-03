using Newtonsoft.Json;
using System.Collections.Generic;

namespace EcisApi.Models
{
    public class Role : BaseModel
    {
        public int Id { get; set; }
        public string RoleName { get; set; }
        public string Description { get; set; }
        public bool HasManagement { get; set; }

        [JsonIgnore]
        public virtual ICollection<Account> Accounts { get; set; }
    }
}
