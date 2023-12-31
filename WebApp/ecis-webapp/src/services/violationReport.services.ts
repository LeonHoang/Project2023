import { ViolationReportDTO } from '@/types/dto';
import { ViolationReport } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<ViolationReport[]>> {
  return request.get(`/ViolationReport/GetAll`);
}

function getById(id: number): Promise<ApiResponseData<ViolationReport>> {
  return request.get(`/ViolationReport/ById/${id}`);
}

function CanCreateReport(companyId: number): Promise<ApiResponseData<boolean>> {
  return request.get(`/ViolationReport/CanCreateReport/${companyId}`);
}

function create(data: ViolationReportDTO): Promise<ApiResponseData<ViolationReport>> {
  return request.post(`/ViolationReport/Create`, data);
}

function approve(id: number): Promise<ApiResponseData<ViolationReport>> {
  return request.put(`/ViolationReport/Approve/${id}`);
}

function reject(id: number): Promise<ApiResponseData<ViolationReport>> {
  return request.put(`/ViolationReport/Reject/${id}`);
}

const violationReportServices = {
  getAll,
  getById,
  CanCreateReport,
  create,
  approve,
  reject,
};

export default violationReportServices;
