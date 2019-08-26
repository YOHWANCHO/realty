package kr.co.realty.data.talktalk.service;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.talktalk.vo.TalkTalkVO;

public interface TalkTalkService {
	
	public void insertTalkTalk(TalkTalkVO talkTalkVO,AdminVO adminVO) throws Exception;
	public void updateTalkTalk(TalkTalkVO talkTalkVO,AdminVO adminVO) throws Exception;

}
