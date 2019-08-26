package kr.co.realty.data.admin.service;

import java.util.List;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.util.SearchVO;

public interface AdminService {
	
	public int insertAdminMember(AdminVO adminVO) throws Exception;
	public int updateAdminMember(AdminVO adminVO) throws Exception;
	
	public int selectCountListForAdmin(SearchVO searchVO) throws Exception;
	public List<AdminVO> selectListForAdmin(SearchVO searchVO) throws Exception;
	public AdminVO selectOneForAdmin(AdminVO adminVO) throws Exception;
	
	public int deleteOneForAdmin(AdminVO adminVO) throws Exception;

}
