package kr.co.realty.data.voc.vo;

import lombok.Data;

@Data
public class CustVoiceReplyVO {	
	private int custVoiceReplySeq;
	private int custVoiceSeq;
	private String admID;
	private String replyType;
	private String replyContents;	
	private String regDate;
	
	private String admName;	
	private String departmentName;	
	
	
}
