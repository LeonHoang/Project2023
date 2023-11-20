import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { CompanyTypeModification } from "@/types/models";
import companyTypeModificationServices from "@/services/companyTypeModification.services";
import companyServices from "@/services/company.services";
import { useUserStore } from "./modules/user";

export const useCompanyTypeModificationStore = defineStore("companyTypeModification", () => {
  const companyTypeModifications = ref<CompanyTypeModification[]>()
  const userStore = useUserStore()
  
  const getReportPrivate = async (month: number, year: number) => {
    const result = await companyTypeModificationServices.getReportPrivate(month, year);
    companyTypeModifications.value = result.data
    
    return result
  }

  const getByCompanyId = async () => {
    const accountId = userStore.user_id
    const companyResult = await companyServices.getByAccountId(accountId)
    if (!companyResult.data) {
      return null;
    }

    const result = await companyTypeModificationServices.getByCompanyId(companyResult.data.id);
    companyTypeModifications.value = result.data
    
    return result
  }

  return { companyTypeModifications, getReportPrivate, getByCompanyId }
})

/** Use outside setup */
export function useCompanyTypeModificationStoreHook() {
  return useCompanyTypeModificationStore(store)
}
