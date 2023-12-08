import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { ViolationReport, ViolationReportDocument } from "@/types/models";
import violationReportServices from "@/services/violationReport.services";
import violationReportDocumentServices from "@/services/violationReportDocument.services";
import { ViolationReportDTO } from "@/types/dto";

export const useViolationReportStore = defineStore("violationReport", () => {
  const violationReports = ref<ViolationReport[]>()
  const violationReportDocuments = ref<ViolationReportDocument[]>([])

  const getAll = async () => {
    const result = await violationReportServices.getAll()
    violationReports.value = result.data
    return result
  }

  const getViolationReportDocument = async (reportId: number) => {
    const result = await violationReportDocumentServices.getByReportId(reportId)
    violationReportDocuments.value = result.data
    return result
  }

  const isCanCreateReport = async (id: number) => {
    const {data} = await violationReportServices.CanCreateReport(id)
    return data
  }

  const createViolationReport = async (payload: ViolationReportDTO) => {
    return await violationReportServices.create(payload)
  }

  const approveViolationReport = async (id: number) => {
    return await violationReportServices.approve(id)
  }

  const rejectViolationReport = async (id: number) => {
    return await violationReportServices.reject(id)
  }

  return { violationReports, violationReportDocuments,  getAll, getViolationReportDocument, isCanCreateReport, createViolationReport, approveViolationReport, rejectViolationReport }
})

/** Use outside setup */
export function useViolationReportStoreHook() {
  return useViolationReportStore(store)
}
