import { LogInDTO, LogInResponseDTO } from "@/types/dto";
import request from "@/utils/service";

// function validate() {
//   return request.get('/Authentication/Validate');
// }

function loginApi(payload: LogInDTO): Promise<ApiResponseData<LogInResponseDTO>> {
  return request.post('/Authentication/AuthenticateManagement', payload);
}

const authenticationServices = {
  loginApi
};

export default authenticationServices;
