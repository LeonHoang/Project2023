import { CompanyReportDocument } from '@/types/models';
import request from '../utils/service';

function getByReportId(reportId: number): Promise<ApiResponseData<CompanyReportDocument[]>> {
  return request.get(`/CompanyReportDocument/GetByReport/${reportId}`);
}

const companyReportDocumentServices = {
  getByReportId,
};

export default companyReportDocumentServices;
