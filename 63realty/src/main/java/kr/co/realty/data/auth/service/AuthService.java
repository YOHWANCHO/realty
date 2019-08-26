package kr.co.realty.data.auth.service;

import kr.co.realty.data.auth.vo.AuthVO;

public interface AuthService {
	
	public int insertAdminAuth(AuthVO authVO) throws Exception;
	public int deleteAdminAuth(AuthVO authVO) throws Exception;

}
