package kr.co.realty.data.building.vo;

import lombok.Data;

@Data
public class BuildingFileVO {
	private int bldInfoFileSeq;
	private int bldInfoSeq;
	private String fileType;
	private String fileOrgnm;
	private String fileSavenm;
	private String filePath;
	private String fileSize;
	private String fileFormName;
}
