<script lang="ts" setup>
import { reactive, ref, watch } from "vue"
import _ from "lodash";
import { createTableDataApi, deleteTableDataApi, updateTableDataApi, getTableDataApi } from "@/api/table"
import { type GetTableData } from "@/api/table/types/table"
import { type FormInstance, type FormRules, ElMessage, ElMessageBox } from "element-plus"
import { useVerificationProcessStore } from "@/store/verificationProcess"
import { useCriteriaTypeStore } from "@/store/criteriaType"
import CriteriaListTab from "./tsx/CriteriaListTab";

defineOptions({
  name: "CompanyYerification"
})

const loading = ref<boolean>(false)

// created
const verificationProcessStore = useVerificationProcessStore()
const criteriaTypeStore = useCriteriaTypeStore();
const criteriaStore = useCriteriaStore();

verificationProcessStore.loadSelfVerification()
criteriaTypeStore.getCriteriaType()


const filteredCriterias = _.filter(criteriaStore.criterias, (x) => x.criteriaTypeId === props.criteriaTypeId);


</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <!-- <h2>{`Doanh nghiệp ${verificationProcessStore.company.companyNameVI} tự đánh giá`}</h2> -->
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="!verificationProcessStore.editingProcess" shadow="never">
          <div>
            Hiện tại doanh nghiệp không cần phải đánh giá.
            Yêu cầu đánh giá tại đây.
          </div>
        </el-card>
        
        <el-card v-loading="loading" v-if="verificationProcessStore.editingProcess" shadow="never">
          <el-tabs tab-position="left" class="demo-tabs">
            <template v-for="(item, index) in criteriaTypeStore.criteriaType"   
              :item="item"
              :index="index"
              :key="item.id">
              <el-tab-pane  :label="item.criteriaTypeName">
                <el-table :data="tableData" :border="true" style="width: 100%">
                  <el-table-column type="expand">
                    <template #default="props">
                      <!-- <div m="4">
                        <el-table :data="props.row.family" :border="true">
                          <el-table-column label="Name" prop="name" />
                          <el-table-column label="State" prop="state" />
                          <el-table-column label="City" prop="city" />
                          <el-table-column label="Address" prop="address" />
                          <el-table-column label="Zip" prop="zip" />
                        </el-table>
                      </div> -->
                    </template>
                  </el-table-column>
                  <el-table-column label="STT" :data="(index + 1)" />
                  <el-table-column label="Nội dung kê khai"/>
                </el-table>
              </el-tab-pane>
            </template>
          </el-tabs>
        </el-card>
      </div>
    </div>
  </div>
</template>

<style>
.demo-tabs{
  height: 200px;
}

.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}

.el-tabs--left .el-tabs__item.is-left, .el-tabs--right .el-tabs__item.is-left {
  width: 300px;
  text-wrap: wrap;
}

.el-tabs__item{
  padding: 40px 20px;
}

.el-tabs--right .el-tabs__content,
.el-tabs--left .el-tabs__content {
  height: 100%;
}
</style>