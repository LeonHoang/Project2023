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
          title: "首页",
          svgIcon: "dashboard",
          affix: true
        }
      }
    ]
  },
  {
    path: "/unocss",
    component: Layouts,
    redirect: "/unocss/index",
    children: [
      {
        path: "index",
        component: () => import("@/views/unocss/index.vue"),
        name: "UnoCSS",
        meta: {
          role: "editor",
          title: "UnoCSS",
          svgIcon: "unocss"
        }
      }
    ]
  },
  {
    path: "/link",
    meta: {
      title: "外链",
      svgIcon: "link"
    },
    children: [
      {
        path: "https://juejin.cn/post/7089377403717287972",
        component: () => {},
        name: "Link1",
        meta: {
          title: "中文文档"
        }
      },
      {
        path: "https://juejin.cn/column/7207659644487139387",
        component: () => {},
        name: "Link2",
        meta: {
          title: "新手教程"
        }
      }
    ]
  },
  {
    path: "/table",
    component: Layouts,
    redirect: "/table/element-plus",
    name: "Table",
    meta: {
      title: "表格",
      elIcon: "Grid"
    },
    children: [
      {
        path: "element-plus",
        component: () => import("@/views/table/element-plus/index.vue"),
        name: "ElementPlus",
        meta: {
          title: "Element Plus",
          keepAlive: true
        }
      },
      {
        path: "vxe-table",
        component: () => import("@/views/table/vxe-table/index.vue"),
        name: "VxeTable",
        meta: {
          title: "Vxe Table",
          keepAlive: true
        }
      }
    ]
  },
  {
    path: "/menu",
    component: Layouts,
    redirect: "/menu/menu1",
    name: "Menu",
    meta: {
      title: "多级路由",
      svgIcon: "menu"
    },
    children: [
      {
        path: "menu1",
        component: () => import("@/views/menu/menu1/index.vue"),
        redirect: "/menu/menu1/menu1-1",
        name: "Menu1",
        meta: {
          title: "menu1"
        },
        children: [
          {
            path: "menu1-1",
            component: () => import("@/views/menu/menu1/menu1-1/index.vue"),
            name: "Menu1-1",
            meta: {
              title: "menu1-1",
              keepAlive: true
            }
          },
          {
            path: "menu1-2",
            component: () => import("@/views/menu/menu1/menu1-2/index.vue"),
            redirect: "/menu/menu1/menu1-2/menu1-2-1",
            name: "Menu1-2",
            meta: {
              title: "menu1-2"
            },
            children: [
              {
                path: "menu1-2-1",
                component: () => import("@/views/menu/menu1/menu1-2/menu1-2-1/index.vue"),
                name: "Menu1-2-1",
                meta: {
                  title: "menu1-2-1",
                  keepAlive: true
                }
              },
              {
                path: "menu1-2-2",
                component: () => import("@/views/menu/menu1/menu1-2/menu1-2-2/index.vue"),
                name: "Menu1-2-2",
                meta: {
                  title: "menu1-2-2",
                  keepAlive: true
                }
              }
            ]
          },
          {
            path: "menu1-3",
            component: () => import("@/views/menu/menu1/menu1-3/index.vue"),
            name: "Menu1-3",
            meta: {
              title: "menu1-3",
              keepAlive: true
            }
          }
        ]
      },
      {
        path: "menu2",
        component: () => import("@/views/menu/menu2/index.vue"),
        name: "Menu2",
        meta: {
          title: "menu2",
          keepAlive: true
        }
      }
    ]
  },
  {
    path: "/hook-demo",
    component: Layouts,
    redirect: "/hook-demo/use-fetch-select",
    name: "HookDemo",
    meta: {
      title: "Hook 示例",
      elIcon: "Menu",
      alwaysShow: true
    },
    children: [
      {
        path: "use-fetch-select",
        component: () => import("@/views/hook-demo/use-fetch-select.vue"),
        name: "UseFetchSelect",
        meta: {
          title: "useFetchSelect"
        }
      },
      {
        path: "use-fullscreen-loading",
        component: () => import("@/views/hook-demo/use-fullscreen-loading.vue"),
        name: "UseFullscreenLoading",
        meta: {
          title: "useFullscreenLoading"
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
