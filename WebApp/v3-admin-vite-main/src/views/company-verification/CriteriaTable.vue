<script lang="ts" setup>
import _ from "lodash";
import { reactive, ref, watch } from "vue"
import { useCriteriaTypeStore } from "@/store/criteriaType"
import { useCriteriaStore } from "@/store/criteria"
import { useCriteriaDetailStore } from "@/store/criteriaDetail"
import { TableInstance } from "element-plus"
import CriteriaForm from "./CriteriaForm.vue"
import { Criteria, CriteriaDetail } from "@/types/models";
import { useVerificationProcessStore } from "@/store/verificationProcess";


const criteriaTypeStore = useCriteriaTypeStore();
const criteriaStore = useCriteriaStore();
const criteriaDetailStore = useCriteriaDetailStore();
const verificationProcessStore = useVerificationProcessStore();

const tableData = ref()

const tableRowClassName = ({
  row,
  rowIndex,
}: {
  row: CriteriaDetail
  rowIndex: number
}) => {
  const currentCriteria = verificationProcessStore.verificationCriterias.find(
    (item) => (item.criteriaDetailId === row.id && item.approvedStatus === "REJECTED")
    )
  if (currentCriteria) {
    return 'danger-row'
  }

  return ''
}

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
            <el-table style="width: 100%" :data="_.filter(criteriaDetailStore.criteriaDetail, (x) => x.criteriaId === row.id)"
              :row-class-name="tableRowClassName">
              <el-table-column label="STT" type="index" width="100" />
              <el-table-column label="Nội dung kê khai" prop="criteriaDetailName" />
              <el-table-column label="Tự đánh giá" >
                <template #default="scope">
                  <CriteriaForm :data=scope.row />
                </template>
              </el-table-column>
            </el-table>
          </template>
        </el-table-column>
        <el-table-column label="STT" type="index" width="100">
        </el-table-column>
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

.el-table .danger-row {
  --el-table-tr-bg-color: var(--el-color-danger-light-9);
}

</style>