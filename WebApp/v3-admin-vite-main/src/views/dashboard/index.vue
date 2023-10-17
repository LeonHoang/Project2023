<script lang="ts" setup>
import { useUserStore } from "@/store/modules/user"
import Admin from "./components/Admin.vue"
import Editor from "./components/Editor.vue"

const userStore = useUserStore()
const isAdmin = (userStore.user_role == "admin")
</script>

<template>
  <component :is="isAdmin ? Admin : Editor" />
</template>
