package kr.co.realty.data.board.vo;

import lombok.Data;

@Data
public class BoardFileVO {
	private int mainBoardFileSeq;
	private int mainBoardSeq;
	private String fileType;
	private String fileOrgnm;
	private String fileSavenm;
	private String filePath;
	private String fileSize;
	private String fileFormName;
}
