package kr.co.realty.data.oneFile.vo;

import lombok.Data;

@Data
public class OneFileVO {
    int boardID;
    String regID;
    String regDate;
    String regName;
    String updateID;
    String updateDate;
    String updateName;
    String fileType;
    String fileOrgnm;
    String fileSavenm;
    String filePath;
    String fileSize;
    String fileFormName;
}