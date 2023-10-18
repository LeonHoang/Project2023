import { VerificationCriteria } from '@/types/models';
import request from '../utils/service';

function getAllByProcessId(processId: number): Promise<ApiResponseData<VerificationCriteria[]>> {
  return request.get(`/VerificationCriteria/GetByProcessId/${processId}`);
}

function getById(id: number): Promise<ApiResponseData<VerificationCriteria>> {
  return request.get(`/VerificationCriteria/${id}`);
}

function update(verificationCriteria: Partial<VerificationCriteria>): Promise<ApiResponseData<VerificationCriteria>> {
  return request.put(`/VerificationCriteria/Update`, verificationCriteria);
}

function approveAll(processId: number): Promise<ApiResponseData<VerificationCriteria[]>> {
  return request.put(`/VerificationCriteria/ApproveAll/${processId}`);
}

const verificationCriteriaServices = {
  getAllByProcessId,
  getById,
  update,
  approveAll,
};

export default verificationCriteriaServices;
