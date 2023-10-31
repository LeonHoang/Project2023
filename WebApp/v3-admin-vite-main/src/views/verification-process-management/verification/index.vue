<script lang="ts" setup>
import {ref} from "vue"
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import { VerificationProcessRatingDTO } from "@/types/dto";

defineOptions({
  name: "Verification"
})

const loading = ref<boolean>(false)
let ratings = ref<VerificationProcessRatingDTO[]>([])

// created
const verificationProcessStore = useVerificationProcessStore()
verificationProcessStore.getAllPending()
.then(() => 
{
  const processIds = _.map(verificationProcessStore.verificationProcess, 'id');
  if(processIds.length > 0){
    verificationProcessStore.getRatingCount(processIds)
    ratings.value = verificationProcessStore.ratings
  }
});

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Danh sách yêu cầu đánh giá</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="verificationProcessStore.verificationProcess.length == 0" shadow="never">
          <div>
            Không có yêu cầu
          </div>
        </el-card>
        
        <el-card v-loading="loading" v-if="verificationProcessStore.verificationProcess.length > 0" shadow="never">
            <el-table ref="tableData" :data=verificationProcessStore.verificationProcess
              style="width: 100%"
              :row-key="(row) => {return row.id}">
              <el-table-column label="STT" type="index" width="100"/>
              <el-table-column label="Doanh nghiệp" prop="company.companyNameVI"/>
              <el-table-column label="Thời gian tạo" prop="createdAt"/>
              <el-table-column label="Hạn đánh giá" prop="submitDeadline"/>
              <el-table-column label="Kết quả đánh giá" prop="submitDeadline"/>
              <el-table-column label="Hành động">
                <Link className="btn btn-default" to="/verification/{id}">Đánh giá</Link>
              </el-table-column>
            </el-table>
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