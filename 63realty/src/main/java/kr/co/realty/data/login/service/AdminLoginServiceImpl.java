package kr.co.realty.data.login.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.login.dao.LoginDAO;
import kr.co.realty.util.CommonUtil;

@Service("adminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginServiceImpl.class);

	@Resource(name = "loginDAO")
	private LoginDAO loginDAO;
	
	@Autowired
	private CommonUtil commonUtil;

	@Override
	public AdminVO selectOneForLogin(AdminVO adminVo) throws Exception {
		// TODO Auto-generated method stub
		return (AdminVO) loginDAO.selectOne("admin.selectOneForLogin", adminVo);
	}	
}
