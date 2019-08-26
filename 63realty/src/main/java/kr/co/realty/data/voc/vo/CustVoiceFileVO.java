package kr.co.realty.data.voc.vo;

import lombok.Data;

@Data
public class CustVoiceFileVO {
	private int custVoiceFileSeq;
	private String custVoiceType;
	private int custVoiceSeq;
	private String fileType;
	private String fileOrgnm;
	private String fileSavenm;
	private String filePath;
	private String fileSize;
	private String fileFormName;
}
