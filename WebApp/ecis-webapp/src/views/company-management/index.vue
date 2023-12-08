<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import dayjs from "dayjs";
import _ from "lodash";
import { usePagination } from "@/hooks/usePagination"
import { Company } from "@/types/models";
import { useCompanyStore } from "@/store/company";
import { ElMessage, ElMessageBox, FormInstance, FormRules } from "element-plus"
import { Search, Refresh, CirclePlus, Delete, RefreshRight } from "@element-plus/icons-vue"
import { CompanyRegistrationDTO } from "@/types/dto";
import { useProvinceStore } from "@/store/province";
defineOptions({
  name: "CompanyManagement"
})

const loading = ref<boolean>(false)
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()

const companies = ref<Company[]>([])
const dialogVisible = ref<boolean>(false)
const dialogUpdateVisible = ref<boolean>(false)
const formRef = ref<FormInstance | null>(null)
const companyStore = useCompanyStore()
const provinceStore = useProvinceStore()
const currentCompany = ref<Company>()
const provinceOption = ref<SelectOption[]>([])
interface SelectOption {
  value: number
  label: string
}

provinceStore.getAllProvinces().then(() => {
  provinceStore.provinces?.map((province) =>
    provinceOption.value.push({value: province.id, label: province.provinceName} as SelectOption))
})

const updateForm = reactive({
  companyCode: "",
  companyNameVI: "",
  companyNameEN: "",
})

const formData = reactive({
  email: "",
  companyCode: "",
  companyNameVI: "",
  companyNameEN: "",
  provinceId: ""
})
const formRules: FormRules = reactive({
  email: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  companyCode: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  companyNameVI: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  provinceId: [{ required: true, trigger: "blur", message: "Không được để trống" }]

})
const handleCreate = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      const formattedData: CompanyRegistrationDTO = {
        ...formData,
        provinceId: parseInt(formData.provinceId),
      }

      companyStore.registerCompany(formattedData)
        .then(() => {
          ElMessage.success("Thêm doanh nghiệp thành công")
          getCompanyData()
        })
        .catch((message) => {
          if (message === 'EmailAlreadyExisted') {
            ElMessage('Email đã tồn tại trong hệ thống');
            return;
          }
          if (message === 'CompanyCodeAlreadyExisted') {
            ElMessage('Mã doanh nghiệp đã tồn tại trong hệ thống');
            return;
          }

          ElMessage.error('Đã có lỗi xảy ra trong quá trình thêm mới doanh nghiệp. Vui lòng thử lại sau.');

        })
        .finally(() => {
          dialogVisible.value = false
        })
    }
  })
}
const handleUpdate = (row: Company) => {
  currentCompany.value = row
  updateForm.companyCode = row.companyCode
  updateForm.companyNameEN = row.companyNameEN
  updateForm.companyNameVI = row.companyNameVI

  dialogUpdateVisible.value = true
  formRef.value?.clearValidate()
}

const updateCompany = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      const updated: Partial<Company> = {
        ...currentCompany.value,
        companyCode: updateForm.companyCode,
        companyNameVI: updateForm.companyNameVI,
        companyNameEN: updateForm.companyNameEN,
      };

      companyStore.updateCompany(updated)
        .then(() => {
          ElMessage.success("Cập nhật doanh nghiệp thành công")
          getCompanyData()
        })
        .catch(() => {
          ElMessage.error('Đã có lỗi xảy ra trong quá trình cập nhật doanh nghiệp. Vui lòng thử lại sau.');

        })
        .finally(() => {
          dialogUpdateVisible.value = false
        })
    }
  })
}

const resetForm = () => {
  formData.email = ""
  formData.companyCode = ""
  formData.companyNameVI = ""
  formData.companyNameEN = ""
  formData.provinceId = ""
  formRef.value?.clearValidate()
}

const getCompanyData = () => {
  loading.value = true

  companyStore.getAll()
    .then((res) => {
      companies.value = res.data
    })
    .catch(() => {
      companies.value = []
    })
    .finally(() => {
      loading.value = false
    })
}

const handleDelete = (row: Company) => {
  ElMessageBox.confirm(`Đang vô hiệu hóa doanh nghiệp: ${row.companyNameVI}, xác nhận vô hiệu hóa? `, "gợi ý", {
    confirmButtonText: "OK",
    cancelButtonText: "Hủy",
    type: "warning"
  }).then(() => {
    companyStore.deleteCompany(row.id).then(() => {
      ElMessage.success("Vô hiệu hóa thành công")
      getCompanyData()
    })
  })
}

