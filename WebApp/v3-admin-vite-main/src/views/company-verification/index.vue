<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import { createTableDataApi, deleteTableDataApi, updateTableDataApi, getTableDataApi } from "@/api/table"
import { type GetTableData } from "@/api/table/types/table"
import { type FormInstance, type FormRules, ElMessage, ElMessageBox } from "element-plus"
import { useVerificationProcessStore } from "@/store/verificationProcessManagement/verificationProcess"

defineOptions({
  name: "CompanyYerification"
})

const loading = ref<boolean>(false)

// created
const verificationProcessStore = useVerificationProcessStore()
verificationProcessStore.loadSelfVerification()

const selectedTabId = ref<number>(1)
</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>{`Doanh nghiệp ${verificationProcessStore.company.companyNameVI} tự đánh giá`}</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="!verificationProcessStore.editingProcess" shadow="never">
          <div>
            Hiện tại doanh nghiệp không cần phải đánh giá.
            Yêu cầu đánh giá tại đây.
          </div>
        </el-card>
        
        <el-card v-loading="loading" v-if="verificationProcessStore.editingProcess" shadow="never">
          <el-tabs tab-position="left" style="height: 200px" class="demo-tabs">
            <el-tab-pane label="User">User</el-tab-pane>
            <el-tab-pane label="Config">Config</el-tab-pane>
          </el-tabs>
        </el-card>
      </div>
    </div>


  </div>
</template>

<style>
.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}

.el-tabs--right .el-tabs__content,
.el-tabs--left .el-tabs__content {
  height: 100%;
}
</style>