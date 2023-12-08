import { AgentCreateDTO } from '@/types/dto';
import { Agent, AgentAssignment } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<Agent[]>> {
  return request.get(`/Agent/GetAll`);
}

function getAllAgents(): Promise<ApiResponseData<Agent[]>> {
  return request.get(`/Agent/GetAllAgents`);
}

function getByAccountId(accountId: number): Promise<ApiResponseData<Agent>> {
  return request.get(`/Agent/ByAccount/${accountId}`);
}

function getById(id: number): Promise<ApiResponseData<Agent>> {
  return request.get(`/Agent/ById/${id}`);
}

function getAssignmentByAgentId(agentId: number): Promise<ApiResponseData<AgentAssignment[]>> {
  return request.get(`/Agent/GetAssignments/${agentId}`);
}

function create(payload: AgentCreateDTO): Promise<ApiResponseData<Agent>> {
  return request.post('/Agent/Add', payload);
}

function updateAgent(agent: Partial<Agent>): Promise<ApiResponseData<Agent>> {
  return request.put(`/Agent/Update`, agent);
}

function deleteAgent(id: number){
  return request.del(`/Agent/Delete/${id}`);
}

function activateAgent(id: number){
  return request.post(`/Agent/Activate/${id}`);
}

const agentServices = {
  getAll,
  getAllAgents,
  getByAccountId,
  getById,
  getAssignmentByAgentId,
  create,
  updateAgent,
  deleteAgent,
  activateAgent
};

export default agentServices;
