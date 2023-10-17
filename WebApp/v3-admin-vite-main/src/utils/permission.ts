import { useUserStoreHook } from "@/store/modules/user"

/** Global permission judgment function, similar to the permission instruction v-permission. */
export const checkPermission = (permissionRoles: string): boolean => {
  if (permissionRoles.length > 0) {
    const { user_role } = useUserStoreHook()
    return permissionRoles === user_role
  } else {
    console.error("need roles! Like checkPermission(['Admin','Agent'])")
    return false
  }
}
