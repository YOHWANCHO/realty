package kr.co.realty.data.auth.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.auth.dao.AuthDAO;
import kr.co.realty.data.auth.vo.AuthVO;



@Service("authService")
public class AuthServiceImpl implements AuthService {
	
	@Resource(name="authDAO")
	private AuthDAO authDAO;

	@Override
	public int insertAdminAuth(AuthVO authVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)authDAO.insert("auth.insertAdminAuth", authVO);
	}

	@Override
	public int deleteAdminAuth(AuthVO authVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)authDAO.insert("auth.deleteAdminAuth", authVO);
	}

}
