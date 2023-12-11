<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import dayjs from "dayjs";
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import { VerificationProcessRatingDTO } from "@/types/dto"
import { usePagination } from "@/hooks/usePagination"
import { VerificationProcess } from "@/types/models";
import { useUserStore } from "@/store/modules/user";
import { useAgentStore } from "@/store/agent";
import { ElMessage, ElMessageBox, FormInstance, FormRules } from "element-plus"
import { useProvinceStore } from "@/store/province";
import { useCompanyStore } from "@/store/company";


defineOptions({
  name: "VerificationAssign"
})

interface SelectOption {
  value: number
  label: string
}

const agentOptions = ref<SelectOption[]>([])
const agentClassifyOptions = ref<SelectOption[]>([])
const loading = ref<boolean>(false)
const dialogUpdateVisible = ref<boolean>(false)
const formRef = ref<FormInstance | null>(null)
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()
const verificationProcessData = ref<VerificationProcess[]>([])
const agentStore = useAgentStore()
const provinceStore = useProvinceStore()
const companyStore = useCompanyStore()
const userStore = useUserStore()
const accountId = userStore.user_id
const currentProcess = ref<VerificationProcess>()

const updateForm = reactive({
  assignedAgentReviewId: 0,
  assignedAgentId: 0,
})

provinceStore.getAllProvinces()

const validateSelect1 = (rule: any, value: any, callback: any) => {
  setTimeout(() => {
    if (updateForm.assignedAgentReviewId == 0) {
      callback(new Error('Không được để trống'))
    } else {
      callback()
    }
  }, 1000)
}

const validateSelect2 = (rule: any, value: any, callback: any) => {
  setTimeout(() => {
    if (updateForm.assignedAgentId == 0) {
      callback(new Error('Không được để trống'))
    } else {
      callback()
    }
  }, 1000)
}

const formRules = reactive<FormRules<typeof updateForm>>({
  assignedAgentReviewId: [{ validator: validateSelect1, trigger: "change" }],
  assignedAgentId: [{ validator: validateSelect2, trigger: "change" }]
})

// created
const verificationProcessStore = useVerificationProcessStore()

agentStore.getAllAgents().then(() => {
  agentOptions.value.push({ value: 0, label: "-- hãy chọn cán bộ --" } as SelectOption)

  agentStore.agents?.filter(x => x.accountId != accountId).map((agent) =>
    agentOptions.value.push({ value: agent.id, label: agent.firstName + " " + agent.lastName } as SelectOption))
})

const getVerificationProcessData = () => {
  loading.value = true

  verificationProcessStore.getAll()
    .then((res) => {
      const processIds = _.map(verificationProcessStore.verificationProcess, 'id');

      paginationData.total = res.data.length
      verificationProcessData.value = res.data.filter(x => x.status != "FINISHED")
    })
    .catch(() => {
      verificationProcessData.value = []
    })
    .finally(() => {
      loading.value = false
    })
}

const handleUpdate = (row: VerificationProcess) => {
  currentProcess.value = row
  updateForm.assignedAgentReviewId = row.assignedAgentReviewId ?? 0
  updateForm.assignedAgentId = row.assignedAgentId ?? 0

  let agentIdList = [] as Number[]
  provinceStore.getAssignmentsByProvinceId(row.company.provinceId).then((res) => {
    agentIdList = res.data.map(({agentId})=> Number(agentId))

    agentOptions.value = agentOptions.value.filter(x => agentIdList.includes(x.value))

  })

  dialogUpdateVisible.value = true
  formRef.value?.clearValidate()
}

const updateProcess = () => {
  if (updateForm.assignedAgentReviewId == 0) {
    ElMessage.error('Hãy chọn cán bộ đánh giá.');
    return;
  }
  if (updateForm.assignedAgentId == 0) {
    ElMessage.error('Hãy chọn cán bộ phân loại.');
    return;
  }

  if (updateForm.assignedAgentId == updateForm.assignedAgentReviewId) {
    ElMessage.error('Hãy phân công cán bộ khác nhau.');
    return;
  }
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      const updated: Partial<VerificationProcess> = {
        ...currentProcess.value,
        assignedAgentReviewId: updateForm.assignedAgentReviewId,
        assignedAgentId: updateForm.assignedAgentId
      };

      verificationProcessStore.updateProcess(updated)
        .then(() => {
          ElMessage.success("Phân công nhiệm vụ thành công")
          getVerificationProcessData()
        })
        .catch(() => {
          ElMessage.error('Đã có lỗi xảy ra trong quá trình phân công nhiệm vụ. Vui lòng thử lại sau.');

        })
        .finally(() => {
          dialogUpdateVisible.value = false
        })
    }
  })
}

