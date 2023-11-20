import { Criteria } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<Criteria[]>> {
  return request.get('/Criteria');
}

function getById(id: number): Promise<ApiResponseData<Criteria>> {
  return request.get(`/Criteria/${id}`);
}

const criteriaServices = {
  getAll,
  getById,
};

export default criteriaServices;
