package kr.co.realty.data.comm.vo;

import lombok.Data;

@Data
public class SinmungoVO {
	
	private String mailTitle;			//신문고 제목
	private String corrTeam;			//신고대상 소속
	private String corrPosition;		//신고대상 직급
	private String corrName;			//신고대상 성명
	private String corrContents;		//신고내용
	private String writerTeam;		//작성자 소속
	private String writerName;		//작성자 성명
	private String writerEmail;			//작성자 이메일
	private String writerPhone;		//작성자 연락처
}
