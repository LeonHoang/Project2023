import router from "@/router"
import { useUserStoreHook } from "@/store/modules/user"
import { usePermissionStoreHook } from "@/store/modules/permission"
import { ElMessage } from "element-plus"
import { setRouteChange } from "@/hooks/useRouteListener"
import { useTitle } from "@/hooks/useTitle"
import { getToken } from "@/utils/cache/cookies"
import { fixBlankPage } from "@/utils/fix-blank-page"
import routeSettings from "@/config/route"
import isWhiteList from "@/config/white-list"
import NProgress from "nprogress"
import "nprogress/nprogress.css"

const { setTitle } = useTitle()
NProgress.configure({ showSpinner: false })

router.beforeEach(async (to, _from, next) => {
   fixBlankPage()
   NProgress.start()
   const userStore = useUserStoreHook()
   const permissionStore = usePermissionStoreHook()
   const token = getToken()

   // Determine whether the user is logged in
   if (!token) {
     // If it is in the login-free whitelist, enter directly
     if (isWhiteList(to)) {
       next()
     } else {
       // Other pages without access rights will be redirected to the login page
       NProgress.done()
       next("/login")
     }
     return
   }

   // If you have logged in and are ready to enter the login page, redirect to the home page
   if (to.path === "/login") {
     NProgress.done()
     return next({ path: "/" })
   }

   // If the user has obtained its permission role
   if (userStore.user_role.length !== 0) return next()
   
   next()
   // Otherwise, re-acquire the permission role
  //  try {
  //    if (routeSettings.async) {
  //      // 注意：角色必须是一个数组！ 例如: ['admin'] 或 ['developer', 'editor']
  //      await userStore.getInfo()
  //      const user_role = userStore.user_role
  //      // Generate accessible Routes based on user_role (accessible routes = resident routes + dynamic routes with access rights)
  //      permissionStore.setRoutes(user_role)
  //    } else {
  //      // If the dynamic routing function is not enabled, the default role is enabled.
  //      userStore.setRole(routeSettings.defaultRoles)
  //      permissionStore.setRoutes(routeSettings.defaultRoles)
  //    }
  //    // Add 'dynamic route with access permission' to Router
  //    permissionStore.dynamicRoutes.forEach((route) => router.addRoute(route))
  //    // Make sure adding the route is complete
  //    // Set replace: true, so navigation will not leave a history
  //    next({ ...to, replace: true })
  //  } catch (err: any) {
  //    // If any error occurs during the process, the Token will be reset directly and redirected to the login page.
  //    userStore.resetToken()
  //    ElMessage.error(err.message || "An error occurred in the routing guard process")
  //    NProgress.done()
  //    next("/login")
  //  }
})

router.afterEach((to) => {
   setRouteChange(to)
   setTitle(to.meta.title)
   NProgress.done()
})