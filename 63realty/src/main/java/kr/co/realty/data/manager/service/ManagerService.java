package kr.co.realty.data.manager.service;

import java.util.List;

import kr.co.realty.data.manager.vo.ManagerVO;
import kr.co.realty.util.SearchVO;

public interface ManagerService {
	
	public int insertBuildingManager(ManagerVO managerVO) throws Exception;	
	public int updateBuildingManager(ManagerVO managerVO) throws Exception;	
	public int selectCountListForManager(SearchVO searchVO) throws Exception;
	public List<ManagerVO> selectListForManager(SearchVO searchVO) throws Exception;
	public ManagerVO selectOneForManager(ManagerVO managerVO) throws Exception;
	public ManagerVO selectOneForManagerBldInfo(ManagerVO managerVO) throws Exception;
	
	public int deleteOneForManager(ManagerVO managerVO) throws Exception;

}
