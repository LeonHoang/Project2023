import { type Directive } from "vue"
import { useUserStoreHook } from "@/store/modules/user"

/** Permission command, similar to the permission judgment function checkPermission */
export const permission: Directive = {
  mounted(el, binding) {
    const { value: permissionRoles } = binding
    const { user_role } = useUserStoreHook()
    if (permissionRoles.length > 0) {
      const hasPermission = permissionRoles === user_role
      // hasPermission || (el.style.display = "none")
      hasPermission || el.parentNode?.removeChild(el)
    }
  }
}
