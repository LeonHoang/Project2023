<script lang="ts" setup>

import _ from "lodash";
import { reactive, ref, watch } from "vue"

// import fileServices from "@/common/services/file.services";
// import helpers from "@/common/utils/helpers";
// import config from "@/config";
import { CriteriaDetail, VerificationCriteria, VerificationDocument } from "@/types/models";
import { useVerificationProcessStore } from "@/store/verificationProcess";
import { ElMessage, ElMessageBox } from "element-plus"
import type { UploadProps, UploadUserFile } from 'element-plus'

interface Props {
  data: CriteriaDetail
}
const props = defineProps<Props>()

const loading = ref<boolean>(false)
const fileList = ref<UploadUserFile[]>([])
const verificationProcessStore = useVerificationProcessStore();

const form = reactive({
  opinion: '',
  rate: '',
})

const currentCriteria = verificationProcessStore.verificationCriterias.find((item) => item.criteriaDetailId === props.data.id)
const currentDocuments = _.filter(verificationProcessStore.verificationDocuments, (item) => item.verificationCriteriaId === currentCriteria?.id);
_.map(currentDocuments, (item) => (
  fileList.value.push({name: item.documentName, size: item.resourceSize, url: item.resourceUrl} as UploadUserFile)
))

form.opinion = currentCriteria?.companyOpinion ?? '';
form.rate = String(currentCriteria?.companyRate) ?? 'null';

const updateCompanyRate = (data: any) => {
  const updated: Partial<VerificationCriteria> = {
    ...currentCriteria,
    companyRate: form.rate == 'null' ? null:  Boolean(form.rate),
  };
  verificationProcessStore.updateVerificationCriteria(updated)
    .then(() => {
      ElMessage.success('Cập nhật đánh giá thành công.')
    })
    .catch(() => {
      ElMessage.error('Đã xảy ra lỗi trong quá trình cập nhật đánh giá. Vui lòng thử lại sau.');
    });
};

const updateCompanyOpinion = () => {
  const updated: Partial<VerificationCriteria> = {
    ...currentCriteria,
    companyOpinion: form.opinion,
  };
  verificationProcessStore.updateVerificationCriteria(updated)
    .then(() => {
      ElMessage.success('Cập nhật đánh giá thành công.');
    })
    .catch(() => {
      ElMessage.error('Đã xảy ra lỗi trong quá trình cập nhật đánh giá. Vui lòng thử lại sau.');
    });
};



const handleRemove: UploadProps['onRemove'] = (file, uploadFiles) => {
  console.log(file, uploadFiles)
}

const handlePreview: UploadProps['onPreview'] = (uploadFile) => {
  console.log(uploadFile)
}

const beforeRemove: UploadProps['beforeRemove'] = (uploadFile, uploadFiles) => {
  return ElMessageBox.confirm(
    `Cancel the transfer of ${uploadFile.name} ?`
  ).then(
    () => true,
    () => false
  )
}

const handleChange: UploadProps['onChange'] = (uploadFile, uploadFiles) => {
  fileList.value = uploadFiles
}
</script>

<template>
    <el-form :model="form" label-position="left">
      <el-form-item>
        <el-radio-group v-model="form.rate" :onChange="updateCompanyRate">
          <el-radio label="true">Đáp ứng</el-radio>
          <el-radio label="false">Không đáp ứng</el-radio>
          <el-radio label="null">Không phải loại hình của DN</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item>
        <el-input v-model="form.opinion" type="textarea" placeholder="Ý kiến riêng"/>
        <el-button type="primary" :onClick="updateCompanyOpinion" style="marginTop: 8px">Lưu ý kiến</el-button>
      </el-form-item>
      <el-upload
        v-model:file-list="fileList"
        class="upload-demo"
        action="#"
        multiple
        :on-preview="handlePreview"
        :on-remove="handleRemove"
        :before-remove="beforeRemove"
        :on-change="handleChange"
      >
        <el-button type="primary">Chọn file</el-button>
      </el-upload>
    </el-form>
</template>