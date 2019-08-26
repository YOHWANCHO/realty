package kr.co.realty.data.oneFile.service;

import kr.co.realty.data.oneFile.vo.OneFileVO;

public interface OneFileService {	
	public OneFileVO selectOneFile(OneFileVO oneFileVO) throws Exception;	
	public int mergeOneFile(OneFileVO oneFileVO) throws Exception;
	public int deleteOneFile(OneFileVO oneFileVO) throws Exception;
}
