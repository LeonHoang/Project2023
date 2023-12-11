import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { Province } from "@/types/models";
import provinceServices from "@/services/province.services";

export const useProvinceStore = defineStore("province", () => {
  const provinces = ref<Province[]>()

  const getAllProvinces = async () => {
    const result = await provinceServices.getAll()
    provinces.value = result.data
  }

  const getAssignmentsByProvinceId = async (id: number) => {
    return await provinceServices.getAssignmentsByProvinceId(id)
  }
  return { provinces, getAllProvinces, getAssignmentsByProvinceId }
})

/** Use outside setup */
export function useProvinceStoreHook() {
  return useProvinceStore(store)
}
