/** 设备类型 */
export enum DeviceEnum {
  Mobile,
  Desktop
}

/** 侧边栏打开状态常量 */
export const SIDEBAR_OPENED = "opened"
/** 侧边栏关闭状态常量 */
export const SIDEBAR_CLOSED = "closed"

export type SidebarOpened = typeof SIDEBAR_OPENED
export type SidebarClosed = typeof SIDEBAR_CLOSED

export const DEFAULT_DATETIME_FORMAT = "DD/MM/YYYY HH:mm"
export const DEFAULT_DATE_FORMAT = 'DD/MM/YYYY'

export const MODIFICATION_TYPE: { [key: string]: string } = {
  VERIFICATION: 'Tự đánh giá',
  VIOLATION: 'Khiếu nại vi phạm',
};

export const MAX_FILE_SIZE = 25 * 1024 * 1024

export const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'pdf']

export const GENDER_MAPPING: { [key: string]: string } = {
  male: 'Nam',
  female: 'Nữ',
  other: 'Khác',
}
