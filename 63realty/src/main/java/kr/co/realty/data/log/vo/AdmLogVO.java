package kr.co.realty.data.log.vo;

import lombok.Data;

@Data
public class AdmLogVO{	
	private int admLogSeq;
	private String admID;
	private String admName;
	private String regDate;
	private String ip;
	private String loginYN;	
}