package kr.co.realty.data.manager.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.manager.dao.ManagerDAO;
import kr.co.realty.data.manager.vo.ManagerVO;
import kr.co.realty.util.SearchVO;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService{

	@Resource(name="managerDAO")
	private ManagerDAO managerDAO;

	@Override
	public int insertBuildingManager(ManagerVO managerVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) managerDAO.insert("manager.insertBuildingManager", managerVO);
	}

	@Override
	public int selectCountListForManager(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)managerDAO.selectOne("manager.selectCountListForManager",searchVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ManagerVO> selectListForManager(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return managerDAO.selectList("manager.selectListForManager",searchVO);
	}

	@Override
	public ManagerVO selectOneForManager(ManagerVO managerVO) throws Exception {
		// TODO Auto-generated method stub
		return (ManagerVO) managerDAO.selectOne("manager.selectOneForManager", managerVO);
	}
	
	@Override
	public ManagerVO selectOneForManagerBldInfo(ManagerVO managerVO) throws Exception {
		// TODO Auto-generated method stub
		return (ManagerVO) managerDAO.selectOne("manager.selectOneForManagerBldInfo", managerVO);
	}

	@Override
	public int updateBuildingManager(ManagerVO managerVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)managerDAO.update("manager.updateBuildingManager",managerVO);
	}

	@Override
	public int deleteOneForManager(ManagerVO managerVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)managerDAO.delete("manager.deleteOneForManager", managerVO);
	}
	

}
