<script lang="ts" setup>

import _ from "lodash";
import { CriteriaDetail } from "@/types/models";
import { useVerificationProcessStore } from "@/store/verificationProcess";
interface Props {
  data: CriteriaDetail
}
const props = defineProps<Props>()

const verificationProcessStore = useVerificationProcessStore();

const currentCriteria = verificationProcessStore.verificationCriterias.find((item) => item.criteriaDetailId === props.data.id)
let currentDocuments = _.filter(verificationProcessStore.verificationDocuments, (item) => item.verificationCriteriaId === currentCriteria?.id);

const rate = String(currentCriteria?.companyRate) ?? 'null';

</script>

<template>
  <div>
    <el-radio-group v-model="rate">
      <el-radio v-if="rate === 'true'" label="true" disabled>Đáp ứng</el-radio>
      <el-radio v-if="rate === 'false'" label="false" disabled>Không đáp ứng</el-radio>
      <el-radio v-if="rate === 'null'" label="null" disabled>Không phải loại hình của DN</el-radio>
    </el-radio-group>
    <div>
      <div>
        <label>File đính kèm</label>
      </div>
      <div v-if="_.isEmpty(currentDocuments)">
        <label>Không có</label>
      </div>
      <div v-else>
        <div v-for="doc in currentDocuments" :key="doc.id"> 
          <a
            className="file-item"
            :key=doc.id
            target="_blank"
            rel="noopener noreferrer"
            :href="'http://localhost:5000/api' + doc.resourceUrl"
          >
            <el-icon><Document /></el-icon>{{doc.documentName}}
          </a>
        </div>
      </div>
    </div>
  </div>
</template>