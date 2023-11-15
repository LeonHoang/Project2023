import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { CompanyTypeModification } from "@/types/models";
import companyTypeModificationServices from "@/services/companyTypeModification.services";

export const useCompanyTypeModificationStore = defineStore("companyTypeModification", () => {
  const companyTypeModifications = ref<CompanyTypeModification[]>()

  const getReportPrivate = async (month: number, year: number) => {
    const result = await companyTypeModificationServices.getReportPrivate(month, year);
    companyTypeModifications.value = result.data
    
    return result
  }

  return { companyTypeModifications, getReportPrivate }
})

/** Use outside setup */
export function useCompanyTypeModificationStoreHook() {
  return useCompanyTypeModificationStore(store)
}
