package kr.co.realty.data.manager.vo;

import lombok.Data;

@Data
public class ManagerVO {
	
	private int bldManagerSeq;
	private int bldInfoSeq;
	private String bldZone;				//빌딩 지역
	private String bldDivision;			//빌딩 구분
	private String bldZoneName;		//빌딩 지역 이름
	private String bldDivisionName;	//빌딩 구분 이름
	private String pmer;
	private String pmerName;
	private String csManager;
	private String csName;
	private String placeManager;
	private String placeName;
	private String regDate;	
	private String regID;
	private String bldName;
	
	private String csMail;
	private String placeMail;
	private String csPhone;
	private String placePhone;
	
	private String csTeam;
	private String placeTeam;
	private String pmerTeam;
}

