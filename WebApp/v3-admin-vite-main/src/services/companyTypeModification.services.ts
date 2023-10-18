import { CompanyTypeModification } from '@/types/models';
import request from '../utils/service';

function getReportPrivate(month: number, year: number): Promise<ApiResponseData<CompanyTypeModification[]>> {
  return request.get(`/Company/GetReportPrivate?month=${month}&year=${year}`);
}

function getReport(month: number, year: number): Promise<ApiResponseData<CompanyTypeModification[]>> {
  return request.get(`/Company/GetReport?month=${month}&year=${year}`);
}

function getByCompanyId(companyId: number): Promise<ApiResponseData<CompanyTypeModification[]>> {
  return request.get(`/Company/GetCompanyReport/${companyId}`);
}

function getById(id: number): Promise<ApiResponseData<CompanyTypeModification>> {
  return request.get(`/Company/Modification/ById/${id}`);
}

function update(data: Partial<CompanyTypeModification>): Promise<ApiResponseData<CompanyTypeModification>> {
  return request.put(`/Company/UpdateModification`, data);
}

const companyTypeModificationServices = {
  getReportPrivate,
  getReport,
  getByCompanyId,
  getById,
  update,
};

export default companyTypeModificationServices;
