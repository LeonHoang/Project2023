import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { useCriteriaTypeStore } from "@/store/criteriaType"
import { useCriteriaStore } from "@/store/criteria"
import { useCriteriaDetailStore } from "@/store/criteriaDetail"

import { defineStore } from "pinia"
import { useUserStore } from "./modules/user"
import verificationProcessServices from "@/services/verificationProcess.services"
import verificationCriteriaServices from "@/services/verificationCriteria.services"
import verificationDocumentServices from "@/services/verificationDocument.services"

import { Company, DocumentReview, VerificationCriteria, VerificationDocument, VerificationProcess } from "@/types/models"
import companyServices from "@/services/company.services";
import { VerificationProcessRatingDTO } from "@/types/dto";

export const useVerificationProcessStore = defineStore("verificationProcess", () => {
  const editingProcess = ref<VerificationProcess>()
  const editingDocument = ref<VerificationDocument>()
  const company = ref<Company>()

  const verificationCriterias = ref<VerificationCriteria[]>([])
  const verificationDocuments = ref<VerificationDocument[]>([])
  const verificationProcess = ref<VerificationProcess[]>([])
  const documentReviews = ref<DocumentReview[]>([])
  const companies = ref<Company[]>([])
  const ratings = ref<VerificationProcessRatingDTO[]>([])

  const userStore = useUserStore()
  const criteriaTypeStore = useCriteriaTypeStore()
  const criteriaStore = useCriteriaStore()
  const criteriaDetailStore = useCriteriaDetailStore()

  const getProcessIdByAccountId = async (accountId: number) => {
    const companyResult = await companyServices.getByAccountId(accountId)
    const verificationProcessServiceResult = await verificationProcessServices.getCurrentPendingByCompanyId(companyResult.data.id)
    return verificationProcessServiceResult.data.id
  }

  const loadSelfVerification = async (processId: number) => {
    const [process, criterias, documents] = await Promise.all([
      verificationProcessServices.getById(processId),
      verificationCriteriaServices.getAllByProcessId(processId),
      verificationDocumentServices.getAllByProcessId(processId)
    ])

    criteriaTypeStore.getCriteriaType()
    criteriaStore.getCriteria()
    criteriaDetailStore.getcriteriaDetail()

    editingProcess.value = process.data
    verificationCriterias.value = criterias.data
    verificationDocuments.value = documents.data
    
    const companiesResult = await companyServices.getAll()
    companies.value = companiesResult.data

    const companyResult = await companyServices.getById(process.data.companyId)
    company.value = companyResult.data
  }

  const getAllPending = async () => {
    const verificationProcessServiceResult = await verificationProcessServices.getAllPending()
    verificationProcess.value = verificationProcessServiceResult.data
    return verificationProcessServiceResult
  }
  
  const getRatingCount = async (processIds: number[]) => {
    const {data} = await verificationProcessServices.getRatingCount(processIds)
    ratings.value = data
  }

  const submitProcess = async (id: number) => {
    const {data} = await verificationProcessServices.submitProcess(id)
    editingProcess.value = data
  }
  
  const createDocument = async (data: Partial<VerificationDocument>) => {
    await verificationDocumentServices.create(data);
    // refesh
    await loadSelfVerification();
  }

  const removeDocument = async (documentId: number) => {
    await verificationDocumentServices.remove(documentId);
    verificationDocuments.value.filter(
      (document) => document.id !== documentId
    );
  }

  const updateVerificationCriteria = async (data: Partial<VerificationCriteria>) => {
    await verificationCriteriaServices.update(data);
  }

  return { 
    verificationProcess, 
    ratings, 
    editingProcess, 
    verificationCriterias, 
    verificationDocuments, 
    company, 
    companies,

    getProcessIdByAccountId, 
    getAllPending, 
    getRatingCount, 
    submitProcess, 
    createDocument, 
    removeDocument, 
    loadSelfVerification, 
    updateVerificationCriteria}
})

/** Use outside setup */
export function useVerificationProcessStoreHook() {
  return useVerificationProcessStore(store)
}
