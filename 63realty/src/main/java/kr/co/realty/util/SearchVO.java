package kr.co.realty.util;

import kr.co.realty.util.Paging;

import lombok.Data;

@Data
public class SearchVO extends Paging  {
	private String searchType;
	private String categoryType;
	private String searchText;
    private String searchFromDate = "";
    private String searchToDate = "";
    private String listOrder="";
    private Object whereVo;
    private String searchSelectType1;
    private String searchSelectType2;
    private int boardID;
    private int mainBoardSeq;
    private int rowCnt=1;
    
    private String bldZone;
    private String bldDivision;
    private String bldInfoSeq;
    
    private String bldFlagMg;
    private String bldFlagCu;
    private String isUse;
    private String isQR;
    
    private String[] arrCustCate;
    private String[] arrCustField;
    
    private String[] arrBoardID;
    
    private int intFromDate;
    private int intToDate;
    
    private String showDate;
    private String admID;
    
    private int codeSeq;    
    private Integer blYear;
    private Integer grYear;
    private String userFlag;	//사용자 구분 (USER : 사용자     NULL : 관리자)       
}
