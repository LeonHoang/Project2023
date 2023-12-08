/** 判断是否为数组 */
export const isArray = (arg: unknown) => {
  return Array.isArray ? Array.isArray(arg) : Object.prototype.toString.call(arg) === "[object Array]"
}

/** 判断是否为字符串 */
export const isString = (str: unknown) => {
  return typeof str === "string" || str instanceof String
}

/** 判断是否为外链 */
export const isExternal = (path: string) => {
  const reg = /^(https?:|mailto:|tel:)/
  return reg.test(path)
}

/** 判断是否为网址（带协议） */
export const isUrl = (url: string) => {
  const reg = /^(((ht|f)tps?):\/\/)?([^!@#$%^&*?.\s-]([^!@#$%^&*?.\s]{0,63}[^!@#$%^&*?.\s])?\.)+[a-z]{2,6}\/?/
  return reg.test(url)
}

/** 判断是否为网址或 IP（带端口） */
export const isUrlPort = (url: string) => {
  const reg = /^((ht|f)tps?:\/\/)?[\w-]+(\.[\w-]+)+:\d{1,5}\/?$/
  return reg.test(url)
}

/** 判断是否为域名（不带协议） */
export const isDomain = (domain: string) => {
  const reg = /^([0-9a-zA-Z-]{1,}\.)+([a-zA-Z]{2,})$/
  return reg.test(domain)
}

/** 判断版本号格式是否为 X.Y.Z */
export const isVersion = (version: string) => {
  const reg = /^\d+(?:\.\d+){2}$/
  return reg.test(version)
}

/** 判断时间格式是否为 24 小时制（HH:mm:ss） */
export const is24H = (time: string) => {
  const reg = /^(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d$/
  return reg.test(time)
}

/** 判断是否为手机号（1 开头） */
export const isPhoneNumber = (str: string) => {
  const reg = /^(?:(?:\+|00)86)?1\d{10}$/
  return reg.test(str)
}

/** 判断是否为 Email（支持中文邮箱） */
export const isEmail = (email: string) => {
  const reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
  return reg.test(email)
}


