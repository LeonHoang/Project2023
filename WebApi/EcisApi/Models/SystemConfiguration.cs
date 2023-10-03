namespace EcisApi.Models
{
    public class SystemConfiguration : BaseModel
    {
        public int Id { get; set; }
        public string ConfigurationKey { get; set; }
        public string ConfigurationValue { get; set; }
    }
}
