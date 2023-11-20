import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { CompanyType } from "@/types/models";
import companyTypeServices from "@/services/companyType.services";

export const useCompanyTypeStore = defineStore("companyType", () => {
  const companyTypes = ref<CompanyType[]>()

  const getAll = async () => {
    const result = await companyTypeServices.getAll()
    companyTypes.value = result.data
  }

  return { companyTypes, getAll }
})

/** Use outside setup */
export function useCompanyTypeStoreHook() {
  return useCompanyTypeStore(store)
}
