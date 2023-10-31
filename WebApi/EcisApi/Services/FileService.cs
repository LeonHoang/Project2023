using EcisApi.DTO;
using EcisApi.Helpers;
using EcisApi.Models;
using EcisApi.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.IO;
using System.Threading.Tasks;

namespace EcisApi.Services
{
    public interface IFileService
    {
        Task<Stream> GetFile(string fileName);
        Task<string> UploadFile(IFormFile formFile);
    }

    public class FileService : IFileService
    {
        protected readonly AppSettings appSettings;

        public FileService(
            IOptions<AppSettings> appSettings
            )
        {
            this.appSettings = appSettings.Value;
        }

        public async Task<Stream> GetFile(string fileName)
        {
            var filePath = Path.Combine(appSettings.FileFolderPath, fileName);
            var stream = File.OpenRead(filePath);
            return stream;
        }

        public async Task<string> UploadFile(IFormFile formFile)
        {
            string randomFileName = Path.GetRandomFileName() + Path.GetExtension(formFile.FileName);

            if (!Directory.Exists(appSettings.FileFolderPath))
                Directory.CreateDirectory(appSettings.FileFolderPath);

            var filePath = Path.Combine(appSettings.FileFolderPath, randomFileName);

            using var stream = File.Create(filePath);
            await formFile.CopyToAsync(stream);
            return randomFileName;
        }
    }
}
