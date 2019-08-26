package kr.co.realty.controller.admin.voc;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.building.vo.BLDCodeVO;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.data.comm.service.CommCodeService;
import kr.co.realty.data.manager.service.ManagerService;
import kr.co.realty.data.manager.vo.ManagerVO;
import kr.co.realty.data.talktalk.service.TalkTalkService;
import kr.co.realty.data.talktalk.vo.TalkTalkVO;
import kr.co.realty.data.voc.service.VocService;
import kr.co.realty.data.voc.vo.CustVoiceFileVO;
import kr.co.realty.data.voc.vo.CustVoiceReplyVO;
import kr.co.realty.data.voc.vo.CustVoiceVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.Email;
import kr.co.realty.util.EmailSender;
import kr.co.realty.util.FileUploadUtil;
import kr.co.realty.util.SearchVO;
import kr.co.realty.util.TemplateReader;

@Controller
public class AdminVocController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminVocController.class);
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@Autowired
	private BuildingService buildingService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private CommCodeService commCodeService;
	
	@Autowired
	private VocService vocService;
	
	@Value("#{conf['file.folder.board']}")
	private String fileFolder;
	
	@Value("#{conf['file.folder.voc']}")
	private String vocPath;
	
	@Value("#{conf['file.folder.viewPath']}")
	private String viewPath;
	
	@Value("#{conf['realty.email']}")
	private String realtyEmail;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private TalkTalkService talkTalkService;
	
	/*	  
	 *		슈퍼어드민 고객문의 담당자 관리 
	 */
	@RequestMapping(value = "/console/customer/manager", method = RequestMethod.GET)
	public String manager(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {
		
		try {
			searchVO.setTotalCount(managerService.selectCountListForManager(searchVO));
			List<ManagerVO> list = managerService.selectListForManager(searchVO);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo1 = buildingService.selectListForBLDCode(bldCodeVO);
			
			List<BLDCodeVO> combo2 = null;
			
			if(!commonUtil.isNull(searchVO.getBldZone())) { 
				bldCodeVO.setBldCodeSeq(Integer.parseInt(searchVO.getBldZone()));
				combo2 = buildingService.selectListForBLDCode(bldCodeVO);
			}
			
			List<BLDCodeVO> combo3 = buildingService.selectListForBuildingCombo(searchVO);
			
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("combo1", combo1);
			model.addAttribute("combo2", combo2);
			model.addAttribute("combo3", combo3);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/customer/managerList";
	}
	
	@RequestMapping(value = "/console/customer/manager_write", method = RequestMethod.GET)
	public String managerWrite(Model model, HttpServletRequest request, BLDCodeVO bldCodeVO) {
		
		try {
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> bldCode = buildingService.selectListForBLDCode(bldCodeVO);
			model.addAttribute("list", bldCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/customer/managerWrite";
	}
	
//	@Transactional
	@RequestMapping(value = "/console/customer/manager_writeAction", method = RequestMethod.POST)
	public String managerWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, ManagerVO managerVO, Authentication authentication) {
		
		try {
			AdminVO adminVO = (AdminVO)authentication.getPrincipal();			
			managerVO.setRegID(adminVO.getAdmID());
			managerService.insertBuildingManager(managerVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/customer/manager_write";
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:/console/customer/manager";
	}
	
	@RequestMapping(value = "/console/customer/manager_modify/{bldManagerSeq}", method = RequestMethod.GET)
	public String managerModity(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, @PathVariable("bldManagerSeq") int bldManagerSeq) {
		
		try {
			
			ManagerVO managerVO = new ManagerVO();
			managerVO.setBldManagerSeq(bldManagerSeq);
			ManagerVO manager = managerService.selectOneForManager(managerVO);
			
			BLDCodeVO bldCodeVO1 = new BLDCodeVO();
			bldCodeVO1.setBldCodeSeq(Integer.parseInt(manager.getBldZone()));
			bldCodeVO1 = buildingService.selectOneForBLDCode(bldCodeVO1);
			
			BLDCodeVO bldCodeVO2 = new BLDCodeVO();
			bldCodeVO2.setBldCodeSeq(Integer.parseInt(manager.getBldDivision()));
			bldCodeVO2 = buildingService.selectOneForBLDCode(bldCodeVO2);
			
			model.addAttribute("area1", bldCodeVO1);
			model.addAttribute("area2", bldCodeVO2);
			model.addAttribute("vo", manager);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/customer/managerModify";
	}
	
	@RequestMapping(value = "/console/customer/manager_delete/{bldManagerSeq}", method = RequestMethod.GET)
	public String managerDelete(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, @PathVariable("bldManagerSeq") int bldManagerSeq) {
		
		try {
			
			ManagerVO managerVO = new ManagerVO();
			managerVO.setBldManagerSeq(bldManagerSeq);
			managerService.deleteOneForManager(managerVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/console/customer/manager";
	}
	
//	@Transactional
	@RequestMapping(value = "/console/customer/manager_modifyAction", method = RequestMethod.POST)
	public String managerModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, ManagerVO managerVO) {
		
		try {
			managerService.updateBuildingManager(managerVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/customer/manager_modify/"+managerVO.getBldManagerSeq();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:/console/customer/manager";
	}	
	
	
	
	@RequestMapping(value= "/console/customer/voc", method = RequestMethod.GET)
	public String vocList(Model model, HttpServletRequest request, SearchVO searchVO, Authentication authentication){	
		
		try {
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			searchVO.setAdmID(adminVO.getAdmID());
			searchVO.setPageCount(10);
			searchVO.setTotalCount(vocService.selectCountListForCustVoiceList(searchVO));
			List<CustVoiceVO> list = vocService.selectListForCustVoice(searchVO);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo1 = buildingService.selectListForBLDCode(bldCodeVO);
			
			List<BLDCodeVO> combo2 = null;
			
			if(!commonUtil.isNull(searchVO.getBldZone())) { 
				bldCodeVO.setBldCodeSeq(Integer.parseInt(searchVO.getBldZone()));
				combo2 = buildingService.selectListForBLDCode(bldCodeVO);
			}
			
			List<BLDCodeVO> combo3 = buildingService.selectListForBuildingCombo(searchVO);
			
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("combo1", combo1);
			model.addAttribute("combo2", combo2);
			model.addAttribute("combo3", combo3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/customer/vocList";
	}
	
	@RequestMapping(value= "/console/customer/voc_reply/{custVoiceSeq}", method = RequestMethod.GET)
	public String vocReply(Model model, HttpServletRequest request, Authentication authentication, CustVoiceVO custVoiceVO, @PathVariable("custVoiceSeq") int custVoiceSeq){	
		
		try {
			custVoiceVO.setCustVoiceSeq(custVoiceSeq);
			custVoiceVO = vocService.selectOneForCustVoice(custVoiceVO);
			
			CustVoiceFileVO custVoiceFileVO = new CustVoiceFileVO();
			custVoiceFileVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceFileVO.setCustVoiceType("Q");
			custVoiceFileVO = vocService.selectOneForCustVoiceFile(custVoiceFileVO);
			
			model.addAttribute("vo", custVoiceVO);
			model.addAttribute("fileVO", custVoiceFileVO);
			
			AdminVO adminVO = (AdminVO)authentication.getPrincipal();			
			model.addAttribute("adminVO", adminVO);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo1 = buildingService.selectListForBLDCode(bldCodeVO);
			
			List<BLDCodeVO> combo2 = null;
			
			SearchVO searchVO = new SearchVO(); 
			searchVO.setBldZone(custVoiceVO.getBldZone());
			searchVO.setBldDivision(custVoiceVO.getBldDivision());
			searchVO.setBldFlagCu("Y");
			
			if(!commonUtil.isNull(searchVO.getBldZone())) { 
				bldCodeVO.setBldCodeSeq(Integer.parseInt(searchVO.getBldZone()));
				combo2 = buildingService.selectListForBLDCode(bldCodeVO);
			}
			
			List<BLDCodeVO> combo3 = buildingService.selectListForBuildingCombo(searchVO);
			
			model.addAttribute("combo1", combo1);
			model.addAttribute("combo2", combo2);
			model.addAttribute("combo3", combo3);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/customer/vocReply";
	}
	
	@RequestMapping(value= "/console/customer/voc_replyAction", method = RequestMethod.POST)
	public String vocReplyAction(Model model, HttpServletRequest request, Authentication authentication, CustVoiceReplyVO custVoiceReplyVO, RedirectAttributes redirectAttr){	
		
		List<Map<String,Object>> multifileInfo = new ArrayList<Map<String,Object>>();
		String filePath = commonUtil.getFilePath(vocPath);
		
		try {
			//답변저장
			AdminVO adminVO = (AdminVO)authentication.getPrincipal();			
			custVoiceReplyVO.setAdmID(adminVO.getAdmID());
			vocService.insertForCustVoiceReply(custVoiceReplyVO);
			
			//답변 파일 저장
			multifileInfo=fileUploadUtil.fileUpload(request, filePath);
			String now = commonUtil.getTodate("yyyy년MM월dd일 HH:mm:ss");
			
			for(Map<String,Object> v : multifileInfo){
				String originalFileName	=	(String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName	=	(String) v.get("STORED_FILE_NAME");
				String fileSize			=	(String) v.get("FILE_SIZE");				
				String fileType		=	(String) v.get("FILE_TYPE");
				String fileFormName		=	(String) v.get("FORM_NAME");
				
				CustVoiceFileVO custVoiceFileVO = new CustVoiceFileVO();
				custVoiceFileVO.setCustVoiceSeq(custVoiceReplyVO.getCustVoiceSeq());
				custVoiceFileVO.setFileType(fileType);
				custVoiceFileVO.setFileOrgnm(originalFileName);
				custVoiceFileVO.setFileSavenm(storedFileName);
				custVoiceFileVO.setFilePath(filePath);
				custVoiceFileVO.setFileSize(fileSize);
				custVoiceFileVO.setFileFormName(fileFormName);
				custVoiceFileVO.setCustVoiceType("A");
				vocService.insertForCustVoiceFile(custVoiceFileVO);
			}
			
			//메일발송
			if("A".equals(custVoiceReplyVO.getReplyType()) || "M".equals(custVoiceReplyVO.getReplyType())) {	//답신 타입이 메일이나 전부 체크했을경우
				CustVoiceVO custVoiceVO = new CustVoiceVO();
				custVoiceVO.setCustVoiceSeq(custVoiceReplyVO.getCustVoiceSeq());
				custVoiceVO = vocService.selectOneForCustVoice(custVoiceVO);
				
				Hashtable<String, String> ht = new Hashtable<String, String>();
				ht.put("title", commonUtil.nvl(custVoiceVO.getCustTitle()));
				ht.put("contents", commonUtil.nvl(custVoiceVO.getContents()));
				ht.put("replyContents", commonUtil.nvl(custVoiceReplyVO.getReplyContents()));
				ht.put("regDate", now);
				
				TemplateReader tr = commonUtil.setTemplete("/template/mail_reply.html", ht);
				String mailTitle = "고객의 소리 답변입니다.";
				
				Email email = new Email();
				email.setSender(realtyEmail);
				email.setSubject(mailTitle);
				email.setReceiver(custVoiceVO.getCustEmail());
				email.setContent(tr.getTemplate());
				emailSender.SendFileEmail(email,multifileInfo);
				
			}
			
			//답변 플래그 변경
			vocService.updateOneForCustVoiceReplyFlag(custVoiceReplyVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/customer/voc_reply/"+custVoiceReplyVO.getCustVoiceSeq();
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:/console/customer/voc";
	}
	
	
	@RequestMapping(value = "/console/customer/voc_manageChangeAction", method = RequestMethod.POST)
	public String vocManageChangeAction(Model model, HttpServletRequest request, CustVoiceVO custVoiceVO,
			RedirectAttributes redirectAttr) {

		try {

			CustVoiceVO vo = vocService.selectOneForCustVoice(custVoiceVO);

			vocService.updateForCustVoiceManager(custVoiceVO);

			SearchVO searchVO = new SearchVO();
			searchVO.setBldInfoSeq(Integer.toString(custVoiceVO.getBldInfoSeq()));

			Hashtable<String, String> ht = new Hashtable<String, String>();
			ht.put("title", commonUtil.nvl(vo.getCustTitle()));
			ht.put("contents", commonUtil.nvl(vo.getContents()));
			ht.put("regDate", vo.getRegDate());

			TemplateReader tr = commonUtil.setTemplete("/template/mail_voc.html", ht);
			searchVO.setTotalCount(1);
			List<ManagerVO> lst = managerService.selectListForManager(searchVO);
			String mailTitle = "고객의 소리가 이관 되었습니다.";

			for (ManagerVO v : lst) {
				String placeMail = commonUtil.nvl(v.getPlaceMail());
				String csMail = commonUtil.nvl(v.getCsMail());

				Email email = new Email();
				email.setSender(realtyEmail);
				email.setSubject(mailTitle);
				email.setContent(tr.getTemplate());

				// 현장 담당자 메일발송
				if (!commonUtil.isNull(placeMail)) {
					email.setReceiver(placeMail);
					emailSender.SendEmail(email);
				}

				// cs 담당자 메일발송
				if (!commonUtil.isNull(csMail)) {
					email.setReceiver(csMail);
					emailSender.SendEmail(email);
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/customer/voc_reply/" + custVoiceVO.getCustVoiceSeq();
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:/console/customer/voc_reply/" + custVoiceVO.getCustVoiceSeq();
	}
	
	
	@RequestMapping(value= "/console/customer/voc_modify/{custVoiceSeq}", method = RequestMethod.GET)
	public String vocModify(Model model, HttpServletRequest request, Authentication authentication, CustVoiceVO custVoiceVO, @PathVariable("custVoiceSeq") int custVoiceSeq){	
		
		try {
			custVoiceVO.setCustVoiceSeq(custVoiceSeq);
			custVoiceVO = vocService.selectOneForCustVoice(custVoiceVO);
			
			CustVoiceFileVO custVoiceFileVO = new CustVoiceFileVO();
			custVoiceFileVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceFileVO.setCustVoiceType("Q");
			custVoiceFileVO = vocService.selectOneForCustVoiceFile(custVoiceFileVO);
			
			model.addAttribute("vo", custVoiceVO);
			model.addAttribute("fileVO", custVoiceFileVO);
			
			CustVoiceReplyVO custVoiceReplyVO = new  CustVoiceReplyVO();
			CustVoiceFileVO custVoiceFileVO2 = new CustVoiceFileVO();			
			custVoiceReplyVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceReplyVO=vocService.selectOneForCustVoiceReply(custVoiceReplyVO);				
			custVoiceFileVO2.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceFileVO2.setCustVoiceType("A");
			custVoiceFileVO2 = vocService.selectOneForCustVoiceFile(custVoiceFileVO2);
			
			model.addAttribute("replyVO", custVoiceReplyVO);
			model.addAttribute("fileReplyVO", custVoiceFileVO2);
						
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo1 = buildingService.selectListForBLDCode(bldCodeVO);
			
			List<BLDCodeVO> combo2 = null;
			
			SearchVO searchVO = new SearchVO(); 
			searchVO.setBldZone(custVoiceVO.getBldZone());
			searchVO.setBldDivision(custVoiceVO.getBldDivision());
			searchVO.setBldFlagCu("Y");
			
			if(!commonUtil.isNull(searchVO.getBldZone())) { 
				bldCodeVO.setBldCodeSeq(Integer.parseInt(searchVO.getBldZone()));
				combo2 = buildingService.selectListForBLDCode(bldCodeVO);
			}
			
			List<BLDCodeVO> combo3 = buildingService.selectListForBuildingCombo(searchVO);
			
			model.addAttribute("combo1", combo1);
			model.addAttribute("combo2", combo2);
			model.addAttribute("combo3", combo3);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/customer/vocModify";
	}
	
	@RequestMapping(value = "/console/customer/voc_TalkTalk", method = RequestMethod.POST)
	public String vocTalkTalk(Model model, HttpServletRequest request, Authentication authentication, CustVoiceVO custVoiceVO) {
		String retunUtl="";
		try {
			//문의글 조회
			custVoiceVO = vocService.selectOneForCustVoice(custVoiceVO);
			
			//문의 파일 조회
			CustVoiceFileVO custVoiceFileVO = new CustVoiceFileVO();
			custVoiceFileVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceFileVO.setCustVoiceType("Q");
			custVoiceFileVO = vocService.selectOneForCustVoiceFile(custVoiceFileVO);

			//답변글 조회
			CustVoiceReplyVO custVoiceReplyVO = new CustVoiceReplyVO();
			CustVoiceFileVO custVoiceFileVO2 = new CustVoiceFileVO();
			custVoiceReplyVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceReplyVO = vocService.selectOneForCustVoiceReply(custVoiceReplyVO);
			
			//답변 파일 조회
			custVoiceFileVO2.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceFileVO2.setCustVoiceType("A");
			custVoiceFileVO2 = vocService.selectOneForCustVoiceFile(custVoiceFileVO2);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(Integer.parseInt(custVoiceVO.getBldZone()));
			BLDCodeVO bldZone = buildingService.selectOneForBLDCode(bldCodeVO);
			
			bldCodeVO.setBldCodeSeq(Integer.parseInt(custVoiceVO.getBldDivision()));
			BLDCodeVO bldDivision = buildingService.selectOneForBLDCode(bldCodeVO);
			
			BuildingVO buildingVO = new BuildingVO();
			buildingVO.setBldInfoSeq(custVoiceVO.getBldInfoSeq());
			buildingVO = buildingService.selectOneForBuilding(buildingVO);
			
			String buildingNM = bldZone.getCodeName()+" "+bldDivision.getCodeName()+" "+buildingVO.getBldName();

			TalkTalkVO talkTalkVO = new TalkTalkVO();
			talkTalkVO.setCustVoiceVO(custVoiceVO);
			talkTalkVO.setCustVoiceFileVO(custVoiceFileVO);
			talkTalkVO.setCustVoiceReplyVO(custVoiceReplyVO);
			talkTalkVO.setCustVoiceFileReplyVO(custVoiceFileVO2);
			talkTalkVO.setBuildingNM(buildingNM);
			
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			
			if("Y".equals(custVoiceVO.getIsTolk())) {
				talkTalkService.updateTalkTalk(talkTalkVO, adminVO);
			}else {
				talkTalkService.insertTalkTalk(talkTalkVO, adminVO);				
			}
			
			if("Y".equals(custVoiceVO.getIsReply())) {
				retunUtl="/console/customer/voc_modify/"+custVoiceVO.getCustVoiceSeq();				
			}else {
				retunUtl="/console/customer/voc_reply/"+custVoiceVO.getCustVoiceSeq();				
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:"+retunUtl;
	}
	
	@RequestMapping(value= "/console/customer/voc_modifyAction", method = RequestMethod.POST)
	public String vocModify(Model model, HttpServletRequest request, Authentication authentication, CustVoiceReplyVO custVoiceReplyVO, RedirectAttributes redirectAttr){	
		
		List<Map<String,Object>> multifileInfo = new ArrayList<Map<String,Object>>();
		String filePath = commonUtil.getFilePath(vocPath);
		
		try {
			vocService.updateForCustVoiceReply(custVoiceReplyVO);				
			multifileInfo=fileUploadUtil.fileUpload(request, filePath);
			for(Map<String,Object> v : multifileInfo){
				String originalFileName	=	(String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName	=	(String) v.get("STORED_FILE_NAME");
				String fileSize			=	(String) v.get("FILE_SIZE");				
				String fileType		=	(String) v.get("FILE_TYPE");
				String fileFormName		=	(String) v.get("FORM_NAME");
				
				CustVoiceFileVO custVoiceFileVO = new CustVoiceFileVO();
				custVoiceFileVO.setCustVoiceSeq(custVoiceReplyVO.getCustVoiceSeq());
				custVoiceFileVO.setFileType(fileType);
				custVoiceFileVO.setFileOrgnm(originalFileName);
				custVoiceFileVO.setFileSavenm(storedFileName);
				custVoiceFileVO.setFilePath(filePath);
				custVoiceFileVO.setFileSize(fileSize);
				custVoiceFileVO.setFileFormName(fileFormName);
				custVoiceFileVO.setCustVoiceType("A");
				vocService.insertForCustVoiceFile(custVoiceFileVO);
			}
			
		} catch (Exception e) {			
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/customer/voc_modify/"+custVoiceReplyVO.getCustVoiceSeq();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:/console/customer/voc";
	}
	
	
	
}
