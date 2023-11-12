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
  }
]

/**
  * Dynamic routing
  * Used to place routes with permissions (Roles attribute)
  * Must have Name attribute
  */
export const asyncRoutes: RouteRecordRaw[] = [
  {
    path: "/company-verification",
    component: Layouts,
    redirect: "/company-verification/index",
    meta: {
      roles: ["Company"],
      title: "Đánh giá, phân loại",
      svgIcon: "menu"
    },
    children: [
      {
        path: "index",
        component: () => import("@/views/company-verification/index.vue"),
        name: "company-verification",
        meta: {
          roles: ["Company"],
          title: "Đánh giá, phân loại",
          svgIcon: "menu"
        }
      }
    ]
  },
  {
    path: "/verification-process",
    component: Layouts,
    redirect: "/verification-process/verification",
    name: "verificationMenu",
    meta: {
      roles: ["Agent"],
      title: "Đánh giá, xác minh",
      svgIcon: "menu"
    },
    children: [
      {
        path: "verification",
        redirect: "/verification-process/verification/list",
        name: "verification",
        meta: {
          roles: ["Agent"],
          title: "Đánh giá sự tuân thủ"
        },
        children: [
          {
            path: 'edit/:id(\\d+)',
            component: () => import('@/views/verification-process-management/verification/edit.vue'),
            name: 'EditVerification',
            meta: { 
              roles: ["Agent"],
              title: 'đánh giá', 
              noCache: true, 
              activeMenu: '/verification-process/verification/list', 
              hidden: true
            },
          },
          {
            path: 'list',
            component: () => import("@/views/verification-process-management/verification/index.vue"),
            name: 'VerificationList',
            meta: {roles: ["Agent"], title: 'Danh sách đánh giá', icon: 'list' }
          }
        ]
      },
      {
        path: "menu2",
        component: () => import("@/views/verification-process-management/menu2/index.vue"),
        name: "Menu2",
        meta: {
          roles: ["Agent"],
          title: "menu2",
          keepAlive: true
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
