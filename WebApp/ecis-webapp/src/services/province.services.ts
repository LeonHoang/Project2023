import { Province } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<Province[]>> {
  return request.get(`/Province/GetAll`);
}

const provinceServices = {
  getAll,
};

export default provinceServices;
