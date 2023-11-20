import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import criteriaDetailServices from "@/services/criteriaDetail.services"
import { CriteriaDetail } from "@/types/models";

export const useCriteriaDetailStore = defineStore("criteriaDetail", () => {
  const criteriaDetail = ref<CriteriaDetail[]>()

  const getcriteriaDetail = async () => {
      const criteriaDetailResult = await criteriaDetailServices.getAll()
      criteriaDetail.value = criteriaDetailResult.data
  }

  return { criteriaDetail, getcriteriaDetail }
})

/** Use outside setup */
export function useCriteriaDetailStoreHook() {
  return useCriteriaDetailStore(store)
}
