<script lang="ts" setup>
import { reactive, ref } from "vue"
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import CriteriaTable from "./CriteriaTable.vue"
import { Action, ElMessage, ElMessageBox, FormInstance } from "element-plus"
import { useUserStore } from "@/store/modules/user"
import { useRoute, useRouter } from "vue-router";
import { useAgentStore } from "@/store/agent";
import { useCriteriaDetailStore } from "@/store/criteriaDetail";

defineOptions({
  name: "VerificationDetail"
})

interface SelectOption {
  value: number
  label: string
}

const loading = ref<boolean>(false)
const submitting = ref<boolean>(false)
const approveAllSubmiting = ref<boolean>(false)
const dialogSubmitVisible = ref(false)
const dialogVerifyConfirmVisible = ref(false)
const submittingVefiryConfirm = ref<boolean>(false)

const assignedAgentId = ref<string>()
const agentOptions = ref<SelectOption[]>([])
const canSubmit = ref<boolean>(false)
const userStore = useUserStore()
const accountId = userStore.user_id

const route = useRoute()
const router = useRouter()

const processId = route.params && route.params.id
const agentStore = useAgentStore()

const verificationProcessStore = useVerificationProcessStore()
const criteriaDetailStore = useCriteriaDetailStore();

verificationProcessStore.setProcessId(Number(processId))
verificationProcessStore.loadSelfVerification(Number(processId)).then(() => {
  checkCanSubmit()
})

const checkCanRequestConfirm = () => {
  const verificationProcess = verificationProcessStore.verificationProcess.find((item) => item.id === Number(processId))
  if(verificationProcess?.submittedCount && verificationProcess?.submittedCount <= 3){
    return true
  }else{
    return true
  }
}

const checkCanSubmit= () => {
  canSubmit.value = _(verificationProcessStore.verificationCriterias)
  .filter((criteria) => criteria.approvedStatus === 'PENDING')
  .isEmpty();
}

agentStore.getAllAgents().then(() => {
  agentStore.agents?.filter(x=> x.accountId != accountId).map((agent) =>
      agentOptions.value.push({value: agent.id, label: agent.firstName + " " + agent.lastName} as SelectOption))
})

const approveAllCriterias = () => {
  approveAllSubmiting.value = true
  verificationProcessStore.approveAllCriterias(Number(processId))
    .then(() => {
      checkCanSubmit()
      approveAllSubmiting.value = false
      ElMessage.success('Lưu đánh giá thành công.');
    })
    .catch(() => {
      checkCanSubmit()
      approveAllSubmiting.value = false
      ElMessage.error('Đã xảy ra lỗi trong quá trình lưu đánh giá. Vui lòng thử lại sau.');
    });
};

const submitVerify = () => {
  if (!assignedAgentId.value) {
    ElMessage.error('Hãy chọn kiểm lâm tỉnh.');
    submitting.value = false
    dialogSubmitVisible.value = false
    return;
  }
  submitting.value = true
  verificationProcessStore.submitVerifyReview(Number(processId), parseInt(assignedAgentId.value))
    .then(() => {
      checkCanSubmit()
      submitting.value = false
      dialogSubmitVisible.value = false

      router.push({ path: '/verification-process/verification/list' })
      ElMessage.success('Yêu cầu duyệt đã được gửi.');
    })
    .catch(() => {
      checkCanSubmit()
      submitting.value = false
      dialogSubmitVisible.value = false
      ElMessage.error('Đã xảy ra lỗi trong quá trình lưu đánh giá. Vui lòng thử lại sau.');
    });
};

const submitVerifyConfirm = () => {
  submittingVefiryConfirm.value = true
  verificationProcessStore.rejectProcess(Number(processId))
    .then(() => {
      submittingVefiryConfirm.value = false
      dialogVerifyConfirmVisible.value = false

      router.push({ path: '/verification-process/verification/list' })
      ElMessage.success('yêu cầu doanh nghiệp tự đánh giá lại lại thành công.');
    })
    .catch(() => {
      submittingVefiryConfirm.value = false
      dialogVerifyConfirmVisible.value = false
      ElMessage.error('Đã xảy ra lỗi trong quá trình yêu cầu doanh nghiệp tự đánh giá lại. Vui lòng thử lại sau.');
    });
};

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Đánh giá sự tuân thủ của doanh nghiệp {{ verificationProcessStore.company?.companyNameVI }}</h2>
        <div className="clearfix" />
      </div>
      <div className="x_breadcrumb">
        <router-link to="/verification-process/verification">
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
      <el-row class="mb-4" style="marginTop: 24px">
        <el-button type="primary" style="margin-right: 30px;" @click="dialogVerifyConfirmVisible = true">
          Yêu cầu xác minh và gửi lại đánh giá
        </el-button>

        <el-button type="primary" style="margin-right: 30px;" @click=approveAllCriterias :disabled=approveAllSubmiting>
          Đánh dấu tất cả đạt
        </el-button>

        <div v-if="canSubmit">
          <el-button type="primary" style="margin-right: 30px;" @click="dialogSubmitVisible = true">
            Duyệt kết quả
          </el-button>
        </div>
        <div v-else>
          <el-tooltip class="box-item" effect="dark" content="Vui lòng đánh giá đầy đủ tiêu chí trước khi duyệt kết quả"
            placement="bottom-start">
            <el-button type="primary" disabled>Duyệt kết quả</el-button>
          </el-tooltip>
        </div>
      </el-row>
      <el-dialog v-model="dialogSubmitVisible" title="Xác nhận gửi đánh giá">
        <div>
          Kiểm tra đầy đủ nội dung đánh giá và chỉ định cán bộ phân loại kết quả đánh giá
        </div>
        <el-select v-model="assignedAgentId" class="m-2" placeholder="Select" size="large">
          <el-option
            v-for="item in agentOptions"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogSubmitVisible = false">Hủy</el-button>
            <el-button type="primary" @click="submitVerify" :disabled="submitting">
              Xác nhận
            </el-button>
          </span>
        </template>
      </el-dialog>
      <el-dialog v-model="dialogVerifyConfirmVisible" title="Yêu cầu gửi lại đánh giá">
        <div v-if="checkCanRequestConfirm() == true">
          Xác nhận yêu cầu doanh nghiệp xác minh và gửi lại đánh giá?
        </div>
        <div v-if="checkCanRequestConfirm() == false">
          Doanh nghiệp đã đạt số lần gửi đánh giá tối đa được cho phép: 3/3 lần
          <br/>
          Ấn để xác nhận từ chối quá trình đánh giá lần này.
        </div>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVerifyConfirmVisible = false">Hủy</el-button>
            <el-button type="primary" @click="submitVerifyConfirm" :disabled="submittingVefiryConfirm">
              Xác nhận
            </el-button>
          </span>
        </template>
      </el-dialog>
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
