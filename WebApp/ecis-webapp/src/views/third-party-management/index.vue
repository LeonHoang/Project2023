<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import dayjs from "dayjs";
import _ from "lodash";
import { usePagination } from "@/hooks/usePagination"
import { ThirdParty } from "@/types/models";
import { useThirdPartyStore } from "@/store/thirdParty";
import { ElMessage, ElMessageBox, FormInstance, FormRules } from "element-plus"
import { Search, Refresh, CirclePlus, Delete, RefreshRight } from "@element-plus/icons-vue"
import { ThirdPartyRegisterDTO } from "@/types/dto";
defineOptions({
  name: "ThirdPartyManagement"
})

const loading = ref<boolean>(false)
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()

const thirdParties = ref<ThirdParty[]>([])
const dialogVisible = ref<boolean>(false)
const dialogUpdateVisible = ref<boolean>(false)
const formRef = ref<FormInstance | null>(null)
const thirdPartyStore = useThirdPartyStore()
const currentThirdParty = ref<ThirdParty>()

const updateForm = reactive({
  userName: ""
})

const formData = reactive({
  email: "",
  userName: "",
})
const formRules: FormRules = reactive({
  email: [{ required: true, trigger: "blur", message: "Không được để trống" }],
  userName: [{ required: true, trigger: "blur", message: "Không được để trống" }]

})
const handleCreate = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      const formattedData: ThirdPartyRegisterDTO= {
        ...formData,
      }

      thirdPartyStore.registerThirdParty(formattedData)
        .then(() => {
          ElMessage.success("Thêm bên thụ hưởng thành công")
          getThirdPartyData()
        })
        .catch((message) => {
          if (message === 'EmailExisted') {
            ElMessage('Email đã tồn tại trong hệ thống');
            return;
          }

          ElMessage.error('Đã có lỗi xảy ra trong quá trình thêm mới bên thụ hưởng. Vui lòng thử lại sau.');

        })
        .finally(() => {
          dialogVisible.value = false
        })
    }
  })
}
const handleUpdate = (row: ThirdParty) => {
  currentThirdParty.value = row
  updateForm.userName = row.userName

  dialogUpdateVisible.value = true
  formRef.value?.clearValidate()
}

const updateThirdParty = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      const updated: Partial<ThirdParty> = {
        ...currentThirdParty.value,
        userName: updateForm.userName
      };

      thirdPartyStore.updateThirdParty(updated)
        .then(() => {
          ElMessage.success("Cập nhật bên thụ hưởng thành công")
          getThirdPartyData()
        })
        .catch(() => {
          ElMessage.error('Đã có lỗi xảy ra trong quá trình cập nhật bên thụ hưởng. Vui lòng thử lại sau.');

        })
        .finally(() => {
          dialogUpdateVisible.value = false
        })
    }
  })
}

const resetForm = () => {
  formData.email = ""
  formData.userName = ""
  formRef.value?.clearValidate()
}

const getThirdPartyData = () => {
  loading.value = true

  thirdPartyStore.getAll()
    .then((res) => {
      thirdParties.value = res.data
    })
    .catch(() => {
      thirdParties.value = []
    })
    .finally(() => {
      loading.value = false
    })
}

const handleDelete = (row: ThirdParty) => {
  ElMessageBox.confirm(`Đang vô hiệu hóa bên thụ hưởng: ${row.userName}, xác nhận vô hiệu hóa? `, "gợi ý", {
    confirmButtonText: "OK",
    cancelButtonText: "Hủy",
    type: "warning"
  }).then(() => {
    thirdPartyStore.deleteThirdParty(row.id).then(() => {
      ElMessage.success("Vô hiệu hóa thành công")
      getThirdPartyData()
    })
  })
}

const handleActivate = (row: ThirdParty) => {
  ElMessageBox.confirm(`Đang kích hoạt lại hóa bên thụ hưởng: ${row.userName}, xác nhận kích hoạt? `, "gợi ý", {
    confirmButtonText: "OK",
    cancelButtonText: "Hủy",
    type: "warning"
  }).then(() => {
    thirdPartyStore.activateThirdParty(row.id).then(() => {
      ElMessage.success("Kích hoạt thành công")
      getThirdPartyData()
    })
  })
}


watch([() => paginationData.currentPage, () => paginationData.pageSize], getThirdPartyData, { immediate: true })

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Quản lý bên thụ hưởng</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <div class="toolbar-wrapper">
          <div>
            <el-button type="primary" :icon="CirclePlus" @click="dialogVisible = true">Thêm mới</el-button>
          </div>
        </div>
        <el-card v-loading="loading" shadow="never">
          <el-table ref="tableData" :data=thirdParties style="width: 100%" :row-key="(row) => { return row.id }">
            <el-table-column label="STT" type="index" width="100" />
            <el-table-column label="bên thụ hưởng" prop="userName" />
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
            <el-form-item prop="email" label="Email bên thụ hưởng (*)">
              <el-input v-model="formData.email" />
            </el-form-item>
            <el-form-item prop="userName" label="Tên tài khoản (*)">
              <el-input v-model="formData.userName" />
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
            <el-form-item prop="userName" label="Tên tài khoản (*)">
              <el-input v-model="updateForm.userName" />
            </el-form-item>
          </el-form>
          <template #footer>
            <el-button @click="dialogUpdateVisible = false">Hủy</el-button>
            <el-button type="primary" @click="updateThirdParty">Cập nhật</el-button>
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
