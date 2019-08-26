package kr.co.realty.data.building.vo;

import lombok.Data;

@Data
public class BLDCodeVO {

	private int bldCodeSeq;
	private String codeName;
	private int pBldCodeSeq;
	private String codeText;
	private String isUse;
}
