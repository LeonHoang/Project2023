<script lang="ts" setup>
import { computed, ref, watchEffect } from "vue"
import { ElMessage } from "element-plus"
import screenfull from "screenfull"

interface Props {
   /** Full screen element, default is html */
   element?: string
   /** Open full screen prompt */
   openTips?: string
   /** Close full screen prompt */
   exitTips?: string
   /** Whether it is only for the content area */
   content?: boolean
}

const props = withDefaults(defineProps<Props>(), {
   element: "html",
   openTips: "Full screen",
   exitTips: "Exit full screen",
   content: false
})

//#region full screen
const isFullscreen = ref<boolean>(false)
const fullscreenTips = computed(() => {
   return isFullscreen.value ? props.exitTips : props.openTips
})
const fullscreenSvgName = computed(() => {
   return isFullscreen.value ? "fullscreen-exit" : "fullscreen"
})
const handleFullscreenClick = () => {
   const dom = document.querySelector(props.element) || undefined
   screenfull.isEnabled ? screenfull.toggle(dom) : ElMessage.warning("Your browser does not work")
}
const handleFullscreenChange = () => {
   isFullscreen.value = screenfull.isFullscreen
}
watchEffect((onCleanup) => {
   // Automatically executed when mounting the component
   screenfull.on("change", handleFullscreenChange)
   // Automatically executed when uninstalling the component
   onCleanup(() => {
     screenfull.isEnabled && screenfull.off("change", handleFullscreenChange)
   })
})
//#endregion

//#region content area
const isContentLarge = ref<boolean>(false)
const contentLargeTips = computed(() => {
   return isContentLarge.value ? "Content area restoration" : "Content area enlargement"
})
const contentLargeSvgName = computed(() => {
   return isContentLarge.value ? "fullscreen-exit" : "fullscreen"
})
const handleContentLargeClick = () => {
   document.body.className = !isContentLarge.value ? "content-large" : ""
   isContentLarge.value = !isContentLarge.value
}
//#endregion
</script>

<template>
   <div>
     <!-- Full screen -->
     <el-tooltip v-if="!content" effect="dark" :content="fullscreenTips" placement="bottom">
       <SvgIcon :name="fullscreenSvgName" @click="handleFullscreenClick" />
     </el-tooltip>
     <!-- Content area -->
     <el-dropdown v-else>
       <SvgIcon :name="contentLargeSvgName" />
       <template #dropdown>
         <el-dropdown-menu>
           <!--Enlarge the content area -->
           <el-dropdown-item @click="handleContentLargeClick">{{ contentLargeTips }}</el-dropdown-item>
           <!-- Content area full screen -->
           <el-dropdown-item @click="handleFullscreenClick" :disabled="isFullscreen">Content area full screen</el-dropdown-item>
         </el-dropdown-menu>
       </template>
     </el-dropdown>
   </div>
</template>

<style lang="scss" scoped>
.svg-icon {
   font-size: 20px;
   &:focus {
     outline: none;
   }
}
</style>