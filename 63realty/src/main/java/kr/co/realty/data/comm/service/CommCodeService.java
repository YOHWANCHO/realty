package kr.co.realty.data.comm.service;

import java.util.List;

import kr.co.realty.data.comm.vo.CommCodeVO;

public interface CommCodeService {
	
	public List<CommCodeVO> selectListForCommCode(CommCodeVO commCodeVO) throws Exception;
	public CommCodeVO selectOneForCommCode(CommCodeVO commCodeVO) throws Exception;

}
