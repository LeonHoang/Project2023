import { ChangePasswordDTO } from "@/types/dto";
import request from "@/utils/service";

function changePassword(payload: ChangePasswordDTO): Promise<boolean> {
  return request.post('/Account/ChangePassword', payload);
}

const accountServices = {
  changePassword
};

export default accountServices;