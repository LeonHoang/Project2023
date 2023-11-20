import { CriteriaType } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<CriteriaType[]>> {
  return request.get('/CriteriaType');
}

function getById(id: number): Promise<ApiResponseData<CriteriaType>> {
  return request.get(`/CriteriaType/${id}`);
}

const criteriaTypeServices = {
  getAll,
  getById,
};

export default criteriaTypeServices;
