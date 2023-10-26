import { type RouteRecordRaw, createRouter } from "vue-router"
import { history, flatMultiLevelRoutes } from "./helper"
import routeSettings from "@/config/route"

const Layouts = () => import("@/layouts/index.vue")

/**
  * Resident routing
  * In addition to hidden pages such as redirect/403/404/login, it is recommended to set the Name attribute on other pages
  */
export const constantRoutes: RouteRecordRaw[] = [
  {
    path: "/redirect",
    component: Layouts,
    meta: {
      hidden: true
    },
    children: [
      {
        path: "/redirect/:path(.*)",
        component: () => import("@/views/redirect/index.vue")
      }
    ]
  },
  {
    path: "/403",
    component: () => import("@/views/error-page/403.vue"),
    meta: {
      hidden: true
    }
  },
  {
    path: "/404",
    component: () => import("@/views/error-page/404.vue"),
    meta: {
      hidden: true
    },
    alias: "/:pathMatch(.*)*"
  },
  {
    path: "/login",
    component: () => import("@/views/login/index.vue"),
    meta: {
      hidden: true
    }
  },
  {
    path: "/",
    component: Layouts,
    redirect: "/dashboard",
    children: [
      {
        path: "dashboard",
        component: () => import("@/views/dashboard/index.vue"),
        name: "Dashboard",
        meta: {
          title: "Dash Board",
          svgIcon: "dashboard",
          affix: true
        }
      }
    ]
  },
  {
    path: "/company-verification",
    component: Layouts,
    redirect: "/company-verification/index",
    children: [
      {
        path: "index",
        component: () => import("@/views/company-verification/index.vue"),
        name: "company-verification",
        meta: {
          role: "Company",
          title: "Company Verification",
          svgIcon: "menu"
        }
      }
    ]
  }
]

/**
  * Dynamic routing
  * Used to place routes with permissions (Roles attribute)
  * Must have Name attribute
  */
export const asyncRoutes: RouteRecordRaw[] = [
  {
    path: "/permission",
    component: Layouts,
    redirect: "/permission/page",
    name: "Permission",
    meta: {
      title: "Permission Management",
      svgIcon: "lock",
      role: "admin", // You can set the role in the root route
      alwaysShow: true // Will always show the root menu
    },
    children: [
      {
        path: "page",
        component: () => import("@/views/permission/page.vue"),
        name: "PagePermission",
        meta: {
          title: "Page Permissions",
          role: "admin" // Or set the role in the sub-navigation
        }
      },
      {
        path: "directive",
        component: () => import("@/views/permission/directive.vue"),
        name: "DirectivePermission",
        meta: {
          title: "Command permissions" // If no role is set, it means: the page does not require permissions, but will inherit the role of the root route
        }
      }
    ]
  },
  {
    path: "/:pathMatch(.*)*", // Must put the 'ErrorPage' route at the end, Must put the 'ErrorPage' route at the end
    redirect: "/404",
    name: "ErrorPage",
    meta: {
      hidden: true
    }
  }
]
const router = createRouter({
  history,
  routes: routeSettings.thirdLevelRouteCache ? flatMultiLevelRoutes(constantRoutes) : constantRoutes
})

/** Reset routing */
export function resetRouter() {
  // Note: All dynamic routing routes must have the Name attribute, otherwise they may not be completely reset.
  try {
    router.getRoutes().forEach((route) => {
      const { name, meta } = route
      if (name && meta.role) {
        router.hasRoute(name) && router.removeRoute(name)
      }
    })
  } catch {
    // It’s okay to force refresh the browser, but the interactive experience isn’t very good.
    window.location.reload()
  }
}

export default router
