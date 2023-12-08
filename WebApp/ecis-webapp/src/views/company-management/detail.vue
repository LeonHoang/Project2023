<script lang="ts" setup>
import { ref } from "vue"
import _ from "lodash";
import { useRoute } from "vue-router";
import { Company } from "@/types/models";
import { useCompanyStore } from "@/store/company";

defineOptions({
  name: "CompanyDetail"
})
const loading = ref<boolean>(false)
const route = useRoute()
const companyId = route.params && route.params.id
// created
const companyStore = useCompanyStore()
const company = ref<Company>()

companyStore.getById(Number(companyId))
.then((res) => {
  company.value = res.data
})
.catch(() => {
  company.value = undefined
})

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_breadcrumb">
        <router-link to="/company-management/list">
          <el-button type="primary" style="display:block; margin-bottom: 20px;">
            Quay lại
          </el-button>
        </router-link>
      </div>
      <div className="x_content">
        <el-descriptions title="Thông tin doanh nghiệp" direction="vertical" :column="4" border>
          <el-descriptions-item label="Code doanh nghiệp">{{ company?.companyCode }}</el-descriptions-item>
          <el-descriptions-item label="Tên doanh nghiệp VI" :span="2">{{ company?.companyNameVI }}</el-descriptions-item>
          <el-descriptions-item label="Tên doanh nghiệp EN">{{ company?.companyNameEN }}</el-descriptions-item>

          <el-descriptions-item label="Loại">
            {{ company?.companyType?.typeName }}

          </el-descriptions-item>
          <el-descriptions-item label="Mô tả">
            {{ company?.companyType?.description }}
          </el-descriptions-item>
        </el-descriptions>
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
