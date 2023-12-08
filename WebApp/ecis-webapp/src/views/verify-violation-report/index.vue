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

defineOptions({
  name: "VerifyReportViolation"
})

const loading = ref<boolean>(false)
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()

const violationReports = ref<ViolationReport[]>([])
const editingViolationReport = ref<ViolationReport>()
const submitting = ref<boolean>(false)
const dialogVisible = ref<boolean>(false)

const violationReportStore = useViolationReportStore()
const companyStore = useCompanyStore()
const agentStore = useAgentStore()
agentStore.getAllAgents()
const userStore = useUserStore()
const accountId = userStore.user_id

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


const handleDialog = (id: number) => {
  dialogVisible.value = true

  editingViolationReport.value = violationReports.value.find(x => x.id == id)

  violationReportStore.getViolationReportDocument(id)
}


const approveReport = () => {
  submitting.value = true
  violationReportStore.approveViolationReport(editingViolationReport.value?.id ?? 0)
    .then(() => {
      ElMessage.success('Xác nhận doanh nghiệp vi phạm thành công.');
      dialogVisible.value = false
    })
    .catch(() => {
      submitting.value = false
      ElMessage.error('Đã có lỗi xảy ra trong quá trình xác nhận vi phạm. Vui lòng thử lại sau.');
    });
};

const rejectReport = () => {
  submitting.value = true
  violationReportStore.rejectViolationReport(editingViolationReport.value?.id ?? 0)
    .then(() => {
      submitting.value = false
      ElMessage.success('Từ chối doanh nghiệp vi phạm thành công.');
      dialogVisible.value = false
    })
    .catch(() => {
      submitting.value = false
      ElMessage.success('Đã có lỗi xảy ra trong quá trình từ chối vi phạm. Vui lòng thử lại sau.');
    });
};

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
            <el-table-column label="Hành động">

              <template #default="scope">
                <el-button type="primary" style="display:block; margin: 0 auto;" @click="handleDialog(scope.row.id)">
                  Chi tiết
                </el-button>
              </template>
            </el-table-column>
          </el-table>
          <div class="pager-wrapper">
            <el-pagination background :layout="paginationData.layout" :page-sizes="paginationData.pageSizes"
              :total="paginationData.total" :page-size="paginationData.pageSize" :currentPage="paginationData.currentPage"
              @size-change="handleSizeChange" @current-change="handleCurrentChange" />
          </div>
        </el-card>

        <el-dialog v-model="dialogVisible" title="Báo cáo sai phạm của doanh nghiệp" width="60%">
          <el-descriptions title="Thông tin doanh nghiệp" direction="vertical" :column="2" border>
            <el-descriptions-item label="Tên doanh nghiệp VI">{{ editingViolationReport?.company.companyNameVI
            }}</el-descriptions-item>
            <el-descriptions-item label="Tên doanh nghiệp EN">{{ editingViolationReport?.company.companyNameEN
            }}</el-descriptions-item>
            <el-descriptions-item label="Code doanh nghiệp">{{ editingViolationReport?.company.companyCode
            }}</el-descriptions-item>
            <el-descriptions-item label="Loại">
              {{ editingViolationReport?.company.companyType?.typeName ?? 'Chưa đánh giá' }}

            </el-descriptions-item>
          </el-descriptions>
          <el-descriptions title="Nội dung" direction="vertical" :column="4" border>
            <el-descriptions-item label="Nội dung vi phạm">{{ editingViolationReport?.description
            }}</el-descriptions-item>
            <el-descriptions-item label="Tài liệu vi phạm">
              <div v-if="_.isEmpty(violationReportStore.violationReportDocuments)">
                <label>Không có</label>
              </div>
              <div v-else>
                <div v-for="doc in violationReportStore.violationReportDocuments" :key="doc.id">
                  <a className="file-item" :key=doc.id target="_blank" rel="noopener noreferrer"
                    :href="'http://localhost:5000/api' + doc.resourceUrl">
                    <el-icon>
                      <Document />
                    </el-icon>{{ doc.documentName }}
                  </a>
                </div>
              </div>
            </el-descriptions-item>
            <el-descriptions-item label="Trạng thái">
              <div v-if="editingViolationReport?.status === 'APPROVED'">Đã duyệt</div>
              <div v-else-if="editingViolationReport?.status === 'REJECTED'">Chưa duyệt</div>
              <div v-else>Đang xử lý</div>
            </el-descriptions-item>
          </el-descriptions>
          <template #footer>
            <el-button type="primary" @click="approveReport" :disabled="editingViolationReport?.status !== 'PENDING'">Xác
              nhận</el-button>
            <el-button type="danger" @click="rejectReport" :disabled="editingViolationReport?.status !== 'PENDING'">Từ
              chối</el-button>
            <el-button @click="dialogVisible = false">Hủy</el-button>
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
}</style>
