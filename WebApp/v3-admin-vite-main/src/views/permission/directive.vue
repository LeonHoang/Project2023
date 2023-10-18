<script lang="ts" setup>
import { ref } from "vue"
import { checkPermission } from "@/utils/permission" // checkPermission permission judgment function
// import SwitchRoles from "./components/SwitchRoles.vue"

/** key is to reinitialize the command every time you switch permissions */
const key = ref(1)
const handleRolesChange = () => {
   key.value++
}
</script>

<template>
   <div class="app-container">
     <!-- <SwitchRoles @change="handleRolesChange" /> -->
     <!-- v-permission example -->
     <div :key="key" class="margin-top-30">
       <div>
         <el-tag v-permission="['admin']" type="success" size="large" effect="plain">
           v-permission="['admin']" is used here, so only admin can see this sentence
         </el-tag>
       </div>
       <div>
         <el-tag v-permission="['editor']" type="success" size="large" effect="plain">
           v-permission="['editor']" is used here, so only the editor can see this sentence
         </el-tag>
       </div>
       <div class="margin-top-15">
         <el-tag v-permission="['admin', 'editor']" type="success" size="large" effect="plain">
           v-permission="['admin', 'editor']" is used here, so both admin and editor can see this sentence
         </el-tag>
       </div>
     </div>
     <!-- checkPermission example -->
     <div :key="`checkPermission${key}`" class="margin-top-30">
       <el-tag type="warning" size="large">
         For example, Element Plus's el-tab-pane or el-table-column and other scenes that dynamically render Dom are not suitable for use.
         v-permission, in this case you can achieve it through v-if and checkPermission:
       </el-tag>
       <el-tabs type="border-card" class="margin-top-15">
         <el-tab-pane v-if="checkPermission('admin')" label="admin">
           <el-tag>v-if="checkPermission(['admin'])"</el-tag> is used here, so only admin can see this sentence
         </el-tab-pane>
         <el-tab-pane v-if="checkPermission('editor')" label="editor">
           <el-tag>v-if="checkPermission(['editor'])"</el-tag> is used here, so only the editor can see this sentence
         </el-tab-pane>
       </el-tabs>
     </div>
   </div>
</template>

<style lang="scss" scoped>
.margin-top-15 {
   margin-top: 15px;
}
.margin-top-30 {
   margin-top: 30px;
}
</style>