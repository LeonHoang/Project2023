import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { ThirdParty } from "@/types/models";
import thirdPartyServices from "@/services/thirdParty.services";
import { ThirdPartyRegisterDTO } from "@/types/dto";

export const useThirdPartyStore = defineStore("thirdParty", () => {
  const companies = ref<ThirdParty[]>()

  const getAll = async () => {
    const result = await thirdPartyServices.getAll()
    companies.value = result.data
    return result
  }

  const getById = async (id: number) => {
    const result = await thirdPartyServices.getById(id)
    return result
  }

  const registerThirdParty = async (payload: ThirdPartyRegisterDTO) => {
    return await thirdPartyServices.create(payload)
  }

  const updateThirdParty = async (data: Partial<ThirdParty>) => {
    await thirdPartyServices.updateThirdParty(data);
  }


  const deleteThirdParty = async (id: number) => {
    return await thirdPartyServices.deleteThirdParty(id)
  }

  const activateThirdParty = async (id: number) => {
    return await thirdPartyServices.activateThirdParty(id)
  }

  return { companies, getAll, getById, registerThirdParty, updateThirdParty, deleteThirdParty, activateThirdParty }
})

/** Use outside setup */
export function useThirdPartyStoreHook() {
  return useThirdPartyStore(store)
}
