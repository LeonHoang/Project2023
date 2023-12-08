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

// function activate(id: number): Promise<ApiResponseData<ThirdParty>> {
//   return request.put(`/ThirdParty/Activate/${id}`);
// }

// function deactivate(id: number): Promise<ApiResponseData<ThirdParty>> {
//   return request.put(`/ThirdParty/Deactivate/${id}`);
// }

function updateThirdParty(thirdParty: Partial<ThirdParty>): Promise<ApiResponseData<ThirdParty>> {
  return request.put(`/ThirdParty/Update`, thirdParty);
}

function deleteThirdParty(id: number){
  return request.del(`/ThirdParty/Delete/${id}`);
}

function activateThirdParty(id: number){
  return request.post(`/ThirdParty/Activate/${id}`);
}

function resetSecret(id: number): Promise<ApiResponseData<ThirdParty>> {
  return request.put(`/ThirdParty/ResetSecret/${id}`);
}

const thirdPartyServices = {
  getAll,
  getById,
  getByAccountId,
  create,
  updateThirdParty,
  activateThirdParty,
  deleteThirdParty,
  resetSecret,
};

export default thirdPartyServices;
