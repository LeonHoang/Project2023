using Microsoft.AspNetCore.Http;

namespace EcisApi.DTO
{
    public class UploadFileDTO
    {
        public IFormFile File { get; set; }
    }
}
