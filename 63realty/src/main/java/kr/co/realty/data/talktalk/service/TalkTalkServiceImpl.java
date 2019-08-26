package kr.co.realty.data.talktalk.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.comm.service.CommCodeService;
import kr.co.realty.data.comm.vo.CommCodeVO;
import kr.co.realty.data.talktalk.vo.TalkTalkVO;
import kr.co.realty.data.voc.service.VocService;
import kr.co.realty.data.voc.vo.CustVoiceFileVO;
import kr.co.realty.data.voc.vo.CustVoiceReplyVO;
import kr.co.realty.data.voc.vo.CustVoiceVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.FileUploadUtil;
import spectra.api.ApiPublic;
import spectra.api.common.model.AttachInfo;
import spectra.api.common.model.ResultObject;
import spectra.api.common.model.ReturnValueObj;
import spectra.api.common.model.Voc;
import spectra.api.main.VocIfApi;

@Service("talkTalkService")
public class TalkTalkServiceImpl implements TalkTalkService{

	final static String API_SERVER_IP = "172.16.4.120";
//	final static String API_SERVER_IP = "16.4.120";
    final static String API_SERVER_PORT = "80";
    private VocIfApi api = new VocIfApi(API_SERVER_IP,API_SERVER_PORT);
    
	@Value("#{conf['talktalk.IF_SYSTEM_ID']}")
	private String if_system_id;

	@Value("#{conf['talktalk.DOMAIN_ID']}")
	private String domain_id;
	
	@Value("#{conf['talktalk.NODE_ID']}")
	private String node_id;
	
	@Value("#{conf['talktalk.QUESTION_CHANNEL_ID']}")
	private String question_channel_id;
	
	@Value("#{conf['talktalk.ANSWER_CHANNEL_ID']}")
	private String answer_channel_id;
	
	@Value("#{conf['talktalk.PUBLIC_FLAG']}")
	private String public_flag;
    
	@Autowired
	private CommCodeService commCodeService;
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@Autowired
	private VocService vocService;

	@Override
	public void insertTalkTalk(TalkTalkVO talkTalkVO, AdminVO adminVO) throws Exception {
		// TODO Auto-generated method stub
        System.out.println("=========VOC 등록=========");
        
        CustVoiceVO custVoiceVO = talkTalkVO.getCustVoiceVO();
        CustVoiceFileVO custVoiceFileVO = talkTalkVO.getCustVoiceFileVO();
        CustVoiceReplyVO custVoiceReplyVO = talkTalkVO.getCustVoiceReplyVO();
        CustVoiceFileVO custVoiceFileReplyVO = talkTalkVO.getCustVoiceFileReplyVO();
        String bldName = talkTalkVO.getBuildingNM();

        //VOC에 등록할 정보를 담을 Voc 클래스의 오브젝트 생성
        Voc voc = new Voc();

        //VOC 등록에 필요한 정보들 셋팅
        voc.setIfSystemId(if_system_id);
        voc.setLegacyVocId(Integer.toString(custVoiceVO.getCustVoiceSeq()));
        //voc.setAnswerDate("20130220121212");
        voc.setDomainId(domain_id);
        //자동 배분 기준 코드
        voc.setNodeId(node_id);
        //처리 완료건 등록인 경우 ApiPublic.PROCESS_STATUS_END;
        voc.setProcessStatus(ApiPublic.PROCESS_STATUS_REG);
        //고객 질문 채널 코드
        voc.setQuestionChannelId(question_channel_id);
        //고객 답변 채널 코드 (이메일, 전화, SMS등)
        voc.setAnswerChannelId(answer_channel_id);

        //고객 요구 유형
        CommCodeVO vo = new CommCodeVO();
        vo.setCodeSeq(Integer.parseInt(custVoiceVO.getCustCate()));
        vo = commCodeService.selectOneForCommCode(vo);
        voc.setCustomerReqType(vo.getCodeText());
        //질분제목
        voc.setQuestionTitle(custVoiceVO.getCustTitle());
        
        //수정자 사번
        voc.setUpdatedBy(adminVO.getAdmID());
        //수정 일시
        
        voc.setUpdatedDate(custVoiceVO.getStrRegDate());
        //질문 내용
        voc.setQuestionContents(bldName+"</br>"+custVoiceVO.getContents());
        //답변 내용
        if(custVoiceReplyVO != null) {
        	voc.setAnswerContents(custVoiceReplyVO.getReplyContents());
        }        
        //답변 필요 여부 / 기본  ApiPublic.FLAG_Y / 불필요한 경우 ApiPublic.FLAG_N
        voc.setReplyNeed(ApiPublic.FLAG_N);
        
        //등록자 사번(수집 채널의 경우 등록 고객명 입력)
        voc.setRegisterBy(adminVO.getAdmID());
        
        //등록 일시 (YYYYMMDDHH24MISS)
        voc.setRegisterDate(custVoiceVO.getStrRegDate());
        
        //직원 공개 여부
        voc.setPublicFlag(ApiPublic.FLAG_Y);
        
        //고객명
        voc.setCustomerName(custVoiceVO.getCustName());
        //고객이메일
        voc.setCustomerEmail(custVoiceVO.getCustEmail());
       
        String phoneNum="";
        if(!commonUtil.isNull(custVoiceVO.getCustPhone())) {
        	String [] phone = commonUtil.divideMobile(custVoiceVO.getCustPhone());
    		for(String s : phone) {
    			phoneNum=phoneNum+s+"-";
    		}
    		phoneNum = phoneNum.substring(0,phoneNum.length()-1);
        }
        
        //고객 휴대전화 번호
        voc.setCustomerMobile(phoneNum);
        //고객 사무실 전화번호
        
        //SMS알림여부
        voc.setMobileAlarmFlag("N");

        // *** 첨부파일이 있는 경우 시작
        //첫번째 첨부 파일 정보를 담을 빈 생성 (VOC 처리 완료건 등록시에는 첨부파일 전달이 필요 하지 않습니다.)
        
        if(custVoiceFileVO != null) {
        	
            String localPath = fileUploadUtil.getLocalPath();
            String realFileName = custVoiceFileVO.getFileSavenm();
            String filePath = custVoiceFileVO.getFilePath();
            
            AttachInfo attachInfo1 = new AttachInfo();
            File file1 = new File(localPath+filePath+realFileName);
            attachInfo1.setAttachId("0001");
            attachInfo1.setAttachFile(file1);
            List attchInfoList = new ArrayList();
            attchInfoList.add(attachInfo1);
            
            voc.setQuestionAttachInfoList(attchInfoList);
        }
        ResultObject rtnObj =  api.insertVoc(voc);
        
        vocService.updateOneForCustVoiceTalkTalkFlag(custVoiceVO);
        
        //처리 결과 출력
        printResult(rtnObj);		
	}
	
