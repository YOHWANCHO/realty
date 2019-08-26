package kr.co.realty.data.talktalk.vo;

import kr.co.realty.data.voc.vo.CustVoiceFileVO;
import kr.co.realty.data.voc.vo.CustVoiceReplyVO;
import kr.co.realty.data.voc.vo.CustVoiceVO;

import lombok.Data;

@Data
public class TalkTalkVO{	
	
	private CustVoiceVO custVoiceVO;
	private CustVoiceFileVO custVoiceFileVO;
	private CustVoiceReplyVO custVoiceReplyVO;
	private CustVoiceFileVO custVoiceFileReplyVO;
	private String buildingNM;	
	
}