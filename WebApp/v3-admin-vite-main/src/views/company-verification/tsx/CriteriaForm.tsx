import _ from "lodash";
import { reactive, ref, watch } from "vue"

// import fileServices from "@/common/services/file.services";
// import helpers from "@/common/utils/helpers";
// import config from "@/config";
import { CriteriaDetail, VerificationCriteria } from "@/types/models";
import { useVerificationProcessStore } from "@/store/verificationProcess";
import { ElMessage } from "element-plus"

type Props = {
  data: CriteriaDetail;
};

const CriteriaForm = (props: Props) => {
  const fileRef = ref<HTMLInputElement>();
  
  const loading = ref<boolean>(false)

  const verificationProcessStore = useVerificationProcessStore();

  const currentCriteria = _.find(verificationProcessStore.verificationCriterias, (item) => item.criteriaDetailId === props.data.id);
  const currentDocuments = _.filter(verificationProcessStore.verificationDocuments, (item) => item.verificationCriteriaId === currentCriteria?.id);
  const opinion = currentCriteria?.companyOpinion ?? '';
  const rate = currentCriteria?.companyRate ?? null;
  console.log(currentCriteria)

  const updateCompanyRate = () => {
    const updated: Partial<VerificationCriteria> = {
      ...currentCriteria,
      companyRate: rate,
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
      companyOpinion: opinion,
    };
    verificationProcessStore.updateVerificationCriteria(updated)
      .then(() => {
        ElMessage.success('Cập nhật đánh giá thành công.');
      })
      .catch(() => {
        ElMessage.error('Đã xảy ra lỗi trong quá trình cập nhật đánh giá. Vui lòng thử lại sau.');
      });
  };

  // const handleUploadedFiles = (e: HTMLInputElement) => {
  //   const { files } = e.target;
  //   if (files?.length) {
  //     const validation = helpers.validateUploadedFiles(files);
  //     if (validation) {
  //       ElMessage.error(validation);
  //       return;
  //     }

  //     Promise.all(Array.from(files).map((file) =>
  //       fileServices.uploadFile(file)
  //         .then((fileRes) => {
  //           return dispatch(verificationProcessManagementActions.createDocument({
  //             resourceSize: fileRes.size,
  //             resourceType: fileRes.type,
  //             documentName: fileRes.name,
  //             resourceUrl: fileRes.url,
  //             verificationCriteriaId: currentCriteria?.id,
  //             uploaderType: 'BY_COMPANY',
  //           }));
  //         })
  //     ))
  //       .then((result) => {
  //         ElMessage.success('Tải tài liệu thành công.');
  //       })
  //       .catch(() => {
  //         ElMessage.error('Đã xảy ra lỗi trong quá trình tải tài liệu. Vui lòng thử lại sau.');
  //       });
  //   }
  // };

  if (!currentCriteria) {
    return null;
  }

  return (
    <el-form label-width="100px" label-position="left">
      <el-form-item>
        <el-radio-group model={rate} change={() => updateCompanyRate()}>
          <el-radio label={true} checked={rate === true}>Đáp ứng</el-radio>
          <el-radio label={false} checked={rate === false}>Không đáp ứng</el-radio>
          <el-radio label={null} checked={rate === null}>Không phải loại hình của DN</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="Ý kiến riêng">
        <el-input model={opinion} type="textarea" placeholder="Ý kiến riêng"/>
        <el-button type="primary" onClick={updateCompanyOpinion}>Lưu ý kiến</el-button>
      </el-form-item>
    </el-form>
      // <div style={{ marginTop: '8px' }}>
      //   <div>
      //     <label>File đính kèm</label>
      //   </div>
      //   <div>
      //     {
      //       _.map(currentDocuments, (item) => (
      //         <a
      //           className="file-item"
      //           key={item.id}
      //           target="_blank"
      //           rel="noopener noreferrer"
      //           href={`${config.BASE_API}${item.resourceUrl}`}
      //         >
      //           <FileIcon /> {item.documentName}
      //         </a>
      //       ))
      //     }
      //   </div>
      //   <button onClick={() => fileRef.current?.click()} style={{ marginTop: '4px' }}>Chọn file</button>
      //   <input style={{ display: 'none' }} ref={fileRef} type="file" onChange={handleUploadedFiles} multiple />
      // </div>
  );
};

export default CriteriaForm;
