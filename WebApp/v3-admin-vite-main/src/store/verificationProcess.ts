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

export const useVerificationProcessStore = defineStore("verificationProcess", () => {
  const editingProcess = ref<VerificationProcess>()
  const editingDocument = ref<VerificationDocument>()
  const verificationCriterias = ref<VerificationCriteria[]>([])
  const verificationDocuments = ref<VerificationDocument[]>([])
  const documentReviews = ref<DocumentReview[]>([])
  const company = ref<Company>()


  const userStore = useUserStore()
  const verificationProcessStore = useVerificationProcessStore()
  const criteriaTypeStore = useCriteriaTypeStore();
  const criteriaStore = useCriteriaStore();
  const criteriaDetailStore = useCriteriaDetailStore();

  /** loadSelfVerification */
  const loadSelfVerification = async () => {
    try {
      // userStore.getUserInfo()
      const userId = userStore.user_id
      const companyResult = await companyServices.getByAccountId(userId)

      const verificationProcessServiceResult = await verificationProcessServices.getCurrentPendingByCompanyId(companyResult.data.id)
      const processId = verificationProcessServiceResult.data.id

      const [criterias, documents] = await Promise.all([
        verificationCriteriaServices.getAllByProcessId(processId),
        verificationDocumentServices.getAllByProcessId(processId)
      ])

      verificationProcessStore.loadSelfVerification()
      criteriaTypeStore.getCriteriaType()
      criteriaStore.getCriteria()
      criteriaDetailStore.getcriteriaDetail()

      company.value = companyResult.data
      editingProcess.value = verificationProcessServiceResult.data
      verificationCriterias.value = criterias.data
      verificationDocuments.value = documents.data
    } catch (error) {
      // do nothing
    }
  }

  const updateVerificationCriteria = async (payload: Partial<VerificationCriteria>) => {
    await verificationCriteriaServices.update(payload);
}

  return { editingProcess, verificationCriterias, verificationDocuments, company, 
    loadSelfVerification, updateVerificationCriteria}
})

/** Use outside setup */
export function useVerificationProcessStoreHook() {
  return useVerificationProcessStore(store)
}
