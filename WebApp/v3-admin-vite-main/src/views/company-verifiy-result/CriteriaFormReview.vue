<script lang="ts" setup>

import { reactive, ref, watch } from "vue"
import _ from "lodash";
import { CriteriaDetail, VerificationCriteria } from "@/types/models";
import { ElMessage, ElMessageBox } from "element-plus"
import { useVerificationProcessStore } from "@/store/verificationProcess";

interface Props {
  data: CriteriaDetail
}

const props = defineProps<Props>()
const verificationProcessStore = useVerificationProcessStore();

const form = reactive({
  currentReviewComment: '',
})

const currentCriteria = verificationProcessStore.verificationCriterias.find((item) => item.criteriaDetailId === props.data.id)
form.currentReviewComment = currentCriteria?.reviewComment ?? '-';

</script>

<template>
  <div>
    <el-form :model="form" label-position="left">
      <el-form-item>
        <el-input v-model="form.currentReviewComment" type="textarea" disabled/>
      </el-form-item>
    </el-form>
  </div>
</template>