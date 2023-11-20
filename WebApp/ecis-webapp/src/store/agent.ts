import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { Agent } from "@/types/models";
import agentServices from "@/services/agent.services";

export const useAgentStore = defineStore("agent", () => {
  const agents = ref<Agent[]>()

  const getAllAgents = async () => {
    const result = await agentServices.getAllAgents()
    agents.value = result.data
  }

  return { agents, getAllAgents }
})

/** Use outside setup */
export function useAgentStoreHook() {
  return useAgentStore(store)
}
