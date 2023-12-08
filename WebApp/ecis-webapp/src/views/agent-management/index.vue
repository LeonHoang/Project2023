<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import dayjs from "dayjs";
import _ from "lodash";
import { usePagination } from "@/hooks/usePagination"
import { Agent } from "@/types/models";
import { useAgentStore } from "@/store/agent";
import { ElMessage, ElMessageBox, FormInstance, FormRules } from "element-plus"
import { Search, Refresh, CirclePlus, Delete, RefreshRight } from "@element-plus/icons-vue"
import { AgentCreateDTO } from "@/types/dto";
import { useProvinceStore } from "@/store/province";

defineOptions({
  name: "AgentManagement"
})
interface SelectOption {
  value: number
  label: string
}

const loading = ref<boolean>(false)
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()
const provinceOption = ref<SelectOption[]>([])

const agents = ref<Agent[]>([])
const dialogVisible = ref<boolean>(false)
const dialogUpdateVisible = ref<boolean>(false)
const formRef = ref<FormInstance | null>(null)
const agentStore = useAgentStore()
const currentAgent = ref<Agent>()
const provinceStore = useProvinceStore()

provinceStore.getAllProvinces().then(() => {
  provinceStore.provinces?.map((province) =>
    provinceOption.value.push({value: province.id, label: province.provinceName} as SelectOption))
})

const updateForm = reactive({
  firstName: "",
  lastName: "",
  phoneNumber: "",
  gender: "",
  address: "",
  dateOfBirth: new Date,
  provinceIds: [] as number[]
})

const formData = reactive({
  email: "",
  firstName: "",
  lastName: "",
  phoneNumber: "",
  gender: "",
  address: "",
  dateOfBirth: new Date,
  provinceIds: [] as number[]
})

const formRules: FormRules = reactive({
  email: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  firstName: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  lastName: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  phoneNumber: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  gender: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  address: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  dateOfBirth: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  provinceIds: [{ required: true, trigger: "blur", message: "Không được để trống" }],
})

const handleCreate = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      const formattedData: AgentCreateDTO
       = {
        ...formData,
        dateOfBirth: formData.dateOfBirth.toISOString(),
        provinceIds: formData.provinceIds,
      }

      agentStore.createAgent(formattedData)
        .then(() => {
          ElMessage.success("Thêm kiểm lâm tỉnh thành công")
          getAgentData()
        })
        .catch((message) => {
          if (message === 'EmailExisted') {
            ElMessage('Email đã tồn tại trong hệ thống');
            return;
          }
          if (message === 'InvalidProvince') {
            ElMessage('tỉnh không tồn tại trong hệ thống');
            return;
          }

          ElMessage.error('Đã có lỗi xảy ra trong quá trình thêm mới kiểm lâm tỉnh. Vui lòng thử lại sau.');

        })
        .finally(() => {
          dialogVisible.value = false
        })
    }
  })
}
const handleUpdate = (row: Agent) => {
  currentAgent.value = row
  updateForm.firstName = row.firstName
  updateForm.lastName = row.lastName
  updateForm.phoneNumber = row.phoneNumber
  updateForm.gender = row.gender
  updateForm.address = row.address
  updateForm.dateOfBirth = row.dateOfBirth
  updateForm.provinceIds = row.provinceIds

  dialogUpdateVisible.value = true
  formRef.value?.clearValidate()
}

const updateAgent = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      const updated: Partial<Agent> = {
        ...currentAgent.value,
        firstName: updateForm.firstName,
        lastName: updateForm.lastName,
        phoneNumber: updateForm.phoneNumber,
        gender: updateForm.gender,
        address: updateForm.address,
        dateOfBirth: updateForm.dateOfBirth,
      };

      agentStore.updateAgent(updated)
        .then(() => {
          ElMessage.success("Cập nhật kiểm lâm tỉnh thành công")
          getAgentData()
        })
        .catch(() => {
          ElMessage.error('Đã có lỗi xảy ra trong quá trình cập nhật kiểm lâm tỉnh. Vui lòng thử lại sau.');
        })
        .finally(() => {
          dialogUpdateVisible.value = false
        })
    }
  })
}

const resetForm = () => {
  formData.email = ""
  formData.firstName= ""
  formData.lastName= ""
  formData.phoneNumber= ""
  formData.gender= ""
  formData.address= ""
  formData.dateOfBirth = new Date()
  formData.provinceIds= []
  formRef.value?.clearValidate()
}

const getAgentData = () => {
  loading.value = true

  agentStore.getAll()
    .then((res) => {
      agents.value = res.data
    })
    .catch(() => {
      agents.value = []
    })
    .finally(() => {
      loading.value = false
    })
}

const handleDelete = (row: Agent) => {
  ElMessageBox.confirm(`Đang vô hiệu hóa kiểm lâm tỉnh: ${row.lastName} ${row.firstName}, xác nhận vô hiệu hóa? `, "gợi ý", {
    confirmButtonText: "OK",
    cancelButtonText: "Hủy",
    type: "warning"
  }).then(() => {
    agentStore.deleteAgent(row.id).then(() => {
      ElMessage.success("Vô hiệu hóa thành công")
      getAgentData()
    })
  })
}

