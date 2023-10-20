import axios, { type AxiosInstance, type AxiosRequestConfig } from "axios"
import { useUserStoreHook } from "@/store/modules/user"
import { ElMessage } from "element-plus"
import { get, merge } from "lodash-es"
import { getToken } from "./cache/cookies"
import { config } from "process"

/** Log out and force refresh the page (will redirect to the login page) */
function logout() {
   useUserStoreHook().logout()
   location.reload()
}

/** Create request instance */
function createService() {
   //Create an axios instance named service
   const service = axios.create()
   //Request interception
   service.interceptors.request.use(
     (config) => config,
     // Failed to send
     (error) => Promise.reject(error)
   )
   //Response interception (can be adjusted according to specific business)
   service.interceptors.response.use(
     (response) => {
       return response
     },
     (error) => {
       // status is the HTTP status code
       const status = get(error, "response.status")
       switch (status) {
         case 400:
            error.message = "Request error"
            break
          case 401:
            // When Token expires
            logout()
            break
          case 403:
            error.message = "Access Denied"
            break
          case 404:
            error.message = "Error requesting address"
            break
          case 408:
            error.message = "Request timeout"
            break
          case 500:
            error.message = "Server internal error"
            break
          case 501:
            error.message = "Service not implemented"
            break
          case 502:
            error.message = "Gateway error"
            break
          case 503:
            error.message = "Service unavailable"
            break
          case 504:
            error.message = "Gateway timeout"
            break
          case 505:
            error.message = "HTTP version not supported"
           break
         default:
           break
       }
       ElMessage.error(error.message)
       return Promise.reject(error)
     }
   )
   return service
}

/** Create request method */
function createRequest(instance: AxiosInstance) {
   return function <T>(config: AxiosRequestConfig): Promise<T> {
     const token = getToken()
     const defaultConfig = {
       headers: {
         //Carry Token
         Authorization: token ? `Bearer ${token}` : undefined,
         "Content-Type": "application/json"
       },
       timeout: 5000,
       baseURL: import.meta.env.VITE_BASE_API,
       data: {}
     }
     // Merge the default configuration defaultConfig and the incoming custom configuration config into mergeConfig
     const mergeConfig = merge(defaultConfig, config)
     return instance(mergeConfig)
   }
}

/** Instance used for network requests */
const instance = createService()

/** Method used for network requests */
const mergeRequest = createRequest(instance)

const request = {
  get: <T>(path: string, body?: any) => mergeRequest<T>({url: path, method: "get", data: body}),
  post: <T>(path: string, body?: any) => mergeRequest<T>({url: path, method: "post", data: body}),
  patch: <T>(path: string, body?: any) => mergeRequest<T>({url: path, method: "patch", data: body}),
  put: <T>(path: string, body?: any) => mergeRequest<T>({url: path, method: "put", data: body}),
  del: <T>(path: string) => mergeRequest<T>({url: path, method: "delete"}),
};

export default request;