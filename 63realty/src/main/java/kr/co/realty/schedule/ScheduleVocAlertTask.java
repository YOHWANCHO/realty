package kr.co.realty.schedule;

import java.util.Hashtable;
import java.util.List;

import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import kr.co.realty.data.manager.service.ManagerService;
import kr.co.realty.data.manager.vo.ManagerVO;
import kr.co.realty.data.voc.service.VocService;
import kr.co.realty.data.voc.vo.CustVoiceVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.Email;
import kr.co.realty.util.EmailSender;
import kr.co.realty.util.TemplateReader;


public class ScheduleVocAlertTask {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleVocAlertTask.class);
	
	@Autowired
	private CommonUtil commonUtil;

	@Autowired
	private VocService vocService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private SchedulerFactoryBean schedulerBean;
	
	@Autowired
	private Scheduler scheduler;
	
	@Value("#{conf['realty.email']}")
	private String realtyEmail;
	
	private String startTime;
	private String endTime;
	
	
	public void scheduleVocAlert(){
		
		String mailTitle = "고객의 소리가 접수 되었습니다.(재알림)";
		
		try {
			startTime = commonUtil.getTodate("yyyy/MM/dd HH:mm:ss");
			logger.info("***************************************************************");
			logger.info("** "+startTime+" SCHEDUALER START **");
			logger.info("***************************************************************");
			
			ManagerVO managerVO = new ManagerVO();
			
			//알림을 해줄 빌딩 데이터 select
			List<CustVoiceVO> custVoice = vocService.selectListForCustVoiceAlert();
			for(CustVoiceVO vo : custVoice) {
				Hashtable<String, String> ht = new Hashtable<String, String>();
				ht.put("titleCnt", Integer.toString(vo.getCnt()));
				ht.put("title", commonUtil.nvl(vo.getCustTitle()));
				TemplateReader tr = commonUtil.setTemplete("/template/mail_voc2.html", ht);	
				
				managerVO.setBldInfoSeq(vo.getBldInfoSeq());
				//빌딩 관리자 select
				ManagerVO v = managerService.selectOneForManagerBldInfo(managerVO);
				if(v != null) {
					String placeMail = commonUtil.nvl(v.getPlaceMail());
					String csMail = commonUtil.nvl(v.getCsMail());
					
					Email email = new Email();
					email.setSender(realtyEmail);
					email.setSubject(mailTitle);
					email.setContent(tr.getTemplate());
					
					//현장 담당자 메일, 문자발송
					if(!commonUtil.isNull(placeMail)) {
						email.setReceiver(placeMail);
						emailSender.SendEmail(email);
					}				
					
					//cs 담당자 메일, 문자발송
					if(!commonUtil.isNull(csMail)) {
						email.setReceiver(csMail);
						emailSender.SendEmail(email);
					}				
					//알림 구분값 Y
					vocService.updateForCustVoiceIsAlert(vo);
				}
			}	
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error("error",e);
		}
		
		endTime = commonUtil.getTodate("yyyy/MM/dd HH:mm:ss");
		logger.info("***************************************************************");
		logger.info("** "+endTime+" SCHEDUALER END **");
		logger.info("** "+startTime+" ~ "+endTime+" **");
		logger.info("***************************************************************");		
	}

	public void menualBatchExecute() throws SchedulerException{
		
		JobKey jobKey = new JobKey("vocAlertJob");
		scheduler = schedulerBean.getScheduler();
		scheduler.triggerJob(jobKey);
	}
}
