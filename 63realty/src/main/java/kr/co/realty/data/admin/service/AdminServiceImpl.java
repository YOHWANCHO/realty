package kr.co.realty.data.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.realty.data.admin.dao.AdminDAO;
import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.SearchVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;
	
	@Override
	public int insertAdminMember(AdminVO adminVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)adminDAO.insert("admin.insertAdminMember", adminVO);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<AdminVO> selectListForAdmin(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.selectList("admin.selectListForAdmin",searchVO);
	}


	@Override
	public int selectCountListForAdmin(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) adminDAO.selectOne("admin.selectCountListForAdmin",searchVO);
	}


	@Override
	public AdminVO selectOneForAdmin(AdminVO adminVO) throws Exception {
		// TODO Auto-generated method stub
		return (AdminVO) adminDAO.selectOne("admin.selectOneForAdmin",adminVO);
	}


	@Override
	public int updateAdminMember(AdminVO adminVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)adminDAO.update("admin.updateAdminMember", adminVO);
	}


	@Override
	public int deleteOneForAdmin(AdminVO adminVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)adminDAO.delete("admin.deleteOneForAdmin", adminVO);
	}
	
	
}
