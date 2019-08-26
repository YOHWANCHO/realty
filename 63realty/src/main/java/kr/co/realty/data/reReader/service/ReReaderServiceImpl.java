package kr.co.realty.data.reReader.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.reReader.dao.ReReaderDAO;
import kr.co.realty.data.reReader.vo.ReReaderVO;
import kr.co.realty.util.SearchVO;
@Service("reReaderService")
public class ReReaderServiceImpl implements ReReaderService{
	
	@Resource(name = "reReaderDAO")
	private ReReaderDAO reReaderDAO;

	@Override
	public int selectCountOneForReReader(ReReaderVO reReaderVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) reReaderDAO.selectOne("reReader.selectCountOneForReReader",reReaderVO);
	}

	@Override
	public int insertReReader(ReReaderVO reReaderVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)reReaderDAO.insert("reReader.insertReReader", reReaderVO);
	}

	@Override
	public int updateCancelForReReader(ReReaderVO reReaderVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)reReaderDAO.update("reReader.updateCancelForReReader", reReaderVO);
	}

	@Override
	public int selectCountListForReReader(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)reReaderDAO.selectOne("reReader.selectCountListForReReader",searchVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReReaderVO> selectListForReReader(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return reReaderDAO.selectList("reReader.selectListForReReader",searchVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReReaderVO> selectListForReReaderExcel(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return reReaderDAO.selectList("reReader.selectListForReReaderExcel",searchVO);
	}

	
}
