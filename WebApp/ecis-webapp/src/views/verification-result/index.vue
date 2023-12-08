<script lang="ts" setup>
import {ref, watch} from "vue"
import dayjs from "dayjs";
import _ from "lodash";
import { useVerificationProcessStore } from "@/store/verificationProcess"
import { useCompanyTypeModificationStore } from "@/store/companyTypeModification"

import { VerificationProcessRatingDTO } from "@/types/dto"
import { usePagination } from "@/hooks/usePagination"
import { CompanyTypeModification, VerificationProcess } from "@/types/models";

defineOptions({
  name: "VerificationResult"
})

const loading = ref<boolean>(false)
let ratings = ref<VerificationProcessRatingDTO[]>([])
const { paginationData, handleCurrentChange, handleSizeChange } = usePagination()

const companyTypeModifications = ref<CompanyTypeModification[]>([])
const month = ref<number>(new Date().getMonth() + 1)
const year = ref<number>(new Date().getFullYear())

// created
const companyTypeModificationStore = useCompanyTypeModificationStore()

const getCompanyTypeModificationData = () => {
  loading.value = true

  companyTypeModificationStore.getReportPrivate(month.value, year.value)
    .then((res) => {

      paginationData.total = res.data.length
      companyTypeModifications.value = res.data
    })
    .catch(() => {
      companyTypeModifications.value = []
    })
    .finally(() => {
      loading.value = false
    })
}

watch([() => paginationData.currentPage, () => paginationData.pageSize], getCompanyTypeModificationData, { immediate: true })

</script>

<template>
  <div class="app-container">
    <div className="x_panel">
      <div className="x_title">
        <h2>Kết quả phân loại doanh nghiệp</h2>
        <div className="clearfix" />
      </div>
      <div className="x_content">
        <el-card v-loading="loading" v-if="companyTypeModifications.length == 0" shadow="never">
          <div>
            Không có danh sách kết quả
          </div>
        </el-card>

        <el-card v-loading="loading" v-if="companyTypeModifications.length > 0" shadow="never">
            <el-table ref="tableData" :data=companyTypeModifications
              style="width: 100%"
              :row-key="(row) => {return row.id}">
              <el-table-column label="STT" type="index" width="100"/>
              <el-table-column label="Doanh nghiệp" prop="company.companyNameVI"/>
              <el-table-column label="Thời gian tạo">
                <template #default="scope">
                  {{dayjs(scope.row.createdAt).format('DD/MM/YYYY') }}
                </template>
              </el-table-column>
              <el-table-column label="Kết quả phân loại">
                <template #default="scope">
                  {{_.get(scope.row, 'updatedCompanyType.typeName', 'Không có')}}
                </template>
              </el-table-column>
              <el-table-column label="Hành động">
              <template  #default="scope">
                <router-link :to="'/verification-result/'+scope.row.id">
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
