package kr.co.realty.data.building.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.building.dao.BuildingDAO;
import kr.co.realty.data.building.vo.BLDCodeVO;
import kr.co.realty.data.building.vo.BuildingFileVO;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.util.SearchVO;

@Service("buildingService")
public class BuildingServiceImpl implements BuildingService{

	@Resource(name="buildingDAO")
	private BuildingDAO buildingDAO;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BLDCodeVO> selectListForBLDCode(BLDCodeVO bldCodeVO) throws Exception {
		// TODO Auto-generated method stub
		return buildingDAO.selectList("building.selectListForBLDCode", bldCodeVO);
	}
	
	public BLDCodeVO selectOneForBLDCode(BLDCodeVO bldCodeVO) throws Exception {
		// TODO Auto-generated method stub
		return (BLDCodeVO) buildingDAO.selectOne("building.selectOneForBLDCode", bldCodeVO);
	}

	@Override
	public int insertBuildingInfo(BuildingVO buildingVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) buildingDAO.insert("building.insertBuildingInfo", buildingVO);
	}
	
	@Override
	public int insertBuildingInfoFile(BuildingFileVO buildingFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)buildingDAO.insert("building.insertBuildingInfoFile",buildingFileVO);
	}
	
	@Override
	public int selectCountListForBuilding(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub		 
		return (int) buildingDAO.selectOne("building.selectCountListForBuilding",searchVO);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BuildingVO> selectListForBuilding(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return buildingDAO.selectList("building.selectListForBuilding", searchVO); 
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BLDCodeVO> selectListForBuildingCombo(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return buildingDAO.selectList("building.selectListForBuildingCombo", searchVO);
	}

	@Override
	public BuildingVO selectOneForBuilding(BuildingVO buildingVO) throws Exception {
		// TODO Auto-generated method stub
		return (BuildingVO) buildingDAO.selectOne("building.selectOneForBuilding", buildingVO);
	}

	@Override
	public BuildingFileVO selectOneForBuildingFile(BuildingFileVO buildingFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (BuildingFileVO) buildingDAO.selectOne("building.selectOneForBuildingFile",buildingFileVO);
	}

	@Override
	public int deleteBuildingFile(BuildingFileVO buildingFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) buildingDAO.delete("building.deleteBuildingFile", buildingFileVO);
	}

	@Override
	public int updateBuildingInfo(BuildingVO buildingVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) buildingDAO.update("building.updatetBuildingInfo", buildingVO);
	}

	@Override
	public int deleteOneForBuilding(BuildingVO buildingVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)buildingDAO.delete("building.deleteOneForBuilding", buildingVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BLDCodeVO> selectListForManagerBuildingCombo(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return buildingDAO.selectList("building.selectListForManagerBuildingCombo", searchVO);
	}	


}
