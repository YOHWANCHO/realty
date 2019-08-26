package kr.co.realty.data.menu.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class MenuVO implements Serializable{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int menuSeq;						//메뉴 seq
	private String menuName;					//메뉴명
	private int pMenuSeq;						//부모메뉴명
	private int rootSeq;							//그룹seq
	private int ord;								//순서
	private String menuUrl;						//메뉴 URL
	private String isUse;						//사용여부
	
	private String level;							//레벨
	private String depthFullname;			//ROOT부터 경로
	private String isLeaf;						//마지막 레벨 메뉴여부
	private String authChk;						//메뉴 사용여부
	
}