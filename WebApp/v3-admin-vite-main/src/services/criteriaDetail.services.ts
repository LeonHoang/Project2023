import { CriteriaDetail } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<CriteriaDetail[]>> {
  return request.get('/CriteriaDetail');
}

function getById(id: number): Promise<ApiResponseData<CriteriaDetail>> {
  return request.get(`/CriteriaDetail/${id}`);
}

const criteriaDetailServices = {
  getAll,
  getById,
};

export default criteriaDetailServices;
