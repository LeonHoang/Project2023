﻿using Newtonsoft.Json;
using System.Collections.Generic;

namespace EcisApi.Models
{
    public class Province : BaseModel
    {
        public int Id { get; set; }
        public string ProvinceCode { get; set; }
        public string ProvinceName { get; set; }

        [JsonIgnore]
        public virtual ICollection<Company> Companies { get; set; }
        [JsonIgnore]
        public virtual ICollection<AgentAssignment> AgentAssignments { get; set; }
    }
}
