import request from "@/utils/service"
import type * as Table from "./types/table"

/** 增 */
export function createTableDataApi(data: Table.CreateTableRequestData) {
  return request.post("table", data)
}

/** 删 */
export function deleteTableDataApi(id: string) {
  return request.del(`table/${id}`)
}

/** 改 */
export function updateTableDataApi(data: Table.UpdateTableRequestData) {
  return request.put("table", data)
}

/** 查 */
export function getTableDataApi(params: Table.GetTableRequestData): Promise<Table.GetTableResponseData> {
  return request.get("table", params)
}
