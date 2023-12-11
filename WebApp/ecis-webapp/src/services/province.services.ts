import { AgentAssignment, Province } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<Province[]>> {
  return request.get(`/Province/GetAll`);
}

function getAssignmentsByProvinceId(provinceId: number): Promise<ApiResponseData<AgentAssignment[]>> {
  return request.get(`/Province/GetAssignments/${provinceId}`);
}

const provinceServices = {
  getAll,
  getAssignmentsByProvinceId
};

export default provinceServices;
