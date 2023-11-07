<script lang="ts" setup>
import {ref} from "vue"
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import CriteriaTable from "./CriteriaTable.vue"
import { ElMessage, ElMessageBox } from "element-plus"
import { useUserStore } from "@/store/modules/user"
import { useRoute } from "vue-router";

defineOptions({
  name: "VerificationDetail"
})

const loading = ref<boolean>(false)
// created
const route = useRoute()
const processId = route.params && route.params.id

const verificationProcessStore = useVerificationProcessStore()
verificationProcessStore.setProcessId(Number(processId))
verificationProcessStore.loadSelfVerification(Number(processId))

const canSubmit = _(verificationProcessStore.verificationCriterias)
    .filter((criteria) => criteria.approvedStatus === 'PENDING')
    .isEmpty();

const submit = () => {
  ElMessageBox.confirm(
    'Bạn chắc chắn sẽ gửi bản đánh giá chứ?',
    'Warning',
    {
      confirmButtonText: 'OK',
      cancelButtonText: 'Hủy',
      type: 'warning',
    }
  )
    .then(() => {
      const processId = verificationProcessStore.editingProcess?.id ?? 0
      verificationProcessStore.submitProcess(processId).then(() => {
        ElMessage.success('Tải tài liệu thành công.');
      })
    })
    .catch(() => {
      ElMessage.error('Đã xảy ra lỗi trong quá trình tải tài liệu. Vui lòng thử lại sau.');
    })
};

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Đánh giá sự tuân thủ của doanh nghiệp {{verificationProcessStore.company?.companyNameVI}}</h2>
        <div className="clearfix" />
      </div>
      <div className="x_breadcrumb">
        <router-link to="/verification-process/verification">
          <el-button type="primary" style="display:block; margin-bottom: 20px;">
            Quay lại
          </el-button>
        </router-link>
      </div>
      <div className="x_content">
        
        <el-card v-loading="loading" shadow="never">
          <CriteriaTable/>
          <!-- <el-button type="primary" style="display:block; margin: 0 auto;" @click="submit">Gửi đánh giá</el-button> -->
        </el-card>
      </div>
      <div style="marginTop: 24px">
          <router-link
            className="btn btn-default"
            :to="'/verify-verification-assign?companyId=' + verificationProcessStore.editingProcess?.companyId"
          >
            Yêu cầu xác minh
          </router-link>
          <!-- <el-button
            className="btn btn-default"
            @click=approveAllCriterias
            disabled=approveAllSubmiting
          >
            Đánh dấu tất cả đạt
          </el-button>
          <div v-if="canSubmit">
            <el-button
                className="btn btn-primary"
                @click=setOpeningSubmitModal(true)
              >
                Duyệt kết quả
              </el-button>
          </div> -->
          <!-- <div v-else>
            <Popup
                on={['hover']}
                position="top center"
                trigger={(
                  <span>
                    <button className="btn btn-primary" disabled>
                      Duyệt kết quả
                    </button>
                  </span>
                )}
              >
                Vui lòng đánh giá đầy đủ tiêu chí trước khi duyệt kết quả
              </Popup>
          </div> -->
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

.el-table .cell {
  word-break: break-word;
}
</style>