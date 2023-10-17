import { ref } from "vue"
import store from "@/store"
import { defineStore } from "pinia"
import { usePermissionStore } from "./permission"
import { useTagsViewStore } from "./tags-view"
import { useSettingsStore } from "./settings"
import { getToken, removeToken, setToken } from "@/utils/cache/cookies"
import router, { resetRouter } from "@/router"
import { loginApi } from "@/api/login"
import { getRoleByIdApi } from "@/api/role"
import { type LoginRequestData } from "@/api/login/types/login"
import { type RouteRecordRaw } from "vue-router"
import routeSettings from "@/config/route"

export const useUserStore = defineStore("user", () => {
  const user_email = ref<string>("")
  const token = ref<string>(getToken() || "")
  const user_role = ref<string>("")

  const permissionStore = usePermissionStore()
  const tagsViewStore = useTagsViewStore()
  const settingsStore = useSettingsStore()

  /** 设置角色数组 */
  const setRole = (value: string) => {
    user_role.value = value
  }
  /** Log in */
  const login = async ({ email, password }: LoginRequestData) => {
    const {data} = await loginApi({ email, password })
    setToken(data.token)
    token.value = data.token
    user_email.value = email

    getUserRole(data.roleId)
  }

  const getUserRole = async (id: number) => {
    const {data} = await getRoleByIdApi(id)
    user_role.value = data? data.roleName : routeSettings.defaultRoles
  }

  /** Switch roles */
  const changeRole = async (role: string) => {
    const newToken = "token-" + role
    token.value = newToken
    setToken(newToken)
    permissionStore.setRoutes(user_role.value)
    resetRouter()
    permissionStore.dynamicRoutes.forEach((item: RouteRecordRaw) => {
      router.addRoute(item)
    })
    _resetTagsView()
  }

  /** 登出 */
  const logout = () => {
    resetToken()
    resetRouter()
    _resetTagsView()
  }

  /** 重置 Token */
  const resetToken = () => {
    removeToken()
    token.value = ""
    user_role.value = ""
  }

  /** 重置 Visited Views 和 Cached Views */
  const _resetTagsView = () => {
    if (!settingsStore.cacheTagsView) {
      tagsViewStore.delAllVisitedViews()
      tagsViewStore.delAllCachedViews()
    }
  }

  return { user_email, token, user_role, setRole, changeRole, login, logout, resetToken }
})

/** 在 setup 外使用 */
export function useUserStoreHook() {
  return useUserStore(store)
}