watch([() => paginationData.currentPage, () => paginationData.pageSize], getVerificationProcessData, { immediate: true })

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Danh sách doanh nghiệp gửi hồ sơ đánh giá</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="verificationProcessStore.verificationProcess.length == 0" shadow="never">
          <div>
            Không có hồ sơ
          </div>
        </el-card>

        <el-card v-loading="loading" v-if="verificationProcessStore.verificationProcess.length > 0" shadow="never">
          <el-table ref="tableData" :data=verificationProcessData style="width: 100%"
            :row-key="(row) => { return row.id }">
            <el-table-column label="STT" type="index" />
            <el-table-column label="Doanh nghiệp" prop="company.companyNameVI" />
            <el-table-column label="Hạn gửi hồ sơ">
              <template #default="scope">
                {{ dayjs(scope.row.submitDeadline).format('DD/MM/YYYY') }}
              </template>
            </el-table-column>
            <el-table-column label="Ngày gửi hồ sơ">
              <template #default="scope">
                <div v-if="scope.row.submittedAt">{{ dayjs(scope.row.submittedAt).format('DD/MM/YYYY') }}</div>
                <div v-else>-</div>
              </template>
            </el-table-column>
            <el-table-column label="cán bộ đánh giá">
              <template #default="scope">
                <div v-if="scope.row.assignedAgentReviewId">{{
                agentStore.agents?.find(x => x.id ==scope.row.assignedAgentReviewId)?.lastName
                + " " +
                agentStore.agents?.find(x => x.id ==scope.row.assignedAgentReviewId)?.firstName
                  }}</div>
                <div v-else>-</div>
              </template>
            </el-table-column>
            <el-table-column label="cán bộ phân loại">
              <template #default="scope">
                <div v-if="scope.row.assignedAgentId">{{
                  agentStore.agents?.find(x => x.id == scope.row.assignedAgentId)?.lastName
                  + " " +
                  agentStore.agents?.find(x => x.id == scope.row.assignedAgentId)?.firstName
                  }}
                </div>
                <div v-else>-</div>
              </template>
            </el-table-column>
            <el-table-column label="Trạng thái">
              <template #default="scope">
                <div v-if="scope.row.submittedCount == 0 && scope.row.status === 'IN_PROGRESS'">chưa gửi đánh giá</div>
                <div v-else-if="!scope.row.assignedAgentReviewId || !scope.row.assignedAgentId">Đang phân công</div>
                <div v-else>Đã phân công</div>
              </template>
            </el-table-column>
            <el-table-column fixed="right" label="Hành động" align="center">
              <template #default="scope">
                <el-button
                  :disabled="!(!scope.row.assignedAgentReviewId || !scope.row.assignedAgentId || (scope.row.submittedCount == 0 && scope.row.status === 'IN_PROGRESS'))"
                  type="primary" text bg size="small" @click="handleUpdate(scope.row)">Cập nhật</el-button>
              </template>
            </el-table-column>
          </el-table>
          <div class="pager-wrapper">
            <el-pagination background :layout="paginationData.layout" :page-sizes="paginationData.pageSizes"
              :total="paginationData.total" :page-size="paginationData.pageSize" :currentPage="paginationData.currentPage"
              @size-change="handleSizeChange" @current-change="handleCurrentChange" />
          </div>
        </el-card>
        <!-- Update -->
        <el-dialog v-model="dialogUpdateVisible" title="phân công nhiệm vụ" width="60%">
          <el-form ref="formRef" status-icon :model="updateForm" :rules="formRules" label-width="300px" label-position="left">
            <el-form-item label="Cán bộ đánh giá (*)">
              <el-select v-model="updateForm.assignedAgentReviewId" placeholder="Select" style="width: 240px">
                <el-option v-for="item in agentOptions" :key="item.value" :label="item.label" :value="item.value" />
              </el-select>
            </el-form-item>
            <el-form-item label="Cán bộ phân loại (*)">
              <el-select v-model="updateForm.assignedAgentId" placeholder="Select" style="width: 240px">
                <el-option v-for="item in agentOptions" :key="item.value" :label="item.label" :value="item.value" />
              </el-select>
            </el-form-item>
          </el-form>
          <template #footer>
            <el-button @click="dialogUpdateVisible = false">Hủy</el-button>
            <el-button type="primary" @click="updateProcess">Cập nhật</el-button>
          </template>
        </el-dialog>
      </div>
    </div>
  </div>
</template>

<style>
.pager-wrapper {
  padding-top: 20px;
}

.el-table .cell {
  word-break: normal;
  word-wrap: break-word;
}
</style>
