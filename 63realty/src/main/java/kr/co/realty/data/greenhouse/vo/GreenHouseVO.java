package kr.co.realty.data.greenhouse.vo;

import lombok.Data;

@Data
public class GreenHouseVO {	
	private Integer grYear;	
	private String colPlace;
	private String firstQ;
	private String secondQ;
	private String thirdQ;
	private String fourthQ;
	private String grDesc;
	private Integer grOrder;
	private Integer grFlag;
	private String regDate;
	private String regName;
	private String regID;
	
	private String[] tco;
	private String[] toe;
	
}
