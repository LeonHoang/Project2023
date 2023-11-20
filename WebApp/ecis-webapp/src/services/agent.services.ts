import { AgentCreateDTO } from '@/types/dto';
import { Agent, AgentAssignment } from '@/types/models';
import request from '../utils/service';

function getAll(): Promise<ApiResponseData<ApiResponseData<Agent[]>>> {
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

const agentServices = {
  getAll,
  getAllAgents,
  getByAccountId,
  getById,
  getAssignmentByAgentId,
  create,
};

export default agentServices;
