package kr.co.realty.data.log.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.log.dao.LogDAO;
import kr.co.realty.data.log.vo.AdmLogVO;
import kr.co.realty.data.log.vo.UserLogVO;
import kr.co.realty.util.SearchVO;



@Service("logService")
public class LogServiceImpl implements LogService {
	
	@Resource(name="logDAO")
	private LogDAO logDAO;

	@Override
	public int insertAdminLog(AdmLogVO admLogVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)logDAO.insert("log.insertAdminLog", admLogVO);
	}
	
	@Override
	public int selectCountListForAdmLog(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)logDAO.selectOne("log.selectCountListForAdmLog",searchVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AdmLogVO> selectListForAdmLog(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return logDAO.selectList("log.selectListForAdmLog",searchVO);
	}

	@Override
	public int insertUserLog(UserLogVO userLogVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)logDAO.insert("log.insertUserLog", userLogVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<UserLogVO> selectListForUserLog(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return logDAO.selectList("log.selectListForUserLog", searchVO);
	}

}
