package kr.co.realty.data.greenhouse.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.greenhouse.dao.GreenHouseDAO;
import kr.co.realty.data.greenhouse.vo.GreenHouseVO;
import kr.co.realty.util.SearchVO;

@Service("greenHouseService")
public class GreenHouseServiceImpl implements GreenHouseService {
	
	@Resource(name="greenHouseDAO")
	private GreenHouseDAO greenHouseDAO;
	
	@Override
	public int insertGreenHouse(GreenHouseVO greenHouse) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)greenHouseDAO.insert("greenhouse.insertGreenHouse", greenHouse);
	}

	@Override
	public int selectCountListForGreenHouse(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)greenHouseDAO.selectOne("greenhouse.selectCountListForGreenHouse",searchVO);
	}
	
	@Override
	public int selectCountOneForGreenHouse(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)greenHouseDAO.selectOne("greenhouse.selectCountOneForGreenHouse",searchVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GreenHouseVO> selectListForGreenHouse(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return greenHouseDAO.selectList("greenhouse.selectListForGreenHouse", searchVO);
	}
	
//	@Override
//	public int updateGreenHouse(GreenHouseVO greenHouseVO) throws Exception {
//		// TODO Auto-generated method stub
//		return (Integer)balanceDAO.update("greenhouse.updateGreenHouse", greenHouseVO);
//	}
//	
	@Override
	public int deleteGreenHouse(GreenHouseVO greenHouseVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)greenHouseDAO.delete("greenhouse.deleteGreenHouse", greenHouseVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<GreenHouseVO> selectListForOneGreenHouse(GreenHouseVO greenHouseVO) throws Exception {
		// TODO Auto-generated method stub
		return greenHouseDAO.selectList("greenhouse.selectListForOneGreenHouse",greenHouseVO);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<GreenHouseVO> selectListForYearGreenHouse(GreenHouseVO greenHouseVO) throws Exception {
		// TODO Auto-generated method stub
		return greenHouseDAO.selectList("greenhouse.selectListForYearGreenHouse",greenHouseVO);
	}


}
