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
      svgIcon: "memo-circle-check"
    },
    children: [
      {
        path: "index",
        component: () => import("@/views/company-verification/index.vue"),
        name: "company-verification",
        meta: {
          roles: ["Company"],
          title: "Đánh giá, phân loại",
          svgIcon: "memo-circle-check"
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
      title: "Đánh giá, phân loại",
      svgIcon: "process"
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
            path: ":id(\\d+)",
            component: () => import("@/views/verification-process-management/verification/edit.vue"),
            name: "EditVerification",
            meta: {
              roles: ["Agent"],
              title: "đánh giá",
              noCache: true,
              activeMenu: "/verification-process/verification/list",
              hidden: true
            }
          },
          {
            path: "list",
            component: () => import("@/views/verification-process-management/verification/index.vue"),
            name: "verification",
            meta: { roles: ["Agent"], title: "Danh sách đánh giá", svgIcon: "menu" }
          }
        ]
      },
      {
        path: "classify",
        redirect: "/verification-process/classify/list",
        name: "classify",
        meta: {
          roles: ["Agent"],
          title: "Phân loại đánh giá",
          svgIcon: "multiply"
        },
        children: [
          {
            path: ":id(\\d+)",
            component: () => import("@/views/verification-process-management/classify/ClassifyDetail.vue"),
            name: "ClassifyDetail",
            meta: {
              roles: ["Agent"],
              title: "Phân loại đánh giá chi tiết",
              noCache: true,
              activeMenu: "/verification-process/verification/list",
              hidden: true
            }
          },
          {
            path: "list",
            component: () => import("@/views/verification-process-management/classify/index.vue"),
            name: "classify",
            meta: { roles: ["Agent"], title: "Danh sách phân loại", svgIcon: "multiply" }
          }
        ]
      }
    ]
  },
  {
    path: "/verification-result",
    component: Layouts,
    redirect: "/verification-result/list",
    meta: {
      roles: ["Admin", "Agent"],
      title: "Kết quả phân loại doanh nghiệp",
      svgIcon: "bars-filter"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/verification-result/index.vue"),
        name: "company-verification",
        meta: {
          roles: ["Admin", "Agent"],
          title: "Kết quả phân loại",
          svgIcon: "bars-filter"
        }
      },
      {
        path: ":id(\\d+)",
        component: () => import("@/views/verification-result/detail.vue"),
        name: "VerificationDetail",
        meta: {
          roles: ["Admin", "Agent"],
          title: "Kết quả phân loại chi tiết",
          noCache: true,
          activeMenu: "/verification-result/list",
          hidden: true
        }
      }
    ]
  },
  {
    path: "/report-violation",
    component: Layouts,
    redirect: "/report-violation/list",
    meta: {
      roles: ["Agent"],
      title: "Báo cáo sai phạm doanh nghiệp",
      svgIcon: "process"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/report-violation/index.vue"),
        name: "report-violation-list",
        meta: {
          roles: ["Agent"],
          title: "Hoạt động sai phạm DN",
          svgIcon: "menu"
        }
      }
    ]
  },
  ,
  {
    path: "/verify-violation-report",
    component: Layouts,
    redirect: "/verify-violation-report/list",
    meta: {
      roles: ["Admin"],
      title: "Xác minh khiếu nại",
      svgIcon: "process"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/verify-violation-report/index.vue"),
        name: "verify-violation-report-list",
        meta: {
          roles: ["Admin"],
          title: "Xác minh khiếu nại",
          svgIcon: "menu"
        }
      }
    ]
  },
  {
    path: "/company-verifiy-result",
    component: Layouts,
    redirect: "/company-verifiy-result/list",
    meta: {
      roles: ["Company"],
      title: "Kết quả đánh giá",
      svgIcon: "menu"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/company-verifiy-result/index.vue"),
        name: "company-verifiy-result",
        meta: {
          roles: ["Company"],
          title: "Kết quả đánh giá",
          svgIcon: "menu"
        }
      }
    ]
  },
  {
    path: "/company-modification-history",
    component: Layouts,
    redirect: "/company-modification-history/list",
    meta: {
      roles: ["Company"],
      title: "Quá trình đánh giá",
      svgIcon: "process"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/company-modification-history/index.vue"),
        name: "CompanyModification",
        meta: {
          roles: ["Company"],
          title: "Quá trình đánh giá",
          svgIcon: "process"
        }
      },
      {
        path: ":id(\\d+)",
        component: () => import("@/views/company-modification-history/detail.vue"),
        name: "CompanyModificationDetail",
        meta: {
          roles: ["Company"],
          title: "Quá trình đánh giá chi tiết",
          noCache: true,
          activeMenu: "/company-modification-history",
          hidden: true
        }
      }
    ]
  },
  {
    path: "/company-management",
    component: Layouts,
    redirect: "/company-management/list",
    meta: {
      roles: ["Admin"],
      title: "Quản lý doanh nghiệp",
      svgIcon: "users-alt"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/company-management/index.vue"),
        name: "CompanyList",
        meta: {
          roles: ["Admin"],
          title: "Quản lý doanh nghiệp",
          svgIcon: "users-alt"
        }
      },
      {
        path: ":id(\\d+)",
        component: () => import("@/views/company-management/detail.vue"),
        name: "CompanyDetail",
        meta: {
          roles: ["Admin"],
          title: "Chi tiết doanh nghiệp",
          noCache: true,
          activeMenu: "/company-management",
          hidden: true
        }
      }
    ]
  },
  {
    path: "/agent-management",
    component: Layouts,
    redirect: "/agent-management/list",
    meta: {
      roles: ["Admin"],
      title: "Quản lý kiểm lâm tỉnh",
      svgIcon: "menu"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/agent-management/index.vue"),
        name: "AgentList",
        meta: {
          roles: ["Admin"],
          title: "Quản lý kiểm lâm tỉnh",
          svgIcon: "menu"
        }
      }
    ]
  },
  {
    path: "/third-party-management",
    component: Layouts,
    redirect: "/third-party-management/list",
    meta: {
      roles: ["Admin"],
      title: "Quản lý bên thụ hưởng",
      svgIcon: "menu"
    },
    children: [
      {
        path: "list",
        component: () => import("@/views/third-party-management/index.vue"),
        name: "3rdList",
        meta: {
          roles: ["Admin"],
          title: "Quản lý bên thụ hưởng",
          svgIcon: "menu"
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
      if (name && meta.roles?.length) {
        router.hasRoute(name) && router.removeRoute(name)
      }
    })
  } catch {
    // It’s okay to force refresh the browser, but the interactive experience isn’t very good.
    window.location.reload()
  }
}

export default router
