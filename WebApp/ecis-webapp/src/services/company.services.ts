import { CompanyRegistrationDTO } from '@/types/dto';
import { Company } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<Company[]>> {
  return request.get(`/Company/GetAll`);
}

function getByAccountId(accountId: number): Promise<ApiResponseData<Company>> {
  return request.get(`/Company/ByAccount/${accountId}`);
}

function getById(id: number): Promise<ApiResponseData<Company>> {
  return request.get(`/Company/${id}`);
}

function registerCompany(payload: CompanyRegistrationDTO): Promise<ApiResponseData<CompanyRegistrationDTO>> {
  return request.post('/Company/RegisterCompany', payload);
}

function updateCompany(company: Partial<Company>): Promise<ApiResponseData<Company>> {
  return request.put(`/Company/Update`, company);
}


function deleteCompany(id: number){
  return request.del(`/Company/Delete/${id}`);
}

function activateCompany(id: number){
  return request.post(`/Company/Activate/${id}`);
}


const companyServices = {
  getAll,
  getByAccountId,
  getById,
  registerCompany,
  updateCompany,
  deleteCompany,
  activateCompany
};

export default companyServices;
