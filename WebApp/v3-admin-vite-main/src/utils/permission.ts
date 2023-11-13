import { useUserStoreHook } from "@/store/modules/user"

/** Global permission judgment function, similar to the permission instruction v-permission. */
export const checkPermission = (permissionRoles: string[]): boolean => {
  if (Array.isArray(permissionRoles) && permissionRoles.length > 0) {
    const { user_role } = useUserStoreHook()
    return user_role.some((role) => permissionRoles.includes(role))
  } else {
    console.error("need roles! Like checkPermission(['Company','Agent'])")
    return false
  }
}
