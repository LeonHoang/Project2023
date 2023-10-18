import { ViolationReportDocument } from '@/types/models';
import request from '../utils/service';

function getByReportId(reportId: number): Promise<ApiResponseData<ViolationReportDocument[]>> {
  return request.get(`/ViolationReportDocument/GetByReport/${reportId}`);
}

const violationReportDocumentServices = {
  getByReportId,
};

export default violationReportDocumentServices;
