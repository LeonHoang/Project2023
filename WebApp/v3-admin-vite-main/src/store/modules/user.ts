import { ref } from "vue"
import store from "@/store"
import { defineStore } from "pinia"
import { usePermissionStore } from "./permission"
import { useTagsViewStore } from "./tags-view"
import { useSettingsStore } from "./settings"
import { getToken, removeToken, setToken } from "@/utils/cache/cookies"
import router, { resetRouter } from "@/router"

import authenticationServices from "@/services/authentication.services"
import roleServices from "@/services/role.services"
import { type LogInDTO } from "@/types/dto"
import { type RouteRecordRaw } from "vue-router"
import routeSettings from "@/config/route"

export const useUserStore = defineStore("user", () => {
  const user_email = ref<string>("")
  const token = ref<string>(getToken() || "")
  const user_id = ref<number>(0)
  const user_role = ref<string[]>([])

  const permissionStore = usePermissionStore()
  const tagsViewStore = useTagsViewStore()
  const settingsStore = useSettingsStore()

  /** setRole */
  const setRole = (value: string[]) => {
    user_role.value = value
  }
  /** Log in */
  const login = async ({ email, password }: LogInDTO) => {
    const {data} = await authenticationServices.loginApi({ email, password })
    setToken(data.token)
    token.value = data.token
    user_email.value = data.email

    // if(data.roleName?.length > 0){
    //   user_role.value = []
    //   user_role.value.push(data.roleName)
    // }else{
    //   user_role.value = routeSettings.defaultRoles
    // }
  }

  /** Get user details */
  const getUserInfo = async () => {
    const { data } = await authenticationServices.getUserInfo()
    user_email.value = data.email
    user_id.value = data.id
    if(data.role?.roleName.length > 0){
      user_role.value = []
      user_role.value.push(data.role?.roleName)
    }else{
      user_role.value = routeSettings.defaultRoles
    }
  }

  /** logout */
  const logout = () => {
    resetToken()
    resetRouter()
    _resetTagsView()
  }

  /** reset Token */
  const resetToken = () => {
    removeToken()
    token.value = ""
    user_role.value = []
  }

  /** Reset Visited Views and Cached Views */
  const _resetTagsView = () => {
    if (!settingsStore.cacheTagsView) {
      tagsViewStore.delAllVisitedViews()
      tagsViewStore.delAllCachedViews()
    }
  }

  return { user_id, user_email, token, user_role, getUserInfo, setRole, login, logout, resetToken }
})

/** Use outside setup */
export function useUserStoreHook() {
  return useUserStore(store)
}
