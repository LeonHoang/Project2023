import { CompanyReport } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<CompanyReport[]>> {
  return request.get('/CompanyReport/GetAll');
}

function getById(id: number): Promise<ApiResponseData<CompanyReport>> {
  return request.get(`/CompanyReport/ById/${id}`);
}

function approve(id: number): Promise<ApiResponseData<CompanyReport>> {
  return request.put(`/CompanyReport/Approve/${id}`);
}

function reject(id: number): Promise<ApiResponseData<CompanyReport>> {
  return request.put(`/CompanyReport/Reject/${id}`);
}

const companyReportServices = {
  getAll,
  getById,
  approve,
  reject,
};

export default companyReportServices;
