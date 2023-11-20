<script lang="ts" setup>
import { useTheme } from "@/hooks/useTheme"
const { initTheme } = useTheme()

/** Initialize theme */
initTheme()
</script>

<template>
  <el-config-provider>
    <router-view />
  </el-config-provider>
</template>
