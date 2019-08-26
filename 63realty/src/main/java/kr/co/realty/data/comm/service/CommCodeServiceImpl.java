package kr.co.realty.data.comm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.comm.dao.CommCodeDAO;
import kr.co.realty.data.comm.vo.CommCodeVO;

@Service("commCodeService")
public class CommCodeServiceImpl implements CommCodeService{

	@Resource(name = "commCodeDAO")
	private CommCodeDAO commCodeDAO;

	@SuppressWarnings("unchecked")
	@Override
	public List<CommCodeVO> selectListForCommCode(CommCodeVO commCodeVO) throws Exception {
		// TODO Auto-generated method stub
		return commCodeDAO.selectList("comm.selectListForCommCode",commCodeVO);
	}
	
	@Override
	public CommCodeVO selectOneForCommCode(CommCodeVO commCodeVO) throws Exception {
		// TODO Auto-generated method stub
		return (CommCodeVO)commCodeDAO.selectOne("comm.selectOneForCommCode",commCodeVO);
	}
	
}
