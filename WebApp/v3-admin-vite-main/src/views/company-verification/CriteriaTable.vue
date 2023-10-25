<script lang="ts" setup>
import _ from "lodash";
import { reactive, ref, watch } from "vue"
import { useCriteriaTypeStore } from "@/store/criteriaType"
import { useCriteriaStore } from "@/store/criteria"
import { useCriteriaDetailStore } from "@/store/criteriaDetail"
import { TableInstance } from "element-plus"
import CriteriaForm from "./tsx/CriteriaForm"
import { Criteria, CriteriaDetail } from "@/types/models";

const criteriaTypeStore = useCriteriaTypeStore();
const criteriaStore = useCriteriaStore();
const criteriaDetailStore = useCriteriaDetailStore();
const tableData = ref()

// const rowClicked = (row: any) => {
//   tableData.toggleRowExpansion(row)
// }
</script>

<template>
<el-tabs tab-position="left" class="demo-tabs">
  <template v-for="(item, index) in criteriaTypeStore.criteriaType"   
    :item="item"
    :index="index"
    :key="item.id">
    <el-tab-pane :label="item.criteriaTypeName">
      <el-table ref="tableData" :data="_.filter(criteriaStore.criterias, (x) => x.criteriaTypeId === item.id)" 
        style="width: 100%" class="clickable-rows"
        :row-key="(row) => {return row.id}">
        <el-table-column type="expand">
          <template #default="{ row }">
            <div m="4">
              <el-table :data="_.filter(criteriaDetailStore.criteriaDetail, (x) => x.criteriaId === row.id)">
                <el-table-column label="STT" type="index" width="100" />
                <el-table-column label="Nội dung kê khai" width="500" prop="criteriaDetailName" />
                <el-table-column label="Tự đánh giá">
                  <CriteriaForm :data=row />
                </el-table-column>
              </el-table>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="STT" type="index" width="100"/>
        <el-table-column label="Nội dung kê khai" prop="criteriaName"/>
      </el-table>
    </el-tab-pane>
  </template>
</el-tabs>
</template>

<style>
.clickable-rows {
  tbody tr td {
    cursor: pointer;
  }

  .el-table__expanded-cell {
    cursor: default;
  }
}
</style>