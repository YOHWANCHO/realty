package kr.co.realty.data.board.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int mainBoardSeq;
	private int boardID;
	private String regID;
	private String regName;
	private int hitCount;
	private String title;
	private int codeSeq;
	private String codeName;
	private String showDate;
	private String regDate;
	private String contents;
	private String isUse;
		
	private int mainBoardFileSeq;	//파일SEQ
	private String fileSavenm;			//파일저장명
	private String filePath;				//파일경로
	
	private int preMainBoardSeq;
	private String preTitle;
	private int nextMainBoardSeq;
	private String nextTitle;
	
}
