import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { Company } from "@/types/models";
import companyServices from "@/services/company.services";
import { CompanyRegistrationDTO } from "@/types/dto";

export const useCompanyStore = defineStore("company", () => {
  const companies = ref<Company[]>()

  const getAll = async () => {
    const result = await companyServices.getAll()
    companies.value = result.data
    return result
  }

  const getById = async (id: number) => {
    const result = await companyServices.getById(id)
    return result
  }

  const registerCompany = async (payload: CompanyRegistrationDTO) => {
    return await companyServices.registerCompany(payload)
  }

  const deleteCompany = async (id: number) => {
    return await companyServices.deleteCompany(id)
  }

  return { companies, getAll, getById, registerCompany, deleteCompany }
})

/** Use outside setup */
export function useCompanyStoreHook() {
  return useCompanyStore(store)
}
