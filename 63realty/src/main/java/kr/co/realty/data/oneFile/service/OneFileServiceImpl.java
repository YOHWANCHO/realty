package kr.co.realty.data.oneFile.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.oneFile.dao.OneFileDAO;
import kr.co.realty.data.oneFile.vo.OneFileVO;

@Service("oneFileService")
public class OneFileServiceImpl implements OneFileService{
	
	@Resource(name = "oneFileDAO")
	private OneFileDAO oneFileDAO;

	@Override
	public OneFileVO selectOneFile(OneFileVO oneFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (OneFileVO) oneFileDAO.selectOne("oneFile.selectOneFile", oneFileVO);
	}

	@Override
	public int mergeOneFile(OneFileVO oneFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) oneFileDAO.update("oneFile.mergeOneFile", oneFileVO);
	}

	@Override
	public int deleteOneFile(OneFileVO oneFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (int) oneFileDAO.delete("oneFile.deleteOneFile", oneFileVO);
	}	
}
