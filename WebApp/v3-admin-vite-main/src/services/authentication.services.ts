import { LogInDTO, LogInResponseDTO } from "@/types/dto";
import { Account } from "@/types/models";
import request from "@/utils/service";

// function validate() {
//   return request.get('/Authentication/Validate');
// }

function loginApi(payload: LogInDTO): Promise<ApiResponseData<LogInResponseDTO>> {
  return request.post('/Authentication/AuthenticateManagement', payload);
}

function getUserInfo(): Promise<ApiResponseData<Account>> {
  return request.get('/Authentication/Validate');
}

const authenticationServices = {
  loginApi,
  getUserInfo
};

export default authenticationServices;
