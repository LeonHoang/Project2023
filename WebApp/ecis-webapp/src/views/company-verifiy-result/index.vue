<script lang="ts" setup>
import {ref} from "vue"
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import CriteriaTable from "./CriteriaTable.vue"
import { ElMessage, ElMessageBox } from "element-plus"
import { useUserStore } from "@/store/modules/user"

defineOptions({
  name: "CompanyVerification"
})
const loading = ref<boolean>(false)

const verificationProcessStore = useVerificationProcessStore()
verificationProcessStore.loadLastSelfVerification()

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Kết quả xác minh đánh giá</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="verificationProcessStore.editingProcess?.status === 'IN_PROGRESS'" shadow="never">
          <div className="x_content">
            Doanh nghiệp chưa gửi cho kiểm lâm đánh giá. Vui lòng hoàn thành đánh giá 
            <router-link to="/company-verification" style="color: blue">
              tại đây.
            </router-link>
          </div>
        </el-card>
        <el-card v-loading="loading" v-else-if="verificationProcessStore.editingProcess?.status === 'FINISHED'" shadow="never">
          <div>
            Hiện tại doanh nghiệp không trong quá trình đánh giá
            Yêu cầu đánh giá
            <router-link to="/request-verification" style="color: blue">
              tại đây.
            </router-link>
          </div>
        </el-card>
        <el-card v-loading="loading" v-else shadow="never">
          <div>
            Hiện tại doanh nghiệp đang trong quá trình đánh giá
            Bạn đã gửi đánh giá lần thứ {{ verificationProcessStore.editingProcess?.submittedCount }} / 3.
          </div>
          <CriteriaTable />
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