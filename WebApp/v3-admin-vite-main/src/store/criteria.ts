import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import criteriasServices from "@/services/criteria.services"
import { Criteria } from "@/types/models";

export const useCriteriaStore = defineStore("criteria", () => {
  const criterias = ref<Criteria[]>()

  const getCriteria = async () => {
      const criteriaResult = await criteriasServices.getAll()
      criterias.value = criteriaResult.data
  }


  return { criterias, getCriteria }
})

/** Use outside setup */
export function useCriteriaStoreHook() {
  return useCriteriaStore(store)
}
