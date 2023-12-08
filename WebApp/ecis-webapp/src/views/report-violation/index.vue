<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import dayjs from "dayjs";
import _ from "lodash";
import { usePagination } from "@/hooks/usePagination"
import { ViolationReport, ViolationReportDocument } from "@/types/models";
import { useViolationReportStore } from "@/store/violationReport";
import { ElMessage, FormInstance, FormRules, UploadInstance, UploadProps, UploadUserFile } from "element-plus"
import { CirclePlus } from "@element-plus/icons-vue"
import { ViolationReportDTO } from "@/types/dto";
import { useCompanyStore } from "@/store/company";
import { useAgentStore } from "@/store/agent";
import { useUserStore } from "@/store/modules/user";
import fileServices from "@/services/file.services";

defineOptions({
  name: "ReportViolation"
})
interface SelectOption {
  value: string
  label: string
}

type ViolationReportDTOTemp = {
  description: string;
  companyId: string;
  reportAgentId: string;
  violationReportDocuments: Partial<ViolationReportDocument>[];
};

const loading = ref<boolean>(false)
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()
const companyOption = ref<SelectOption[]>([])
const fileList = ref()
const violationReports = ref<ViolationReport[]>([])
const dialogVisible = ref<boolean>(false)
const formRef = ref<FormInstance | null>(null)
const uploadRef = ref<UploadInstance>()

const violationReportStore = useViolationReportStore()
const companyStore = useCompanyStore()
const agentStore = useAgentStore()
agentStore.getAllAgents()
const userStore = useUserStore()
const accountId = userStore.user_id

companyStore.getAll().then(() => {
  companyStore.companies?.map((com) =>
    companyOption.value.push({ value: String(com.id), label: com.companyNameVI + com.companyCode } as SelectOption))
})

const formData = reactive({
  description: "",
  companyId: "",
  reportAgentId: "",
  violationReportDocuments: [] as Partial<ViolationReportDocument>[]
})


const formRules: FormRules = reactive({
  companyId: [{ required: true, trigger: "change", message: "Không được để trống" }],
  description: [{ required: true, trigger: "blur", message: "Không được để trống" }]
})

const handleCreate = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    let id = parseInt(formData.companyId)
    if (isNaN(id)) {
      ElMessage.error('Không được để trống doanh nghiệp');
      return
    }

    violationReportStore.isCanCreateReport(parseInt(formData.companyId))
      .then((data) => {
        if (!data) {
          ElMessage.error('Không thể tạo thêm báo cáo vì doanh nghiệp đang trong quá trình xử lý vi phạm.')
          return
        }
        if (valid) {
          // uploadRef.value!.submit()

          const formattedData: ViolationReportDTO = {
            ...formData,
            companyId: parseInt(formData.companyId),
            reportAgentId: agentStore.agents?.find(x => x.accountId == accountId)?.id ?? 0
          };

          violationReportStore.createViolationReport(formattedData)
            .then(() => {
              ElMessage.success("Gửi báo cáo vi phạm thành công.")
              getViolationReportData()
            })
            .catch(() => {
              ElMessage.error('Đã xảy ra lỗi trong quá trình gửi báo cáo vi phạm. Vui lòng thử lại sau.');

            })
            .finally(() => {
              dialogVisible.value = false
            })
        }
      })
      .catch(() => {
        ElMessage.error('Đã xảy ra lỗi trong quá trình gửi báo cáo vi phạm. Vui lòng thử lại sau.')
        return
      })
  })
}

const createDoc: UploadProps['onSuccess'] = (uploadFile) => {
  formData.violationReportDocuments.push({
    documentName: uploadFile.name,
    documentType: uploadFile.type,
    documentUrl: uploadFile.url,
    documentSize: uploadFile.size
  });
}

const resetForm = () => {
  formData.description = ""
  formRef.value?.resetFields()
  formRef.value?.clearValidate()
}

const getViolationReportData = () => {
  loading.value = true

  violationReportStore.getAll()
    .then((res) => {
      violationReports.value = res.data
    })
    .catch(() => {
      violationReports.value = []
    })
    .finally(() => {
      loading.value = false
    })
}

watch([() => paginationData.currentPage, () => paginationData.pageSize], getViolationReportData, { immediate: true })

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Hoạt động sai phạm của doanh nghiệp</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <div class="toolbar-wrapper">
          <div>
            <el-button type="primary" :icon="CirclePlus" @click="dialogVisible = true">Báo cáo</el-button>
          </div>
        </div>
        <el-card v-loading="loading" shadow="never">
          <el-table ref="tableData" :data=violationReports style="width: 100%" :row-key="(row) => { return row.id }">
            <el-table-column label="STT" type="index" width="100" />
            <el-table-column label="doanh nghiệp">
              <template #default="scope">
                {{ scope.row.company.companyNameVI }}
              </template>
            </el-table-column>
            <el-table-column label="Thời gian tạo">
              <template #default="scope">
                {{ dayjs(scope.row.dateOfBirth).format('DD/MM/YYYY') }}
              </template>
            </el-table-column>
            <el-table-column label="Trạng thái">
              <template #default="scope">
                <div v-if="scope.row.status === 'APPROVED'">Đã duyệt</div>
                <div v-else-if="scope.row.status === 'REJECTED'">Chưa duyệt</div>
                <div v-else>Đang xử lý</div>
              </template>
            </el-table-column>
          </el-table>
          <div class="pager-wrapper">
            <el-pagination background :layout="paginationData.layout" :page-sizes="paginationData.pageSizes"
              :total="paginationData.total" :page-size="paginationData.pageSize" :currentPage="paginationData.currentPage"
              @size-change="handleSizeChange" @current-change="handleCurrentChange" />
          </div>
        </el-card>
        <el-dialog v-model="dialogVisible" title="Báo cáo sai phạm của doanh nghiệp" @close="resetForm" width="60%">
          <el-form ref="formRef" :model="formData" :rules="formRules" label-width="300px" label-position="left">
            <el-form-item label="Doanh nghiệp (*)">
              <el-select v-model="formData.companyId" placeholder="Select" style="width: 240px">
                <el-option v-for="item in companyOption" :key="item.value" :label="item.label" :value="item.value" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-input v-model="formData.description" type="textarea" placeholder="Mô tả" />
            </el-form-item>
            <el-form-item>
              <el-upload v-model:file-list="fileList" action="http://localhost:5000/api/File" multiple
                accept=".jpg,.jpeg,.png,.doc,.docx,.xls,.xlsx,.pdf" :on-success="createDoc">
                <el-button type="primary">Chọn file</el-button>
              </el-upload>
            </el-form-item>
          </el-form>
          <template #footer>
            <el-button @click="dialogVisible = false">Hủy</el-button>
            <el-button type="primary" @click="handleCreate">Tạo</el-button>
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

.toolbar-wrapper {
  padding-bottom: 20px;
}
</style>
