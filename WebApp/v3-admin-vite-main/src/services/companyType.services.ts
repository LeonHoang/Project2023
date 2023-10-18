import { CompanyType } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<CompanyType[]>> {
  return request.get(`/CompanyType/GetAll`);
}

function getById(id: number): Promise<ApiResponseData<CompanyType>> {
  return request.get(`/CompanyType/${id}`);
}

const companyTypeServices = {
  getAll,
  getById,
};

export default companyTypeServices;
