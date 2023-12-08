import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { Province } from "@/types/models";
import agentServices from "@/services/province.services";

export const useProvinceStore = defineStore("province", () => {
  const provinces = ref<Province[]>()

  const getAllProvinces = async () => {
    const result = await agentServices.getAll()
    provinces.value = result.data
  }

  return { provinces, getAllProvinces }
})

/** Use outside setup */
export function useProvinceStoreHook() {
  return useProvinceStore(store)
}
