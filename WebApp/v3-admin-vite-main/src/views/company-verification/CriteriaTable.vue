<script lang="ts" setup>
import _ from "lodash";
import { useCriteriaTypeStore } from "@/store/criteriaType"
import { useCriteriaStore } from "@/store/criteria";
import { useCriteriaDetailStore } from "@/store/criteriaDetail";
import CriteriaForm from "./tsx/CriteriaForm";

const criteriaTypeStore = useCriteriaTypeStore();
const criteriaStore = useCriteriaStore();
const criteriaDetailStore = useCriteriaDetailStore();

const getCriteriaTable = (criteriaTypeId: number) => {
  return _.filter(criteriaStore.criterias, (x) => x.criteriaTypeId === criteriaTypeId);
}

const getCriteriaDetailsTable = (criteriaId: number) => {
  return _.filter(criteriaDetailStore.criteriaDetail, (x) => x.criteriaId === criteriaId);
}

</script>

<template>
<el-tabs tab-position="left" class="demo-tabs">
  <template v-for="(item, index) in criteriaTypeStore.criteriaType"   
    :item="item"
    :index="index"
    :key="item.id">
    <el-tab-pane  :label="item.criteriaTypeName">
      <el-table :data="getCriteriaTable(item.id)" :border="true" style="width: 100%">
        <el-table-column type="expand">
          <template #default="props">
            <div m="4">
              <el-table :data="getCriteriaDetailsTable(props.row.criteriaId)" :border="true">
                <el-table-column label="STT" type="index" width="100" />
                <el-table-column label="Nội dung kê khai" width="500" prop="criteriaDetailName" />
                <el-table-column label="Tự đánh giá">
                  <CriteriaForm :data=props.row />
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