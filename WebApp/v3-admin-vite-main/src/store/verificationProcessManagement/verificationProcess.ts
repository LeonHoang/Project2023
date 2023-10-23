import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { useUserStore } from "../modules/user"
import verificationProcessServices from "@/services/verificationProcess.services"
import verificationCriteriaServices from "@/services/verificationCriteria.services"
import verificationDocumentServices from "@/services/verificationDocument.services"
import { Company, VerificationCriteria, VerificationDocument, VerificationProcess } from "@/types/models"
import companyServices from "@/services/company.services";

export const useVerificationProcessStore = defineStore("verificationProcess", () => {
  const editingProcess = ref<VerificationProcess>()
  const verificationCriterias = ref<VerificationCriteria[]>([])
  const verificationDocuments = ref<VerificationDocument[]>([])
  const company = ref<Company>()

  const userStore = useUserStore()

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
        // dispatch(criteriaActions.getAll()),
        // dispatch(criteriaTypeActions.getAll()),
        // dispatch(criteriaDetailActions.getAll()),
        // dispatch(companyTypeActions.getAll()),
      ])

      company.value = companyResult.data
      editingProcess.value = verificationProcessServiceResult.data
      verificationCriterias.value = criterias.data
      verificationDocuments.value = documents.data
    } catch (error) {
      // do nothing
    }
  }


  return { editingProcess, verificationCriterias, verificationDocuments, company, loadSelfVerification}
})

/** Use outside setup */
export function useVerificationProcessStoreHook() {
  return useVerificationProcessStore(store)
}
