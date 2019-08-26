package kr.co.realty.data.login.service;

import kr.co.realty.data.admin.vo.AdminVO;

public interface AdminLoginService {

	public AdminVO selectOneForLogin(AdminVO adminVO) throws Exception;

}
