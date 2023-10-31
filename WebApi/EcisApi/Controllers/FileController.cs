using EcisApi.DTO;
using EcisApi.Helpers;
using EcisApi.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace EcisApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FileController : ControllerBase
    {
        private readonly IFileService fileService;

        public FileController(IFileService fileService)
        {
            this.fileService = fileService;
        }

        [HttpGet("{fileName}")]
        public async Task<ActionResult> GetFile([FromRoute] string fileName)
        {
            try
            {
                var stream = await fileService.GetFile(fileName);
                string mimeType = MimeMapping.MimeUtility.GetMimeMapping(fileName);

                return new FileStreamResult(stream, mimeType)
                {
                    FileDownloadName = fileName
                };
            }
            catch (Exception)
            {
                return NotFound();
            }
        }

        [HttpPost]
        public async Task<ActionResult<UploadFileResponseDTO>> UploadFile([FromForm] UploadFileDTO data)
        {
            if (data == null || data.File == null || data.File.Length == 0)
            {
                return BadRequest("EmptyFile");
            }

            var extension = CommonUtils.GetFileExtension(data.File.FileName);
            if (!AppConstants.AllowedExtensions.Contains(extension))
            {
                return BadRequest("InvalidFileExtension");
            }

            if (data.File.Length > AppConstants.MaxFileSize)
            {
                return BadRequest("FileTooLarge");
            }

            var fileName = await fileService.UploadFile(data.File);
            var response = new UploadFileResponseDTO
            {
                Name = data.File.FileName,
                Size = data.File.Length,
                Type = extension,
                Url = $"/File/{fileName}"
            };
            return Ok(response);
        }
    }
}
