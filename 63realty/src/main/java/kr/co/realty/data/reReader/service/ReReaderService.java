package kr.co.realty.data.reReader.service;

import java.util.List;

import kr.co.realty.data.reReader.vo.ReReaderVO;
import kr.co.realty.util.SearchVO;


public interface ReReaderService {	
	public int selectCountOneForReReader(ReReaderVO reReaderVO) throws Exception;
	public int updateCancelForReReader(ReReaderVO reReaderVO) throws Exception;
	public int insertReReader(ReReaderVO reReaderVO) throws Exception;
	public int selectCountListForReReader(SearchVO searchVO) throws Exception;
	public List<ReReaderVO> selectListForReReader(SearchVO searchVO) throws Exception;
	public List<ReReaderVO> selectListForReReaderExcel(SearchVO searchVO) throws Exception;
//	public OneFileVO selectOneFile(OneFileVO oneFileVO) throws Exception;	
//	public OneFileVO selectOneForOneFile(OneFileVO oneFileVO) throws Exception;	
//	public int deleteOneFile(OneFileVO oneFileVO) throws Exception;
//	
//	public int deleteOneForOneFile(OneFileVO oneFileVO) throws Exception;
	
}
