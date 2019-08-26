package kr.co.realty.data.log.vo;

import lombok.Data;

@Data
public class UserLogVO{	
	private String sessionID;
	private String ip;
	private String intDate;
	private String regDate;
	private String refererUrl;
	private int userCnt;
	
}