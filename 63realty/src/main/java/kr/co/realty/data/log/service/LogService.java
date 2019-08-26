package kr.co.realty.data.log.service;

import java.util.List;

import kr.co.realty.data.log.vo.AdmLogVO;
import kr.co.realty.data.log.vo.UserLogVO;
import kr.co.realty.util.SearchVO;

public interface LogService {
	
	public int insertAdminLog(AdmLogVO admLogVO) throws Exception;
	public List<AdmLogVO> selectListForAdmLog(SearchVO searchVO) throws Exception;
	public int selectCountListForAdmLog(SearchVO searchVO) throws Exception;
	public int insertUserLog(UserLogVO userLogVO) throws Exception;
	public List<UserLogVO> selectListForUserLog(SearchVO searchVO) throws Exception;
}
