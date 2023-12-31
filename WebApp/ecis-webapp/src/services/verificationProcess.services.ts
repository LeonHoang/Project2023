import { VerificationProcessRatingDTO } from '@/types/dto';
import { VerificationProcess } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<VerificationProcess[]>> {
  return request.get(`/VerificationProcess/GetAll`);
}

function getAllPending(): Promise<ApiResponseData<VerificationProcess[]>> {
  return request.get(`/VerificationProcess/GetPending`);
}

function getPendingByAssignedAgent(): Promise<ApiResponseData<VerificationProcess[]>> {
  return request.get(`/VerificationProcess/GetPendingByAssignedAgent`);
}

function getAllSupport(): Promise<ApiResponseData<VerificationProcess[]>> {
  return request.get(`/VerificationProcess/GetSupport`);
}

function getAllReviewed(): Promise<ApiResponseData<VerificationProcess[]>> {
  return request.get(`/VerificationProcess/GetReviewed`);
}

/**
 * @deprecated
 * @returns
 */
function getAllClassified(): Promise<ApiResponseData<VerificationProcess[]>> {
  return request.get(`/VerificationProcess/GetClassified`);
}

function getAllByCompany(companyId: number): Promise<ApiResponseData<VerificationProcess[]>> {
  return request.get(`/VerificationProcess/GetByCompany/${companyId}`);
}

function getRatingCount(processIds: number[]): Promise<ApiResponseData<VerificationProcessRatingDTO[]>> {
  const input = processIds.join(',');
  return request.get(`/VerificationProcess/RatingCount?processIds=${input}`);
}

function getById(id: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.get(`/VerificationProcess/${id}`);
}

function getCurrentPendingByCompanyId(companyId: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.get(`/VerificationProcess/GetCurrentPending/${companyId}`);
}

function getLastByCompanyId(companyId: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.get(`/VerificationProcess/GetLast/${companyId}`);
}

function generate(companyId: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.post(`/VerificationProcess/Generate/${companyId}`);
}

function submitProcess(id: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/SubmitProcess/${id}`);
}

function submitVerifyReview(id: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/SubmitReview/${id}`);
}

/**
 * @deprecated
 * @param id
 * @param companyTypeId
 * @returns
 */
function submitClassify(id: number, companyTypeId: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/SubmitClassify/${id}?companyTypeId=${companyTypeId}`);
}

function rejectReviewed(id: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/RejectReviewed/${id}`);
}

function rejectProcess(id: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/RejectProcess/${id}`);
}

function update(data: Partial<VerificationProcess>): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/Update`, data);
}

function finishVerify(id: number, companyTypeId: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/Finish/${id}?companyTypeId=${companyTypeId}`);
}

/**
 * @deprecated
 * @param id
 * @returns
 */
function rejectClassified(id: number): Promise<ApiResponseData<VerificationProcess>> {
  return request.put(`/VerificationProcess/RejectClassified/${id}`);
}



const verificationProcessServices = {
  getAll,
  getAllPending,
  getPendingByAssignedAgent,
  getAllByCompany,
  getAllSupport,
  getAllReviewed,
  getAllClassified,
  getRatingCount,
  getById,
  getCurrentPendingByCompanyId,
  getLastByCompanyId,
  generate,
  submitProcess,
  submitVerifyReview,
  submitClassify,
  rejectReviewed,
  update,
  finishVerify,
  rejectClassified,
  rejectProcess
};

export default verificationProcessServices;
