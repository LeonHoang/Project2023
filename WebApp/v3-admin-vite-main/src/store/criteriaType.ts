import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import criteriaTypeServices from "@/services/criteriaType.services"
import { CriteriaType } from "@/types/models";

export const useCriteriaTypeStore = defineStore("criteriaType", () => {
  const criteriaType = ref<CriteriaType[]>()

  const getCriteriaType = async () => {
      const criteriaTypeResult = await criteriaTypeServices.getAll()
      criteriaType.value = criteriaTypeResult.data
  }

  return { criteriaType, getCriteriaType }
})

/** Use outside setup */
export function useCriteriaTypeStoreHook() {
  return useCriteriaTypeStore(store)
}
