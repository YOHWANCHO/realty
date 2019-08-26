package kr.co.realty.data.voc.service;

import java.util.List;

import kr.co.realty.data.voc.vo.CustVoiceFileVO;
import kr.co.realty.data.voc.vo.CustVoiceReplyVO;
import kr.co.realty.data.voc.vo.CustVoiceVO;
import kr.co.realty.util.SearchVO;

public interface VocService {

	public List<CustVoiceVO> selectListForCustVoice(SearchVO searchVO) throws Exception;
	public List<CustVoiceVO> selectListForCustVoiceAlert() throws Exception;
	public int selectCountListForCustVoiceList(SearchVO searchVO) throws Exception;
	public int insertForCustVoice(CustVoiceVO custVoiceVO) throws Exception;
	public int insertForCustVoiceFile(CustVoiceFileVO custVoiceFileVO) throws Exception;
	
	public CustVoiceVO selectOneForCustVoice(CustVoiceVO custVoiceVO) throws Exception;
	public int updateForCustVoiceHitCount(CustVoiceVO custVoiceVO) throws Exception;
	public int updateForCustVoiceManager(CustVoiceVO custVoiceVO) throws Exception;
	
	public CustVoiceFileVO selectOneForCustVoiceFile(CustVoiceFileVO custVoiceFileVO) throws Exception;

	public int insertForCustVoiceReply(CustVoiceReplyVO custVoiceReplyVO) throws Exception;
	
	public int updateOneForCustVoiceReplyFlag(CustVoiceReplyVO custVoiceReplyVO) throws Exception;
	public int updateOneForCustVoiceTalkTalkFlag(CustVoiceVO custVoiceVO) throws Exception;
	public int updateForCustVoiceIsUse(CustVoiceVO custVoiceVO) throws Exception;
	public int updateForCustVoiceIsAlert(CustVoiceVO custVoiceVO) throws Exception;
	public int updateForCustVoiceReply(CustVoiceReplyVO custVoiceReplyVO) throws Exception;
	
	public int deleteCustVoiceFile(CustVoiceFileVO custVoiceFileVO) throws Exception;
	
	public CustVoiceReplyVO selectOneForCustVoiceReply(CustVoiceReplyVO custVoiceReplyVO) throws Exception;
	
}
