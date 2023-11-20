<script lang="ts" setup>
import { useUserStore } from "@/store/modules/user"
import Agent from "./components/Agent.vue"
import Company from "./components/Company.vue"

const userStore = useUserStore()
const isAgent = userStore.user_role.includes("Agent")
</script>

<template>
  <component :is="isAgent ? Agent : Company" />
</template>
