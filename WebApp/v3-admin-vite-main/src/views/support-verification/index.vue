<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import { createTableDataApi, deleteTableDataApi, updateTableDataApi, getTableDataApi } from "@/api/table"
import { type GetTableData } from "@/api/table/types/table"
import { type FormInstance, type FormRules, ElMessage, ElMessageBox } from "element-plus"
import { Search, Refresh, CirclePlus, Delete, Download, RefreshRight } from "@element-plus/icons-vue"
import { usePagination } from "@/hooks/usePagination"

defineOptions({
  name: "ElementPlus"
})

const loading = ref<boolean>(false)
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()

//#region 增
const dialogVisible = ref<boolean>(false)
const formRef = ref<FormInstance | null>(null)
const formData = reactive({
  username: "",
  password: ""
})
const formRules: FormRules = reactive({
  username: [{ required: true, trigger: "blur", message: "请输入用户名" }],
  password: [{ required: true, trigger: "blur", message: "请输入密码" }]
})
const handleCreate = () => {
  formRef.value?.validate((valid: boolean, fields) => {
    if (valid) {
      if (currentUpdateId.value === undefined) {
        createTableDataApi(formData)
          .then(() => {
            ElMessage.success("新增成功")
            getTableData()
          })
          .finally(() => {
            dialogVisible.value = false
          })
      } else {
        updateTableDataApi({
          id: currentUpdateId.value,
          username: formData.username
        })
          .then(() => {
            ElMessage.success("修改成功")
            getTableData()
          })
          .finally(() => {
            dialogVisible.value = false
          })
      }
    } else {
      console.error("表单校验不通过", fields)
    }
  })
}
const resetForm = () => {
  currentUpdateId.value = undefined
  formData.username = ""
  formData.password = ""
}
//#endregion

//#region 删
const handleDelete = (row: GetTableData) => {
   ElMessageBox.confirm(`Deleting user: ${row.username}, confirm deletion?`, "Prompt", {
     confirmButtonText: "OK",
     cancelButtonText: "Cancel",
     type: "warning"
   }).then(() => {
     deleteTableDataApi(row.id).then(() => {
       ElMessage.success("Deletion successful")
       getTableData()
     })
   })
}
//#endregion

//#region change
const currentUpdateId = ref<undefined | string>(undefined)
const handleUpdate = (row: GetTableData) => {
  currentUpdateId.value = row.id
  formData.username = row.username
  dialogVisible.value = true
}
//#endregion

//#region search
const tableData = ref<GetTableData[]>([])
const searchFormRef = ref<FormInstance | null>(null)
const searchData = reactive({
  username: "",
  phone: ""
})
const getTableData = () => {
  loading.value = true
  getTableDataApi({
    currentPage: paginationData.currentPage,
    size: paginationData.pageSize,
    username: searchData.username || undefined,
    phone: searchData.phone || undefined
  })
    .then((res) => {
      paginationData.total = res.data.total
      tableData.value = res.data.list
    })
    .catch(() => {
      tableData.value = []
    })
    .finally(() => {
      loading.value = false
    })
}
const handleSearch = () => {
  paginationData.currentPage === 1 ? getTableData() : (paginationData.currentPage = 1)
}
const resetSearch = () => {
  searchFormRef.value?.resetFields()
  handleSearch()
}
//#endregion

/** Listen for changes in paging parameters */
watch([() => paginationData.currentPage, () => paginationData.pageSize], getTableData, { immediate: true })
</script>

<template>
  <div class="app-container">
    <!-- <el-card v-loading="loading" shadow="never" class="search-wrapper">
      <el-form ref="searchFormRef" :inline="true" :model="searchData">
        <el-form-item prop="username" label="用户名">
          <el-input v-model="searchData.username" placeholder="请输入" />
        </el-form-item>
        <el-form-item prop="phone" label="手机号">
          <el-input v-model="searchData.phone" placeholder="请输入" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" :icon="Search" @click="handleSearch">查询</el-button>
          <el-button :icon="Refresh" @click="resetSearch">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card> -->
    <el-card v-loading="loading" shadow="never">
      <!-- <div class="toolbar-wrapper">
        <div>
          <el-button type="primary" :icon="CirclePlus" @click="dialogVisible = true">新增用户</el-button>
          <el-button type="danger" :icon="Delete">批量删除</el-button>
        </div>
        <div>
          <el-tooltip content="下载">
            <el-button type="primary" :icon="Download" circle />
          </el-tooltip>
          <el-tooltip content="刷新当前页">
            <el-button type="primary" :icon="RefreshRight" circle @click="getTableData" />
          </el-tooltip>
        </div>
      </div> -->
      <div class="table-wrapper">
         <el-table :data="tableData">
           <el-table-column type="selection" width="50" align="center" />
           <el-table-column prop="username" label="username" align="center" />
           <el-table-column prop="roles" label="roles" align="center">
             <template #default="scope">
               <el-tag v-if="scope.row.roles === 'admin'" effect="plain">admin</el-tag>
               <el-tag v-else type="warning" effect="plain">{{ scope.row.roles }}</el-tag>
             </template>
           </el-table-column>
           <el-table-column prop="phone" label="Mobile phone number" align="center" />
           <el-table-column prop="email" label="email" align="center" />
           <el-table-column prop="status" label="status" align="center">
             <template #default="scope">
               <el-tag v-if="scope.row.status" type="success" effect="plain">Enable</el-tag>
               <el-tag v-else type="danger" effect="plain">Disable</el-tag>
             </template>
           </el-table-column>
           <el-table-column prop="createTime" label="Creation Time" align="center" />
           <el-table-column fixed="right" label="Operation" width="150" align="center">
             <template #default="scope">
               <el-button type="primary" text bg size="small" @click="handleUpdate(scope.row)">Modify</el-button>
               <el-button type="danger" text bg size="small" @click="handleDelete(scope.row)">Delete</el-button>
             </template>
           </el-table-column>
         </el-table>
       </div>
      <div class="pager-wrapper">
        <el-pagination
          background
          :layout="paginationData.layout"
          :page-sizes="paginationData.pageSizes"
          :total="paginationData.total"
          :page-size="paginationData.pageSize"
          :currentPage="paginationData.currentPage"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
      </div>
    </el-card>
    <!-- Add/Modify -->
    <el-dialog
       v-model="dialogVisible"
       :title="currentUpdateId === undefined ? 'Add new user' : 'Modify user'"
       @close="resetForm"
       width="30%"
     >
       <el-form ref="formRef" :model="formData" :rules="formRules" label-width="100px" label-position="left">
         <el-form-item prop="username" label="username">
           <el-input v-model="formData.username" placeholder="Please enter" />
         </el-form-item>
         <el-form-item prop="password" label="password" v-if="currentUpdateId === undefined">
           <el-input v-model="formData.password" placeholder="Please enter" />
         </el-form-item>
       </el-form>
       <template #footer>
         <el-button @click="dialogVisible = false">Cancel</el-button>
         <el-button type="primary" @click="handleCreate">Confirm</el-button>
       </template>
     </el-dialog>
  </div>
</template>

<style lang="scss" scoped>
.search-wrapper {
  margin-bottom: 20px;
  :deep(.el-card__body) {
    padding-bottom: 2px;
  }
}

.toolbar-wrapper {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.table-wrapper {
  margin-bottom: 20px;
}

.pager-wrapper {
  display: flex;
  justify-content: flex-end;
}
</style>
