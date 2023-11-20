import { VerificationDocument } from '@/types/models';
import request from '../utils/service';

function getAllByProcessId(processId: number): Promise<ApiResponseData<VerificationDocument[]>> {
  return request.get(`/VerificationDocument/GetByProcessId/${processId}`);
}

function getById(id: number): Promise<ApiResponseData<VerificationDocument>> {
  return request.get(`/VerificationDocument/${id}`);
}

function create(document: Partial<VerificationDocument>): Promise<ApiResponseData<VerificationDocument>> {
  return request.post(`/VerificationDocument/Add`, document);
}

function update(document: Partial<VerificationDocument>): Promise<ApiResponseData<VerificationDocument>> {
  return request.put(`/VerificationDocument/Update`, document);
}

function remove(id: number): Promise<ApiResponseData<void>> {
  return request.del(`/VerificationDocument/Delete/${id}`);
}

const verificationDocumentServices = {
  getAllByProcessId,
  getById,
  create,
  update,
  remove,
};

export default verificationDocumentServices;
