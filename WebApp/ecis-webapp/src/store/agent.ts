import { ref } from "vue"
import _ from "lodash";
import store from "@/store"
import { defineStore } from "pinia"
import { Agent } from "@/types/models";
import agentServices from "@/services/agent.services";
import { AgentCreateDTO } from "@/types/dto";

export const useAgentStore = defineStore("agent", () => {
  const agents = ref<Agent[]>()

  const getAllAgents = async () => {
    const result = await agentServices.getAllAgents()
    agents.value = result.data
    return result
  }

  const getAll = async () => {
    const result = await agentServices.getAll()
    agents.value = result.data
    return result
  }

  const createAgent = async (payload: AgentCreateDTO) => {
    return await agentServices.create(payload)
  }

  const updateAgent = async (data: Partial<Agent>) => {
    await agentServices.updateAgent(data);
  }

  const deleteAgent = async (id: number) => {
    return await agentServices.deleteAgent(id)
  }

  const activateAgent = async (id: number) => {
    return await agentServices.activateAgent(id)
  }

  return { agents, getAll, getAllAgents, createAgent, updateAgent, deleteAgent, activateAgent }
})

/** Use outside setup */
export function useAgentStoreHook() {
  return useAgentStore(store)
}
