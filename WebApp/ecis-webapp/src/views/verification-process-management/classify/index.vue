<script lang="ts" setup>
import {ref, watch} from "vue"
import dayjs from "dayjs";
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import { VerificationProcessRatingDTO } from "@/types/dto"
import { usePagination } from "@/hooks/usePagination"
import { VerificationProcess } from "@/types/models";

defineOptions({
  name: "Verification"
})

const loading = ref<boolean>(false)
let ratings = ref<VerificationProcessRatingDTO[]>([])
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()
const verificationProcessData = ref<VerificationProcess[]>([])

// created
const verificationProcessStore = useVerificationProcessStore()

const getVerificationProcessData = () => {
  loading.value = true

  verificationProcessStore.getAllReviewed()
    .then((res) => {
      const processIds = _.map(verificationProcessStore.verificationProcess, 'id');
      if(processIds.length > 0){
        verificationProcessStore.getRatingCount(processIds).then(() => {
          ratings.value = verificationProcessStore.ratings
        })
      }

      paginationData.total = res.data.length
      verificationProcessData.value = res.data
    })
    .catch(() => {
      verificationProcessData.value = []
    })
    .finally(() => {
      loading.value = false
    })
}

/** 监听分页参数的变化 */
watch([() => paginationData.currentPage, () => paginationData.pageSize], getVerificationProcessData, { immediate: true })

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Phân loại đánh giá</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="verificationProcessStore.verificationProcess.length == 0" shadow="never">
          <div>
            Không có danh sách yêu cầu phân loại 
          </div>
        </el-card>
        
        <el-card v-loading="loading" v-if="verificationProcessStore.verificationProcess.length > 0" shadow="never">
            <el-table ref="tableData" :data=verificationProcessData
              style="width: 100%"
              :row-key="(row) => {return row.id}">
              <el-table-column label="STT" type="index" width="100"/>
              <el-table-column label="Doanh nghiệp" prop="company.companyNameVI"/>
              <el-table-column label="Kết quả đánh giá" >
                <template #default="scope">
                  <div>Đạt: {{ratings.find((item) => item.verificationProcessId === scope.row.id)?.verifiedCount}}/{{ratings.find((item) => item.verificationProcessId === scope.row.id)?.totalCount}}</div>
                  <div>Không đạt: {{ratings.find((item) => item.verificationProcessId === scope.row.id)?.rejectedCount}}/{{ratings.find((item) => item.verificationProcessId === scope.row.id)?.totalCount}}</div>
                </template>  
              </el-table-column>
              <el-table-column label="Hành động">
              <template  #default="scope">
                <router-link :to="'/verification-process/classify/'+scope.row.id">
                  <el-button type="primary" style="display:block; margin: 0 auto;">
                    Xem chi tiết
                  </el-button>
                </router-link>
              </template>
            </el-table-column>
            </el-table>
            <div class="pager-wrapper">
              <el-pagination
                background
                :layout="paginationData.layout"
                :page-sizes="paginationData.pageSizes"
                :total="paginationData.total"
                :page-size="paginationData.pageSize"
                :currentPage="paginationData.currentPage"
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
              />
            </div>
            </el-card>
      </div>
    </div>
  </div>
</template>

<style>
.pager-wrapper{
padding-top: 20px;
}
</style>