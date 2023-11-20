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
  const processId = ref<number>(0)
  
  const verificationCriterias = ref<VerificationCriteria[]>([])
  const verificationDocuments = ref<VerificationDocument[]>([])
  const verificationProcess = ref<VerificationProcess[]>([])
  const documentReviews = ref<DocumentReview[]>([])
  // const companies = ref<Company[]>([])
  const ratings = ref<VerificationProcessRatingDTO[]>([])

  const userStore = useUserStore()
  const criteriaTypeStore = useCriteriaTypeStore()
  const criteriaStore = useCriteriaStore()
  const criteriaDetailStore = useCriteriaDetailStore()

  const getProcessIdByAccountId = async (accountId: number) => {
    const companyResult = await companyServices.getByAccountId(accountId)
    const verificationProcessServiceResult = await verificationProcessServices.getCurrentPendingByCompanyId(companyResult.data.id)
    processId.value = verificationProcessServiceResult.data.id
  }

  const loadSelfVerification = async (processId: number) => {
    const [process, criterias, documents] = await Promise.all([
      verificationProcessServices.getById(processId),
      verificationCriteriaServices.getAllByProcessId(processId),
      verificationDocumentServices.getAllByProcessId(processId)
    ])

    if(process.data.status === "IN_PROGRESS"){
      editingProcess.value = process.data
    }else{
      editingProcess.value = undefined
    }
    
    verificationCriterias.value = criterias.data
    verificationDocuments.value = documents.data

    criteriaTypeStore.getCriteriaType()
    criteriaStore.getCriteria()
    criteriaDetailStore.getcriteriaDetail()

    if(process.data){
      const companyResult = await companyServices.getById(process.data.companyId)
      company.value = companyResult.data
    }
  }

  const loadLastSelfVerification = async () => {
    const accountId = userStore.user_id
    const companyResult = await companyServices.getByAccountId(accountId)
    if (!companyResult.data) {
      return null;
    }

    company.value = companyResult.data
    const process = await verificationProcessServices.getLastByCompanyId(company.value.id)

    if(process.data){
      const [criterias, documents] = await Promise.all([
        verificationCriteriaServices.getAllByProcessId(process.data.id),
        verificationDocumentServices.getAllByProcessId(process.data.id)
      ])

      editingProcess.value = process.data
      verificationCriterias.value = criterias.data
      verificationDocuments.value = documents.data
  
      criteriaTypeStore.getCriteriaType()
      criteriaStore.getCriteria()
      criteriaDetailStore.getcriteriaDetail()
    }
  }

  const getAllPending = async () => {
    const verificationProcessServiceResult = await verificationProcessServices.getAllPending()
    verificationProcess.value = verificationProcessServiceResult.data
    return verificationProcessServiceResult
  }

  const getAllReviewed = async () => {
    const verificationProcessServiceResult = await verificationProcessServices.getAllReviewed()
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
    // refresh
    await loadSelfVerification(processId.value);
  }

  const removeDocument = async (documentId: number) => {
    await verificationDocumentServices.remove(documentId);
    verificationDocuments.value.filter(
      (document) => document.id !== documentId
    );
  }

  const setProcessId = async (id: number) => {
    processId.value = id
  }
  
  const updateVerificationCriteria = async (data: Partial<VerificationCriteria>) => {
    await verificationCriteriaServices.update(data);
  }

  const updateCriteriaField = async (
    fieldName: string,
    verificationCriteriaId: number,
    value: string,
  ) => {
    const verificationCriteria = _.find(
      verificationCriterias.value,
      (item) => item.id === verificationCriteriaId
    );
    const data: Partial<VerificationCriteria> = {
      ...verificationCriteria,
      [fieldName]: value,
    };
    await verificationCriteriaServices.update(data)

    const criterias =  await verificationCriteriaServices.getAllByProcessId(processId.value)
    verificationCriterias.value = criterias.data
  }
  
  const updateCriteriaCompliance = async (verificationCriteriaId: number, value: boolean) => {
    const verificationCriteria = _.find(
      verificationCriterias.value,
      (item) => item.id === verificationCriteriaId
    );
    const data: Partial<VerificationCriteria> = {
      ...verificationCriteria,
      approvedStatus: value ? 'VERIFIED' : 'REJECTED',
    };

    await verificationCriteriaServices.update(data)

    // refresh
    await loadSelfVerification(processId.value);
  }

  const approveAllCriterias = async (verificationProcessId: number) => {
    await verificationCriteriaServices.approveAll(verificationProcessId);

    // refresh
    await loadSelfVerification(processId.value);
  }

  const submitVerifyReview = async (verificationProcessId: number, assignedAgentId: number) => {
    await verificationProcessServices.submitVerifyReview(verificationProcessId, assignedAgentId);

    // refresh
    await loadSelfVerification(processId.value);
  }
  
  const submitClassify = async (verificationProcessId: number, companyTypeId: number) => {
    await verificationProcessServices.finishVerify(verificationProcessId, companyTypeId);

    // refresh
    await loadSelfVerification(processId.value);
  }

  const rejectProcess = async (verificationProcessId: number) => {
    await verificationProcessServices.rejectProcess(verificationProcessId);
    // refresh
    await loadSelfVerification(processId.value);
  }

  const rejectReviewed = async (verificationProcessId: number) => {
    await verificationProcessServices.rejectReviewed(verificationProcessId);
    // refresh
    await loadSelfVerification(processId.value);
  }

  
  return { 
    verificationProcess, 
    ratings, 
    editingProcess, 
    verificationCriterias, 
    verificationDocuments, 
    company, 
    // companies,
    processId,

    getProcessIdByAccountId,
    setProcessId,
    getAllPending, 
    getAllReviewed,
    getRatingCount,

    submitProcess, 
    submitVerifyReview,
    submitClassify,

    createDocument, 
    removeDocument, 
    loadSelfVerification,
    loadLastSelfVerification,
    
    updateVerificationCriteria,
    updateCriteriaField,
    updateCriteriaCompliance,
    approveAllCriterias,
    
    rejectProcess,
    rejectReviewed
  }
})

/** Use outside setup */
export function useVerificationProcessStoreHook() {
  return useVerificationProcessStore(store)
}
