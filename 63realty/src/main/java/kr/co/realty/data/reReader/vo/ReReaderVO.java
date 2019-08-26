package kr.co.realty.data.reReader.vo;

import lombok.Data;

@Data
public class ReReaderVO {
	private Integer reReaderSeq;
	private String email;
	private String readerName;
	private String readerTeam;
	private String readerPhone;
	private String regDate;
	private String cancelDate;
	private String cancelName;	
	private String ip;
	private String userFlag;
}