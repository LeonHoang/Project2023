import { ThirdPartyRegisterDTO } from '@/types/dto';
import { ThirdParty } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<ThirdParty[]>> {
  return request.get(`/ThirdParty/GetAll`);
}

function getById(id: number): Promise<ApiResponseData<ThirdParty>> {
  return request.get(`/ThirdParty/ById/${id}`);
}

function getByAccountId(accountId: number): Promise<ApiResponseData<ThirdParty>> {
  return request.get(`/ThirdParty/ByAccount/${accountId}`);
}

function create(payload: ThirdPartyRegisterDTO): Promise<ApiResponseData<ThirdParty>> {
  return request.post(`/ThirdParty/Register`, payload);
}

function activate(id: number): Promise<ApiResponseData<ThirdParty>> {
  return request.put(`/ThirdParty/Activate/${id}`);
}

function deactivate(id: number): Promise<ApiResponseData<ThirdParty>> {
  return request.put(`/ThirdParty/Deactivate/${id}`);
}

function resetSecret(id: number): Promise<ApiResponseData<ThirdParty>> {
  return request.put(`/ThirdParty/ResetSecret/${id}`);
}

const thirdPartyServices = {
  getAll,
  getById,
  getByAccountId,
  create,
  activate,
  deactivate,
  resetSecret,
};

export default thirdPartyServices;
