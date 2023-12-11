<script lang="ts" setup>
import { ref } from "vue"
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import CriteriaTable from "./CriteriaTable.vue"
import { ElMessage} from "element-plus"
import { useRoute, useRouter } from "vue-router";
import { useAgentStore } from "@/store/agent";
import { useCompanyTypeStore } from "@/store/companyType";
import { VerificationProcess } from "@/types/models";

defineOptions({
  name: "ClassifyDetail"
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
const router = useRouter()

const processId = route.params && route.params.id
const companyTypeStore = useCompanyTypeStore()
const agentStore = useAgentStore()
const currentProcess = ref<VerificationProcess>()
const assignedReviewAgent = ref<string>()
const verificationProcessStore = useVerificationProcessStore()

verificationProcessStore.setProcessId(Number(processId))
verificationProcessStore.loadSelfVerification(Number(processId)).then(() => {

  currentProcess.value = verificationProcessStore.verificationProcess.find((item) => item.id === Number(processId))

  agentStore.getAllAgents().then(() => {
    let agent = agentStore.agents?.find(x => x.id == currentProcess.value?.assignedAgentReviewId)
    assignedReviewAgent.value = agent?.lastName + " " + agent?.firstName + ". Số điện thoại liên lạc: " + agent?.phoneNumber
  })
})

companyTypeStore.getAll().then(() => {
  companyTypeStore.companyTypes?.map((companyType) =>
    companyTypesOption.value.push({value: companyType.id, label: companyType.typeName} as SelectOption))
})

const submitClassify = () => {
  if (!companyTypeId.value) {
    ElMessage.error('Hãy chọn phân loại doanh nghiệp.');
    submitting.value = false
    dialogSubmitVisible.value = false
  }
  submitting.value = true
  verificationProcessStore.submitClassify(Number(processId), parseInt(companyTypeId.value))
    .then(() => {
      submitting.value = false
      dialogSubmitVisible.value = false

      ElMessage.success('Phân loại thành công')
      router.push({ path: '/verification-process/classify/list' })
    })
    .catch(() => {
      submitting.value = false
      dialogSubmitVisible.value = false
      ElMessage.error('Đã xảy ra lỗi trong quá trình lưu đánh giá. Vui lòng thử lại sau.');
    });
};

const rejectReviewed = () => {
  submittingRejectConfirm.value = true
  verificationProcessStore.rejectReviewed(Number(processId))
    .then(() => {
      submittingRejectConfirm.value = false
      dialogRejectConfirmVisible.value = false
      ElMessage.success('yêu cầu đánh giá thành công.')

      router.push({ path: '/verification-process/classify/list' })
    })
    .catch(() => {
      submittingRejectConfirm.value = false
      dialogRejectConfirmVisible.value = false
      ElMessage.error('Đã xảy ra lỗi trong quá trình yêu cầu đánh giá lại. Vui lòng thử lại sau.');
    });
};

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Phân loại doanh nghiệp {{ verificationProcessStore.company?.companyNameVI }}</h2>
        <div className="clearfix" />
      </div>
      <div className="x_breadcrumb">
        <router-link to="/verification-process/classify">
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
      <div style="marginTop:24px">
        <label>Phân loại doanh nghiệp</label>
        <el-select v-model="companyTypeId" class="m-2" placeholder="Select" size="large">
          <el-option
            v-for="item in companyTypesOption"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
      </div>
      <el-row class="mb-4" style="marginTop: 24px">
        <el-button type="primary" style="margin-right: 30px;" @click="dialogRejectConfirmVisible = true">
          Yêu cầu đánh giá lại
        </el-button>

        <div v-if="companyTypeId">
          <el-button type="primary" style="margin-right: 30px;" @click="dialogSubmitVisible = true">
            Phân loại
          </el-button>
        </div>
        <div v-else>
          <el-tooltip class="box-item" effect="dark" content="Vui lòng chọn phân loại"
            placement="bottom-start">
            <el-button type="primary" disabled>Phân loại</el-button>
          </el-tooltip>
        </div>
      </el-row>
      <el-dialog v-model="dialogSubmitVisible" title="Xác nhận phân loại">
        <div>
          Sau khi phân loại, kết quả sẽ được công bố cho doanh nghiệp.
        </div>
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogSubmitVisible = false">Hủy</el-button>
            <el-button type="primary" @click="submitClassify" :disabled="submitting">
              Xác nhận
            </el-button>
          </span>
        </template>
      </el-dialog>
      <el-dialog v-model="dialogRejectConfirmVisible" title="Xác nhận yêu cầu đánh giá lại">
        <div>
          Nếu cán bộ thấy kết quả đánh giá chưa đáp ứng yêu cầu, cán bộ có thể yêu cầu đánh giá lại.
        </div>
        <br/>
        {{ assignedReviewAgent }}
        <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogRejectConfirmVisible = false">Hủy</el-button>
            <el-button type="primary" @click="rejectReviewed" :disabled="submittingRejectConfirm">
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
