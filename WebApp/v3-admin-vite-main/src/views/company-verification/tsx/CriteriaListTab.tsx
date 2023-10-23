import _ from "lodash";
import { Criteria } from "../../../types/models";
import CriteriaDetailList from "./CriteriaDetailList";
import { useCriteriaTypeStore } from "@/store/criteriaType"
import { useCriteriaStore } from "@/store/criteria"

type Props = {
  criteriaTypeId: number;
};

const CriteriaListTab = (props: Props) => {
  const criteriaTypeStore = useCriteriaTypeStore();
  const criteriaStore = useCriteriaStore();

  const filteredCriterias = _.filter(criteriaStore.criterias, (x) => x.criteriaTypeId === props.criteriaTypeId);

  const columns: IDataTableColumn<Criteria>[] = [
    {
      name: 'STT',
      selector: (row, index) => index + 1,
      width: '50px',
    },
    {
      name: 'Nội dung kê khai',
      selector: 'criteriaName',
      wrap: true,
      style: { paddingTop: '12px', paddingBottom: '12px' },
    },
  ];

  return (
    <div className={`tab-pane ${props.isSelected ? 'active' : ''}`} id={`${props.criteriaTypeId}`} role="tabpanel">
      <DataTable
        striped
        highlightOnHover
        noHeader
        columns={columns}
        data={filteredCriterias}
        expandableRows
        expandableRowsComponent={<CriteriaDetailList />}
        className="verification-table"
      />
    </div>
  );
};

export default CriteriaListTab;
