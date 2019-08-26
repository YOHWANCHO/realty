package kr.co.realty.data.greenhouse.service;

import java.util.List;

import kr.co.realty.data.greenhouse.vo.GreenHouseVO;
import kr.co.realty.util.SearchVO;

public interface GreenHouseService {
	
	public int insertGreenHouse(GreenHouseVO greenHouseVO) throws Exception;
	public int selectCountListForGreenHouse(SearchVO searchVO) throws Exception;
	public int selectCountOneForGreenHouse(SearchVO searchVO) throws Exception;
	public List<GreenHouseVO> selectListForGreenHouse(SearchVO searchVO) throws Exception;
//	public int updateGreenHouse(GreenHouseVO greenHouseVO) throws Exception;
	public int deleteGreenHouse(GreenHouseVO greenHouseVO) throws Exception;
	public List<GreenHouseVO> selectListForOneGreenHouse(GreenHouseVO greenHouseVO) throws Exception;
	public List<GreenHouseVO> selectListForYearGreenHouse(GreenHouseVO greenHouseVO) throws Exception;

}
