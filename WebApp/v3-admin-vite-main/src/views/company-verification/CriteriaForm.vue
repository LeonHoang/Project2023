<script lang="ts" setup>

import _ from "lodash";
import { reactive, ref, watch } from "vue"

import fileServices from "@/services/file.services";
import helpers from "@/utils/helpers";
import config from "@/config";
import { CriteriaDetail, VerificationCriteria, VerificationDocument } from "@/types/models";
import { useVerificationProcessStore } from "@/store/verificationProcess";
import { ElMessage, ElMessageBox } from "element-plus"
import type { UploadProps, UploadUserFile } from 'element-plus'
import { url } from "inspector";

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
let currentDocuments = _.filter(verificationProcessStore.verificationDocuments, (item) => item.verificationCriteriaId === currentCriteria?.id);
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


const handleRemove: UploadProps['onRemove'] = (file) => {
  const fileUrl = file.url ?? file.response?.url;
  let id = _.find(currentDocuments, (item) => item.resourceUrl === fileUrl)?.id;

  if(id){
    verificationProcessStore.removeDocument(id)
  .then(() => {
    ElMessage.success('Gỡ bỏ tài liệu thành công.');
  })
  .catch(() => {
    ElMessage.error('Đã xảy ra lỗi trong quá trình gỡ bỏ tài liệu. Vui lòng thử lại sau.');
  });
  } else{
    ElMessage.error('Không tồn tại tài liệu để gỡ bỏ');
  }
}

const handlePreview: UploadProps['onPreview'] = (uploadFile) => {
  const a = document.createElement('a')
  const fileUrl = uploadFile.url ?? uploadFile.response?.url
  a.href = "http://localhost:5000/api" + fileUrl
  a.target = "_blank"
  a.click()
}

const beforeRemove: UploadProps['beforeRemove'] = (uploadFile) => {
  return ElMessageBox.confirm(
    `Gỡ bỏ file ${uploadFile.name} ?`
  ).then(
    () => true,
    () => false
  )
}

const createDoc: UploadProps['onSuccess'] = (uploadFile) => {
  verificationProcessStore.createDocument({
    resourceSize: uploadFile.size,
    resourceType: uploadFile.type,
    documentName: uploadFile.name,
    resourceUrl: uploadFile.url,
    verificationCriteriaId: currentCriteria?.id,
    uploaderType: 'BY_COMPANY',
  })
  .then(() => {
    currentDocuments = []
    currentDocuments = _.filter(verificationProcessStore.verificationDocuments, (item) => item.verificationCriteriaId === currentCriteria?.id);
    ElMessage.success('Tải tài liệu thành công.');
  })
  .catch(() => {
    ElMessage.error('Đã xảy ra lỗi trong quá trình tải tài liệu. Vui lòng thử lại sau.');
  });
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
        action="http://localhost:5000/api/File"
        multiple
        :on-preview="handlePreview"
        :on-remove="handleRemove"
        :before-remove="beforeRemove"
        :on-success="createDoc"
      >
        <el-button type="primary">Chọn file</el-button>
      </el-upload>
    </el-form>
</template>