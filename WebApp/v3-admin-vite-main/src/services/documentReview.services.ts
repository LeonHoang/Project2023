import { DocumentReview } from '@/types/models';
import request from '../utils/service';

function getAllByProcessId(processId: number): Promise<ApiResponseData<DocumentReview[]>> {
  return request.get(`/DocumentReview/GetByProcessId/${processId}`);
}

function getAllByDocumentId(documentId: number): Promise<ApiResponseData<DocumentReview[]>> {
  return request.get(`/DocumentReview/GetByDocumentId/${documentId}`);
}

function getById(id: number): Promise<ApiResponseData<DocumentReview>> {
  return request.get(`/DocumentReview/${id}`);
}

function add(documentReview: Partial<DocumentReview>): Promise<ApiResponseData<DocumentReview>> {
  return request.post('/DocumentReview/Add', documentReview);
}

function update(documentReview: Partial<DocumentReview>): Promise<ApiResponseData<DocumentReview>> {
  return request.put('/DocumentReview/Update', documentReview);
}

function remove(id: number): Promise<ApiResponseData<void>> {
  return request.del(`/DocumentReview/Delete/${id}`);
}

const documentReviewServices = {
  getAllByProcessId,
  getAllByDocumentId,
  getById,
  add,
  update,
  remove,
};

export default documentReviewServices;
