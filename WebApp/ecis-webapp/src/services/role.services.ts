import { Role } from '@/types/models';
import request from '../utils/service';

function getById(roleId: number): Promise<ApiResponseData<Role>> {
  return request.get(`/Role/${roleId}`);
}

const roleServices = {
  getById,
};

export default roleServices;
