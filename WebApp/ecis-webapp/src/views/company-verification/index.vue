<script lang="ts" setup>
import {ref} from "vue"
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import CriteriaTable from "./CriteriaTable.vue"
import { ElMessage, ElMessageBox } from "element-plus"
import { useUserStore } from "@/store/modules/user"
import { useRouter } from "vue-router";

defineOptions({
  name: "CompanyVerification"
})
const loading = ref<boolean>(false)
const isRejected = ref<boolean>(false)
// created
const verificationProcessStore = useVerificationProcessStore()
const userStore = useUserStore()
const accountId = userStore.user_id
const router = useRouter()


const intitialize = () => {
  verificationProcessStore.getProcessIdByAccountId(accountId).then(() => {
  if (verificationProcessStore.processId){
    verificationProcessStore.loadSelfVerification(verificationProcessStore.processId).then(() => {
    if(verificationProcessStore.editingProcess?.status === "IN_PROGRESS" 
      && verificationProcessStore.editingProcess?.submittedCount > 0){
        isRejected.value = true
    }
  })
  }else{
    verificationProcessStore.editingProcess = undefined
  }
})
}

const submit = () => {
  ElMessageBox.confirm(
    'Bạn chắc chắn sẽ gửi bản đánh giá chứ?',
    'Warning',
    {
      confirmButtonText: 'OK',
      cancelButtonText: 'Hủy',
      type: 'warning',
    }
  ).then(() => {
    const processId = verificationProcessStore.editingProcess?.id ?? 0
    verificationProcessStore.submitProcess(processId).then(() => {
      ElMessage.success('Tải tài liệu thành công.');
    })
    .catch(() => {
      ElMessage.error('Đã xảy ra lỗi trong quá trình tải tài liệu. Vui lòng thử lại sau.');
    })
  }).catch(() => {})
  .finally(() => {
    // refresh page
    intitialize()

    router.push({ path: '/company-verifiy-result' })
  })
};

intitialize()

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Doanh nghiệp tự đánh giá</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="!verificationProcessStore.editingProcess" shadow="never">
          <div>
            Hiện tại doanh nghiệp không cần phải đánh giá
            Yêu cầu đánh giá 
            <router-link to="/request-verification" style="color: blue">
              tại đây
            </router-link>
          </div>
        </el-card>
        
        <el-card v-loading="loading" v-if="verificationProcessStore.editingProcess" shadow="never">

          <div v-if="isRejected" style="color: red;">
            Bạn đã gửi đánh giá lần thứ {{ verificationProcessStore.editingProcess?.submittedCount }} / 3.
            Quá số lần gửi quy định sẽ cần đánh giá lại từ đầu.
          </div>
          <br/>
          <div>Bạn có chắc chắn gửi đánh giá lên cho cục kiểm lâm?</div>
          <CriteriaTable/>
          <el-button type="primary" style="display:block; margin: 0 auto;" @click="submit">Gửi đánh giá</el-button>
        </el-card>
      </div>
    </div>
  </div>
</template>

<style>
.demo-tabs{
  height: auto;
}

.demo-tabs > .el-tabs__content {
  padding: 32px;
  color: #6b778c;
  font-size: 32px;
  font-weight: 600;
}

.el-tabs--left .el-tabs__item.is-left, .el-tabs--right .el-tabs__item.is-left {
  max-width: 300px;
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