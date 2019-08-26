package kr.co.realty.data.voc.vo;

import lombok.Data;

@Data
public class CustVoiceVO {

	private int custVoiceSeq;
	private int bldInfoSeq;
	private String custTitle;
	private String custCate;
	private String custField;
	private String custName;
	private String custPhone;
	private String custEmail;
	private String contents;
	private String custPW;
	private String regDate;
	private String strRegDate;
	private String isReply;
	private String isTolk;
	private String isUse;
	private String bldName;
	private String bldZone;
	private String bldDivision;
	private String custFieldname;
	private String custCateName;
	private String isQR;
	private int hitCount;
	
	private int cnt;
}
