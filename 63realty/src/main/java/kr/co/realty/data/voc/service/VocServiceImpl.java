package kr.co.realty.data.voc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.voc.dao.VocDAO;
import kr.co.realty.data.voc.vo.CustVoiceFileVO;
import kr.co.realty.data.voc.vo.CustVoiceReplyVO;
import kr.co.realty.data.voc.vo.CustVoiceVO;
import kr.co.realty.util.SearchVO;

@Service("vocService")
public class VocServiceImpl implements VocService{

	@Resource(name="vocDAO")
	private VocDAO vocDAO;
	
	@Override
	public int selectCountListForCustVoiceList(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.selectOne("voc.selectCountListForCustVoiceList", searchVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CustVoiceVO> selectListForCustVoiceAlert() throws Exception {
		// TODO Auto-generated method stub
		return vocDAO.selectList("voc.selectListForCustVoiceAlert"); 
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CustVoiceVO> selectListForCustVoice(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return vocDAO.selectList("voc.selectListForCustVoice", searchVO); 
	}

	@Override
	public int insertForCustVoice(CustVoiceVO custVoiceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.insert("voc.insertForCustVoice", custVoiceVO);
	}

	@Override
	public int insertForCustVoiceFile(CustVoiceFileVO custVoiceFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.insert("voc.insertForCustVoiceFile", custVoiceFileVO);
	}	
	
	public CustVoiceVO selectOneForCustVoice(CustVoiceVO custVoiceVO) throws Exception{
		return (CustVoiceVO) vocDAO.selectOne("voc.selectOneForCustVoice", custVoiceVO);
	}

	@Override
	public CustVoiceFileVO selectOneForCustVoiceFile(CustVoiceFileVO custVoiceFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (CustVoiceFileVO) vocDAO.selectOne("voc.selectOneForCustVoiceFile", custVoiceFileVO);
	}

	@Override
	public int insertForCustVoiceReply(CustVoiceReplyVO custVoiceReplyVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.insert("voc.insertForCustVoiceReply", custVoiceReplyVO);
	}

	@Override
	public int updateOneForCustVoiceReplyFlag(CustVoiceReplyVO custVoiceReplyVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.update("voc.updateOneForCustVoiceReplyFlag", custVoiceReplyVO);
	}
	
	@Override
	public int updateOneForCustVoiceTalkTalkFlag(CustVoiceVO custVoiceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.update("voc.updateOneForCustVoiceTalkTalkFlag", custVoiceVO);
	}

	@Override
	public CustVoiceReplyVO selectOneForCustVoiceReply(CustVoiceReplyVO custVoiceReplyVO) throws Exception {
		// TODO Auto-generated method stub
		return (CustVoiceReplyVO) vocDAO.selectOne("voc.selectOneForCustVoiceReply", custVoiceReplyVO);
	}

	@Override
	public int updateForCustVoiceHitCount(CustVoiceVO custVoiceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.update("voc.updateForCustVoiceHitCount", custVoiceVO);
	}
	
	@Override
	public int updateForCustVoiceManager(CustVoiceVO custVoiceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.update("voc.updateForCustVoiceManager", custVoiceVO);
	}

	@Override
	public int updateForCustVoiceIsUse(CustVoiceVO custVoiceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.update("voc.updateForCustVoiceIsUse", custVoiceVO);
	}
	
	@Override
	public int updateForCustVoiceIsAlert(CustVoiceVO custVoiceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.update("voc.updateForCustVoiceIsAlert", custVoiceVO);
	}

	@Override
	public int updateForCustVoiceReply(CustVoiceReplyVO custVoiceReplyVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.update("voc.updateForCustVoiceReply", custVoiceReplyVO);
	}

	@Override
	public int deleteCustVoiceFile(CustVoiceFileVO custVoiceFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)vocDAO.delete("voc.deleteCustVoiceFile", custVoiceFileVO);
	}
}
