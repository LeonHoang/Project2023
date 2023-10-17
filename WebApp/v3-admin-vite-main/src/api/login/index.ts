import { request } from "@/utils/service"
import type * as Login from "./types/login"

/** Log in and back Token */
export function loginApi(data: Login.LoginRequestData) {
  return request<Login.LoginResponseData>({
    url: "Authentication/Authenticate",
    method: "post",
    data
  })
}