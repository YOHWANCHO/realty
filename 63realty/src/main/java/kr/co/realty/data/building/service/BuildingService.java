package kr.co.realty.data.building.service;

import java.util.List;

import kr.co.realty.data.building.vo.BLDCodeVO;
import kr.co.realty.data.building.vo.BuildingFileVO;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.util.SearchVO;

public interface BuildingService {
	
	public List<BLDCodeVO> selectListForBLDCode(BLDCodeVO bldCodeVO) throws Exception;
	public BLDCodeVO selectOneForBLDCode(BLDCodeVO bldCodeVO) throws Exception;
	public int insertBuildingInfo(BuildingVO buildingVO) throws Exception;	
	public int updateBuildingInfo(BuildingVO buildingVO) throws Exception;	
	public int insertBuildingInfoFile(BuildingFileVO buildingFileVO) throws Exception;
	public BuildingFileVO selectOneForBuildingFile(BuildingFileVO buildingFileVO) throws Exception;
	
	public int selectCountListForBuilding(SearchVO searchVO) throws Exception;
	public List<BuildingVO> selectListForBuilding(SearchVO searchVO) throws Exception;
	public List<BLDCodeVO> selectListForBuildingCombo(SearchVO searchVO) throws Exception;
	public List<BLDCodeVO> selectListForManagerBuildingCombo(SearchVO searchVO) throws Exception;
	
	public BuildingVO selectOneForBuilding(BuildingVO buildingVO) throws Exception;

	public int deleteBuildingFile(BuildingFileVO buildingFileVO) throws Exception;
	public int deleteOneForBuilding(BuildingVO buildingVO) throws Exception;
}
