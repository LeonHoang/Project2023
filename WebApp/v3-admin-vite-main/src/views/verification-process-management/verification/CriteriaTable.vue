<script lang="ts" setup>
import _ from "lodash";
import { reactive, ref, watch } from "vue"
import { useCriteriaTypeStore } from "@/store/criteriaType"
import { useCriteriaStore } from "@/store/criteria"
import { useCriteriaDetailStore } from "@/store/criteriaDetail"
import { TableInstance } from "element-plus"
import CriteriaForm from "./CriteriaForm.vue"
import CriteriaFormReview from "./CriteriaFormReview.vue"

import { Criteria, CriteriaDetail } from "@/types/models";
import { useVerificationProcessStore } from "@/store/verificationProcess";
import { ElMessage, ElMessageBox } from "element-plus"

const criteriaTypeStore = useCriteriaTypeStore();
const criteriaStore = useCriteriaStore();
const criteriaDetailStore = useCriteriaDetailStore();
const verificationProcessStore = useVerificationProcessStore()

const loading = ref<boolean>(false)
const tableData = ref<Criteria[]>([])

const getApprovedStatus = (verificationCriteriaId: number) => {
  const currentCriteria = _.find(verificationProcessStore.verificationCriterias, (item) => item.criteriaDetailId === verificationCriteriaId)
  if (!currentCriteria) {
    return null
  }

  return currentCriteria.approvedStatus 
};

const markCompliance = (verificationCriteriaId: number, value: boolean) => {
  verificationProcessStore.updateCriteriaCompliance(verificationCriteriaId, value)
    .then(() => {
      ElMessage.success('Lưu đánh giá thành công.');
    })
    .catch(() => {
      ElMessage.error('Đã xảy ra lỗi trong quá trình lưu đánh giá. Vui lòng thử lại sau.');
    });
};

</script>

<template>
<el-tabs tab-position="left" class="demo-tabs">
  <template v-for="(item, index) in criteriaTypeStore.criteriaType"   
    :item="item"
    :index="index"
    :key="item.id">
    <el-tab-pane :label="item.criteriaTypeName">
      <el-table ref="tableData" :data="criteriaStore.criterias?.filter((x) => x.criteriaTypeId === item.id)" 
        style="width: 100%" class="clickable-rows"
        :row-key="(row) => {return row.id}">
        <el-table-column type="expand">
          <template #default="{ row }">
            <el-table style="width: 100%" :data="criteriaDetailStore.criteriaDetail?.filter((x) => x.criteriaId === row.id)">
              <el-table-column label="STT" type="index" width="100" />
              <el-table-column label="Tiêu chí đánh giá" prop="criteriaDetailName" />
              <el-table-column label="Tự đánh giá" >
                <template #default="scope">
                  <CriteriaForm :data=scope.row />
                </template>
              </el-table-column>
              <el-table-column label="Góp ý">
                <template #default="scope">
                  <CriteriaFormReview :data=scope.row />
                </template>
              </el-table-column>
              <el-table-column label="Đánh giá">
                <template #default="scope">
                  <div v-if="getApprovedStatus(scope.row.id) === 'VERIFIED'"><i className="fa fa-thumbs-up" aria-hidden="true">Đạt</i></div>
                  <div v-else-if="getApprovedStatus(scope.row.id) === 'REJECTED'"><i className="fa fa-thumbs-down" aria-hidden="true">Không Đạt</i></div>
                  <div v-else>Chưa có kết quả</div>
                </template>
              </el-table-column>
              <el-table-column label="Thao tác">
                <template #default="scope">
                    <el-button type="primary" @click="markCompliance(scope.row.id, true)"><el-icon><Select /></el-icon></el-button>
                    <el-button type="primary" @click="markCompliance(scope.row.id, false)"> <el-icon><CloseBold /></el-icon></el-button>
                </template>
              </el-table-column>
            </el-table>
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