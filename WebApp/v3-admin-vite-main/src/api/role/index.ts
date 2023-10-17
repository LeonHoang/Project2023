import { request } from "@/utils/service"
import type * as Role from "./types/role"


/** Log in and back Token */
export function getRoleByIdApi(id: number) {
  return request<Role.RoleResponseData>({
    url: `Role/${id}`,
    method: "get"
  })
}