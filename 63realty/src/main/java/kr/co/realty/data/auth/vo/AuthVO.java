package kr.co.realty.data.auth.vo;

import lombok.Data;

@Data
public class AuthVO {	
	private String admID;					//관리자ID
	private int menuSeq;					//menu SEQ
	
	private String[] arrMenuSeq;			//권한 배열
	private String menuSeqs;				//선택된 메뉴 SEQ들	
}
