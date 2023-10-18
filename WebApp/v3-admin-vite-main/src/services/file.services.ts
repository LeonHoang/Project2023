import { UploadFileResponseDTO } from '@/types/dto';
import request from '../utils/service';

function uploadFile(file: File): Promise<ApiResponseData<UploadFileResponseDTO>> {
  const formData = new FormData();
  formData.append('File', file);
  return request.post('/File', formData);
}

const fileServices = {
  uploadFile,
};

export default fileServices;