const handleActivate = (row: Company) => {
  ElMessageBox.confirm(`Đang kích hoạt lại hóa doanh nghiệp: ${row.companyNameVI}, xác nhận kích hoạt? `, "gợi ý", {
    confirmButtonText: "OK",
    cancelButtonText: "Hủy",
    type: "warning"
  }).then(() => {
    companyStore.activateCompany(row.id).then(() => {
      ElMessage.success("Kích hoạt thành công")
      getCompanyData()
    })
  })
}


watch([() => paginationData.currentPage, () => paginationData.pageSize], getCompanyData, { immediate: true })

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Quản lý doanh nghiệp</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <div class="toolbar-wrapper">
          <div>
            <el-button type="primary" :icon="CirclePlus" @click="dialogVisible = true">Thêm mới</el-button>
          </div>
        </div>
        <el-card v-loading="loading" shadow="never">
          <el-table ref="tableData" :data=companies style="width: 100%" :row-key="(row) => { return row.id }">
            <el-table-column label="STT" type="index" width="100" />
            <el-table-column label="Doanh nghiệp" prop="companyNameVI" />
            <el-table-column label="Thời gian tạo">
              <template #default="scope">
                {{ dayjs(scope.row.createdAt).format('DD/MM/YYYY') }}
              </template>
            </el-table-column>
            <el-table-column fixed="right" label="Hành động" align="center">
              <template #default="scope">

                <el-button v-if="scope.row.isDeleted == true" type="success" text bg size="small" @click="handleActivate(scope.row)">kích hoạt</el-button>
                <el-button v-if="scope.row.isDeleted == false" type="danger" text bg size="small" @click="handleDelete(scope.row)">Vô hiệu hóa</el-button>
                <el-button v-if="scope.row.isDeleted == false" type="primary" text bg size="small" @click="handleUpdate(scope.row)">Cập nhật</el-button>
                <el-button type="primary" text bg size="small">
                  <router-link :to="'/company-management/' + scope.row.id">
                    Xem chi tiết
                  </router-link>
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
        <el-dialog v-model="dialogVisible" title="Thêm mới" @close="resetForm" width="60%">
          <el-form ref="formRef" :model="formData" :rules="formRules" label-width="300px" label-position="left">
            <el-form-item prop="email" label="Email doanh nghiệp (*)">
              <el-input v-model="formData.email" />
            </el-form-item>
            <el-form-item prop="companyCode" label="Mã doanh nghiệp (*)">
              <el-input v-model="formData.companyCode" />
            </el-form-item>
            <el-form-item prop="companyNameVI" label="Tên doanh nghiệp (Tiếng Việt) (*)">
              <el-input v-model="formData.companyNameVI" />
            </el-form-item>
            <el-form-item prop="companyNameEN" label="Tên doanh nghiệp (Tiếng Anh)">
              <el-input v-model="formData.companyNameEN" />
            </el-form-item>
            <!-- <el-form-item prop="provinceId" label="Tỉnh hoạt động (*)">
              <el-input v-model="formData.provinceId" />
            </el-form-item> -->
            <el-form-item label="Tỉnh hoạt động (*)">
              <el-select
              v-model="formData.provinceId"
              placeholder="Select"
              style="width: 240px"
            >
              <el-option
                v-for="item in provinceOption"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
            </el-form-item>
          </el-form>
          <template #footer>
            <el-button @click="dialogVisible = false">Hủy</el-button>
            <el-button type="primary" @click="handleCreate">Tạo</el-button>
          </template>
        </el-dialog>
        <!-- Update -->
        <el-dialog v-model="dialogUpdateVisible" title="Cập nhật" @close="resetForm" width="60%">
          <el-form ref="formRef" :model="updateForm" :rules="formRules" label-width="300px" label-position="left">
            <el-form-item prop="companyCode" label="Mã doanh nghiệp (*)">
              <el-input v-model="updateForm.companyCode" />
            </el-form-item>
            <el-form-item prop="companyNameVI" label="Tên doanh nghiệp (Tiếng Việt) (*)">
              <el-input v-model="updateForm.companyNameVI" />
            </el-form-item>
            <el-form-item prop="companyNameEN" label="Tên doanh nghiệp (Tiếng Anh)">
              <el-input v-model="updateForm.companyNameEN" />
            </el-form-item>
          </el-form>
          <template #footer>
            <el-button @click="dialogUpdateVisible = false">Hủy</el-button>
            <el-button type="primary" @click="updateCompany">Cập nhật</el-button>
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
.toolbar-wrapper{
  padding-bottom: 20px;
}
</style>
