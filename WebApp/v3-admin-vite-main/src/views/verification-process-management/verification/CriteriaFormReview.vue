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
form.currentReviewComment = currentCriteria?.reviewComment ?? '';

const updateReviewComment = () => {
  const updated: Partial<VerificationCriteria> = {
    ...currentCriteria,
    reviewComment: form.currentReviewComment,
  };
  verificationProcessStore.updateVerificationCriteria(updated)
    .then(() => {
      ElMessage.success('Cập nhật đánh giá thành công.');
    })
    .catch(() => {
      ElMessage.error('Đã xảy ra lỗi trong quá trình cập nhật đánh giá. Vui lòng thử lại sau.');
    });
};

</script>

<template>
  <div>
    <el-form :model="form" label-position="left">
      <el-form-item>
        <el-input v-model="form.currentReviewComment" type="textarea" placeholder="Ý kiến riêng"/>
        <el-button type="primary" :onClick="updateReviewComment" style="marginTop: 8px">Lưu ý kiến</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>