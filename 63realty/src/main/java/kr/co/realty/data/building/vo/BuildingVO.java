package kr.co.realty.data.building.vo;

import lombok.Data;

@Data
public class BuildingVO {
	
	private int bldInfoSeq;		//빌딩 seq
	private int bldZone;			//빌딩 지역
	private int bldDivision;			//빌딩 구분
	private String bldFlagMg;		//빌딩 화면 노출여부
	private String bldFlagCu; 		//빌딩 고객의 소리 노출여부
	private String bldName;		//빌딩명
	private String bldAddr;			//빌딩주소
	private String bldManager;	//담당자
	private String bldTelnum;		//연락처
	private String[] arrBldTelnum;//연락처
	private String bldScale;		//빌딩규모
	private String bldParking;		//주차대수
	private String bldArea;			//연면적
	private String bldRate;			//전용율
	private String bldCompletion;//준공일
	private String bldCeiling;		//천정고
	private String bldEv;			//엘리베이터
	private String bldTypicalFloor;//기준층
	private String bldParkInfo;	//주차조건
	private String bldContents;	//특장점
	private String bldLocaleX;	//위치정보X
	private String bldLocaleY;	//위치정보Y
	private String regDate;		//등록일
	private String regID;			//등록아이디
	private String bldZoneName;	//빌딩지역명
	private String bldDivisionName;//빌딩구분명
	
	private String fileSavenm;	//빌딩지역명
	private String filePath;//빌딩구분명
}
