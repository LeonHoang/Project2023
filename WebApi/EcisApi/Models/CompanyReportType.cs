﻿using Newtonsoft.Json;
using System.Collections.Generic;

namespace EcisApi.Models
{
    public class CompanyReportType : BaseModel
    {
        public int Id { get; set; }
        public string TypeName { get; set; }
        public string Description { get; set; }

        [JsonIgnore]
        public virtual ICollection<CompanyReport> CompanyReports { get; set; }
    }
}
