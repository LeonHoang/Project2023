export interface LoginRequestData {
  /** email */
  email: string
  /** password */
  password: string
}

export interface UserData {
  id: number,
  email: string,
  isVerified: boolean,
  token: string, 
  roleId: number 
}

export type LoginResponseData = ApiResponseData<UserData>