	public void updateTalkTalk(TalkTalkVO talkTalkVO, AdminVO adminVO){
		System.out.println("==========VOC 수정=========");
		
		//VOC를 수정할 정보를 담을 Voc 클래스의 오브젝트 생성
		//수정 가능 항목
		
		CustVoiceVO custVoiceVO = talkTalkVO.getCustVoiceVO();
        CustVoiceFileVO custVoiceFileVO = talkTalkVO.getCustVoiceFileVO();
        CustVoiceReplyVO custVoiceReplyVO = talkTalkVO.getCustVoiceReplyVO();
        CustVoiceFileVO custVoiceFileReplyVO = talkTalkVO.getCustVoiceFileReplyVO();
        String bldName = talkTalkVO.getBuildingNM();
        
		Voc voc = new Voc();
		voc.setDomainId(domain_id);
		voc.setIfSystemId(if_system_id);
		voc.setLegacyVocId(Integer.toString(custVoiceVO.getCustVoiceSeq()));
		voc.setUpdatedBy(adminVO.getAdmID());             // 고객명
		voc.setUpdatedDate(commonUtil.getTodate("yyyyMMddHHmmss"));  // 수정일시 (YYYYMMDDHH24MISS)		
		voc.setQuestionTitle(custVoiceVO.getCustTitle());
		voc.setQuestionContents(bldName+"</br>"+custVoiceVO.getContents());	//수정내용

		//답변 내용
        if(custVoiceReplyVO != null) {
        	voc.setAnswerContents(custVoiceReplyVO.getReplyContents());
        }
		
		//API 호출 결과를 담을 ResultObject 클래스의 오브젝트 생성 및 결과 셋팅
		ResultObject rtnObj =  api.updateVoc(voc);
		
		//처리 결과 출력
		printResult(rtnObj);
	}
	
	
	
    /**
     * 테스트 처리 결과 출력 메소드
     * @param rtnObj
     */
    private void printResult(ResultObject rtnObj)
    {
        //처리 결과 코드 추출
        System.out.println("rtnObj.getRtnCd()="+rtnObj.getRtnCd());

        //처리 결과 메세지 추출
        System.out.println("rtnObj.getRtnMsg()="+rtnObj.getRtnMsg());

        //처리 결과에 따라 처리된 값의 전달이 있는 경우는 ReturnValueObj 클래스의 오브젝트를 요소로 하는 List로 반환됨
        //VOC 등록은 리턴값 없음
        if (rtnObj.getRtnValue() != null){
            List rtnValueList = rtnObj.getRtnValue();
            for (int i=0; rtnValueList.size()>i; i++){
                ReturnValueObj rtnValueObj = (ReturnValueObj)rtnValueList.get(i);

                if (rtnValueObj.getLegacyVocId() != null && !ApiPublic.EMPTY_STRING.equals(rtnValueObj.getLegacyVocId()))
                    System.out.println("rtnValueObj.getLegacyVocId()="+rtnValueObj.getLegacyVocId());

                if (rtnValueObj.getProcessStatus() != null && !ApiPublic.EMPTY_STRING.equals(rtnValueObj.getProcessStatus()))
                    System.out.println("rtnValueObj.getProcessStatus()="+rtnValueObj.getProcessStatus());

                if (rtnValueObj.getAnswerTitle() != null && !ApiPublic.EMPTY_STRING.equals(rtnValueObj.getAnswerTitle()))
                    System.out.println("rtnValueObj.getAnswerTitle()="+rtnValueObj.getAnswerTitle());

                if (rtnValueObj.getAnswerContents() != null && !ApiPublic.EMPTY_STRING.equals(rtnValueObj.getAnswerContents()))
                    System.out.println("rtnValueObj.getAnswerContents()="+rtnValueObj.getAnswerContents());

                if (rtnValueObj.getResponseBy() != null && !ApiPublic.EMPTY_STRING.equals(rtnValueObj.getResponseBy()))
                    System.out.println("rtnValueObj.getResponseBy()="+rtnValueObj.getResponseBy());
            }
        }
    }

}