const handleActivate = (row: Agent) => {
  ElMessageBox.confirm(`Đang kích hoạt lại hóa kiểm lâm tỉnh: ${row.lastName} ${row.firstName}, xác nhận kích hoạt? `, "gợi ý", {
    confirmButtonText: "OK",
    cancelButtonText: "Hủy",
    type: "warning"
  }).then(() => {
    agentStore.activateAgent(row.id).then(() => {
      ElMessage.success("Kích hoạt thành công")
      getAgentData()
    })
  })
}


watch([() => paginationData.currentPage, () => paginationData.pageSize], getAgentData, { immediate: true })

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Quản lý kiểm lâm tỉnh</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <div class="toolbar-wrapper">
          <div>
            <el-button type="primary" :icon="CirclePlus" @click="dialogVisible = true">Thêm mới</el-button>
          </div>
        </div>
        <el-card v-loading="loading" shadow="never">
          <el-table ref="tableData" :data=agents style="width: 100%" :row-key="(row) => { return row.id }">
            <el-table-column label="STT" type="index" width="100" />
            <el-table-column label="kiểm lâm tỉnh">
              <template #default="scope">
                {{ scope.row.lastName + " " + scope.row.firstName }}
              </template>
            </el-table-column>
            <!-- <el-table-column label="tỉnh hoạt động">
              <template #default="scope">
                {{ provinceStore.provinces?.filter((x) => scope.row.provinceIds.includes(x.id)).toString }}
              </template>
            </el-table-column> -->
            <el-table-column label="Ngày sinh">
              <template #default="scope">
                {{ dayjs(scope.row.dateOfBirth).format('DD/MM/YYYY') }}
              </template>
            </el-table-column>
            <el-table-column label="Số điện thoại" prop="phoneNumber" />
            <el-table-column label="Giới tính" prop="gender" />
            <el-table-column label="Địa chỉ" prop="address" />

            <el-table-column fixed="right" label="Hành động" align="center">
              <template #default="scope">
                <el-button v-if="scope.row.isDeleted == true" type="success" text bg size="small" @click="handleActivate(scope.row)">kích hoạt</el-button>
                <el-button v-if="scope.row.isDeleted == false" type="danger" text bg size="small" @click="handleDelete(scope.row)">Vô hiệu hóa</el-button>
                <el-button v-if="scope.row.isDeleted == false" type="primary" text bg size="small" @click="handleUpdate(scope.row)">Cập nhật</el-button>
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
            <el-form-item prop="email" label="Email (*)">
              <el-input v-model="formData.email" />
            </el-form-item>
            <el-form-item prop="lastName" label="Họ (*)">
              <el-input v-model="formData.lastName" />
            </el-form-item>
            <el-form-item prop="firstName" label="Tên (*)">
              <el-input v-model="formData.firstName" />
            </el-form-item>
            <el-form-item prop="dateOfBirth" label="Ngày sinh (*)">
              <el-date-picker
                v-model="formData.dateOfBirth"
                type="date"
                placeholder="Pick a date"
                style="width: 100%"
              />
            </el-form-item>
            <el-form-item prop="phoneNumber" label="Số điện thoại">
              <el-input v-model="formData.phoneNumber" />
            </el-form-item>
            <el-form-item prop="gender" label="Giới tính (*)">
              <el-radio-group v-model="formData.gender">
                <el-radio label="Nam" />
                <el-radio label="Nữ" />
                <el-radio label="Khác" />
              </el-radio-group>
            </el-form-item>
            <el-form-item prop="address" label="Địa chỉ (*)">
              <el-input v-model="formData.address" />
            </el-form-item>
            <el-form-item label="Tỉnh hoạt động (*)">
              <el-select
              v-model="formData.provinceIds"
              multiple
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
            <el-form-item prop="lastName" label="Họ (*)">
              <el-input v-model="updateForm.lastName" />
            </el-form-item>
            <el-form-item prop="firstName" label="Tên (*)">
              <el-input v-model="updateForm.firstName" />
            </el-form-item>
            <el-form-item prop="dateOfBirth" label="Ngày sinh (*)">
              <el-date-picker
                v-model="updateForm.dateOfBirth"
                type="date"
                placeholder="Pick a date"
                style="width: 100%"
              />
            </el-form-item>
            <el-form-item prop="phoneNumber" label="Số điện thoại">
              <el-input v-model="updateForm.phoneNumber" />
            </el-form-item>
            <el-form-item prop="gender" label="Giới tính (*)">
              <el-radio-group v-model="updateForm.gender">
                <el-radio label="Nam" />
                <el-radio label="Nữ" />
                <el-radio label="Khác" />
              </el-radio-group>
            </el-form-item>
            <el-form-item prop="address" label="Địa chỉ (*)">
              <el-input v-model="updateForm.address" />
            </el-form-item>
          </el-form>
          <template #footer>
            <el-button @click="dialogUpdateVisible = false">Hủy</el-button>
            <el-button type="primary" @click="updateAgent">Cập nhật</el-button>
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
