<script lang="ts" setup>
import { ref } from "vue"
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import CriteriaTable from "./CriteriaTable.vue"
import { ElMessage} from "element-plus"
import { useRoute, useRouter } from "vue-router";
import { useAgentStore } from "@/store/agent";
import { useCompanyTypeStore } from "@/store/companyType";

defineOptions({
  name: "VerificationDetail"
})

interface SelectOption {
  value: number 
  label: string
}

const loading = ref<boolean>(false)
const submitting = ref<boolean>(false)
const dialogSubmitVisible = ref(false)
const dialogRejectConfirmVisible = ref(false)
const submittingRejectConfirm = ref<boolean>(false)

const companyTypeId = ref<string>("")
const companyTypesOption = ref<SelectOption[]>([])

const route = useRoute()
const processId = route.params && route.params.id
const verificationProcessStore = useVerificationProcessStore()

verificationProcessStore.setProcessId(Number(processId))
verificationProcessStore.loadSelfVerification(Number(processId))

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_breadcrumb">
        <router-link to="/verification-result/list">
          <el-button type="primary" style="display:block; margin-bottom: 20px;">
            Quay lại
          </el-button>
        </router-link>
      </div>
      <div className="x_content">
        <el-card v-loading="loading" shadow="never">
          <CriteriaTable />
        </el-card>
      </div>
    </div>
  </div>
</template>

<style>
.demo-tabs {
  height: auto;
}

.demo-tabs>.el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}

.el-tabs--left .el-tabs__item.is-left,
.el-tabs--right .el-tabs__item.is-left {
  max-width: 300px;
  text-wrap: wrap;
}

.el-tabs__item {
  padding: 40px 20px;
}

.el-tabs--right .el-tabs__content,
.el-tabs--left .el-tabs__content {
  height: 100%;
}

.el-table .cell {
  word-break: break-word;
}
</style>