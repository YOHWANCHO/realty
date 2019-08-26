package kr.co.realty.controller.cs;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.building.vo.BLDCodeVO;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.data.comm.vo.SinmungoVO;
import kr.co.realty.data.manager.service.ManagerService;
import kr.co.realty.data.manager.vo.ManagerVO;
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
public class CsController {
	
	private static final Logger logger = LoggerFactory.getLogger(CsController.class);
	
	@Autowired
	BoardService boardService;
	
	@Value("#{conf['file.folder.viewPath']}")
	private String viewPath;
	
	@Value("#{conf['file.folder.tempFile']}")
	private String tempFilePath;
	
	@Value("#{conf['file.folder.voc']}")
	private String vocPath;
	
	@Value("#{conf['sinmungo.email']}")
	private String sinmungoEmail;
	
	@Value("#{conf['sinmungo.email.template']}")
	private String emailTemplate;
	
	@Value("#{conf['realty.email']}")
	private String realtyEmail;
	
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	private BuildingService buildingService;
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private VocService vocService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value= "/cs/notice_list", method = RequestMethod.GET)
	public String socialList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(310);
			searchVO.setUserFlag("USER");
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/cs/noticeList";
	}
	
	@RequestMapping(value= "/cs/notice_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String socialView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
		try {			
			
			BoardVO boardVO = new BoardVO();
			boardVO.setMainBoardSeq(mainBoardSeq);
			boardVO = boardService.selectOneForMainBoard(boardVO);
			
			
			BoardVO preNext = new BoardVO();
			searchVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			searchVO.setBoardID(boardVO.getBoardID());
			if (!commonUtil.isNull(boardVO.getShowDate()) && boardVO.getShowDate().length() > 9) {
				searchVO.setShowDate(boardVO.getShowDate().substring(0, 10));
			}
			preNext = boardService.selectOneForMainBoardPreNext(searchVO);
			
			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			boardFileVO = boardService.selectOneForMainBoardFile(boardFileVO);
			
			boardService.updateForMainBoardHitCount(boardVO);
			
			model.addAttribute("vo", boardVO);
			model.addAttribute("preNext", preNext);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("fileVO", boardFileVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/cs/noticeView";
	}
	
	@RequestMapping(value= {"/cs/faq01","/cs/faq02","/cs/faq03","/cs/faq04","/cs/faq05"}, method = RequestMethod.GET)
	public String faq01(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		String url = request.getRequestURI();
		try {
			searchVO.setBoardID(340);
			searchVO.setUserFlag("USER");
			
			searchVO.setCodeSeq(110);
			int faq01Cnt = boardService.selectCountListForCodeInBoard(searchVO);
			searchVO.setCodeSeq(111);
			int faq02Cnt = boardService.selectCountListForCodeInBoard(searchVO);
			searchVO.setCodeSeq(112);
			int faq03Cnt = boardService.selectCountListForCodeInBoard(searchVO);
			searchVO.setCodeSeq(113);
			int faq04Cnt = boardService.selectCountListForCodeInBoard(searchVO);
			searchVO.setCodeSeq(114);
			int faq05Cnt = boardService.selectCountListForCodeInBoard(searchVO);
						
			model.addAttribute("faq01Cnt", faq01Cnt);
			model.addAttribute("faq02Cnt", faq02Cnt);
			model.addAttribute("faq03Cnt", faq03Cnt);
			model.addAttribute("faq04Cnt", faq04Cnt);
			model.addAttribute("faq05Cnt", faq05Cnt);
			
			String urlre="";
			if("/cs/faq01".equals(url)) {
				if(faq01Cnt!=0) {
					urlre = url.replace("/cs/", "");
				}else {
					if(faq01Cnt==0 && commonUtil.isNull(urlre)) {
						urlre="faq02";						
					}else if(faq02Cnt==0 && commonUtil.isNull(urlre)) {
						urlre="faq03";
					}else if(faq03Cnt==0 && commonUtil.isNull(urlre)) {
						urlre="faq04";
					}else if(faq04Cnt==0 && commonUtil.isNull(urlre)) {
						urlre="faq05";
					}else if(faq05Cnt==0 && commonUtil.isNull(urlre)) {
						urlre="faq01";
					}else {
						urlre = url.replace("/cs/", "");
					}
				}
			}else {
				urlre = url.replace("/cs/", "");
			}
			
			int codeSeq = 0;
			switch (urlre) {
			case "faq01":
				codeSeq = 110;
				break;
			case "faq02":
				codeSeq = 111;
				break;
			case "faq03":
				codeSeq = 112;
				break;
			case "faq04":
				codeSeq = 113;
				break;
			case "faq05":
				codeSeq = 114;
				break;
			default:
				break;
			}
			
			searchVO.setCodeSeq(codeSeq);
			searchVO.setTotalCount(boardService.selectCountListForCodeInBoard(searchVO));
			List<BoardVO> list = boardService.selectListForCodeInBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url+"List";
	}
	
	@RequestMapping(value= "/cs/cyber_write", method = RequestMethod.GET)
	public String cyberWrite(Model model, HttpServletRequest request){	
		
		try {
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/cs/cyberWrite";
	}
	
	@RequestMapping(value = "/cs/cyber_writeAction", method = RequestMethod.POST)
	public String mainBoardWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SinmungoVO  sinmungoVO) {
		
		List<Map<String,Object>> multifileInfo = new ArrayList<Map<String,Object>>();
		java.io.BufferedReader in = null;
		String msg = "발송 실패하였습니다.";
		try {
			
			 	String filePath = tempFilePath;
			    		    
			 	multifileInfo = fileUploadUtil.fileUpload(request, filePath);		//파일 업로드
			 	
			 	for(Map<String,Object> v : multifileInfo){
			 		int i =Integer.parseInt((String)v.get("FILE_SIZE"));
			 		if(10485765<i) {
			 			msg = "파일 용량이 10메가를 초과 했습니다.";
			 			throw new Exception();
			 		}
			 	}
			 	
			 	ClassLoader cl = Thread.currentThread().getContextClassLoader();
			 	if(cl == null) {
			 		cl=ClassLoader.getSystemClassLoader();
			 	}
			 	InputStream input = cl.getResourceAsStream("/template/mail_cyber.html");
			 	
			 	in  = new java.io.BufferedReader(new InputStreamReader(input,"UTF-8"));
				StringBuffer buf = new StringBuffer();
				String line;
				while( (line = in.readLine()) != null ) buf.append(line + "\n");
				Hashtable<String, String> ht = new Hashtable<String, String>();
				ht.put("mailTitle", commonUtil.nvl(sinmungoVO.getMailTitle()));
				ht.put("corrTeam", commonUtil.nvl(sinmungoVO.getCorrTeam()));
				ht.put("corrPosition", commonUtil.nvl(sinmungoVO.getCorrPosition()));
				ht.put("corrName", commonUtil.nvl(sinmungoVO.getCorrName()));
				ht.put("corrContents", commonUtil.nvl(sinmungoVO.getCorrContents()));
				ht.put("writerTeam", commonUtil.nvl(sinmungoVO.getWriterTeam()));
				ht.put("writerName", commonUtil.nvl(sinmungoVO.getWriterName()));
				ht.put("writerEmail", commonUtil.nvl(sinmungoVO.getWriterEmail()));
				ht.put("writerPhone", commonUtil.nvl(sinmungoVO.getWriterPhone()));
				
				TemplateReader tr = new TemplateReader(ht, buf.toString());		//템플릿 생성
				
				Email email = new Email();
				email.setSender(realtyEmail);
				email.setSubject(sinmungoVO.getMailTitle());
				email.setContent(tr.getTemplate());
				email.setReceiver(sinmungoEmail);
				emailSender.SendFileEmail(email,multifileInfo);
		} catch (Exception e) {
			redirectAttr.addFlashAttribute("msg", msg);
			e.printStackTrace();
			return "redirect:/cs/cyber_write";
		}finally {
			for(Map<String,Object> v : multifileInfo){
				fileUploadUtil.uploadedFileDelete(tempFilePath+(String) v.get("STORED_FILE_NAME"));
			}
		}
		
		return "/cs/cyber_complete";
	}
	
	
	@RequestMapping(value= "/cs/voc_list", method = RequestMethod.GET)
	public String vocList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setIsUse("Y");
			searchVO.setTotalCount(vocService.selectCountListForCustVoiceList(searchVO));
			List<CustVoiceVO> list = vocService.selectListForCustVoice(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/cs/vocList";
	}
	
	@RequestMapping(value= "/cs/voc_write", method = RequestMethod.GET)
	public String vocWrite(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo1 = buildingService.selectListForBLDCode(bldCodeVO);
			model.addAttribute("combo1", combo1);
			model.addAttribute("isQR", searchVO.getIsQR());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/cs/vocWrite";
	}
	
	@RequestMapping(value= "/cs/voc_writeAction", method = RequestMethod.POST)
	public String vocWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, CustVoiceVO custVoiceVO){	
		
		List<Map<String,Object>> multifileInfo = new ArrayList<Map<String,Object>>();
		String filePath = commonUtil.getFilePath(vocPath);
		
		try {
			String pw = passwordEncoder.encode(custVoiceVO.getCustPW());
			custVoiceVO.setCustPW(pw);
			vocService.insertForCustVoice(custVoiceVO);
			
			multifileInfo=fileUploadUtil.fileUpload(request, filePath);
			
			for(Map<String,Object> v : multifileInfo){
		 		int i =Integer.parseInt((String)v.get("FILE_SIZE"));
		 		if(10485765<i) {
		 			String msg = "파일 용량이 10메가를 초과 했습니다.";
		 			redirectAttr.addFlashAttribute("msg", msg);
		 			throw new Exception();
		 		}
		 	}
			String now = commonUtil.getTodate("yyyy년MM월dd일 HH:mm:ss");
			
			for(Map<String,Object> v : multifileInfo){
				String originalFileName	=	(String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName	=	(String) v.get("STORED_FILE_NAME");
				String fileSize			=	(String) v.get("FILE_SIZE");				
				String fileType		=	(String) v.get("FILE_TYPE");
				String fileFormName		=	(String) v.get("FORM_NAME");
				
				CustVoiceFileVO custVoiceFileVO = new CustVoiceFileVO();
				custVoiceFileVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
				custVoiceFileVO.setFileType(fileType);
				custVoiceFileVO.setFileOrgnm(originalFileName);
				custVoiceFileVO.setFileSavenm(storedFileName);
				custVoiceFileVO.setFilePath(filePath);
				custVoiceFileVO.setFileSize(fileSize);
				custVoiceFileVO.setFileFormName(fileFormName);
				custVoiceFileVO.setCustVoiceType("Q");
				vocService.insertForCustVoiceFile(custVoiceFileVO);
			}
			
			SearchVO searchVO = new SearchVO();
			searchVO.setBldInfoSeq(Integer.toString(custVoiceVO.getBldInfoSeq()));
			
			Hashtable<String, String> ht = new Hashtable<String, String>();
			ht.put("title", commonUtil.nvl(custVoiceVO.getCustTitle()));
			ht.put("contents", commonUtil.nvl(custVoiceVO.getContents()));
			ht.put("regDate", now);
			
			TemplateReader tr = commonUtil.setTemplete("/template/mail_voc.html", ht);	
			searchVO.setTotalCount(1);
			List<ManagerVO>lst = managerService.selectListForManager(searchVO);
			String mailTitle = "고객의 소리가 접수 되었습니다.";
			
			for(ManagerVO v : lst) {
				String placeMail = commonUtil.nvl(v.getPlaceMail());
				String csMail = commonUtil.nvl(v.getCsMail());				
				
				Email email = new Email();
				email.setSender(realtyEmail);
				email.setSubject(mailTitle);
				email.setContent(tr.getTemplate());
				
				if(!commonUtil.isNull(placeMail)) {
					email.setReceiver(placeMail);					
					emailSender.SendFileEmail(email,multifileInfo);
				}
				if(!commonUtil.isNull(csMail)) {
					email.setReceiver(csMail);					
					emailSender.SendFileEmail(email,multifileInfo);
				}
			}
			
			//고객용 메일
			TemplateReader tr2 = commonUtil.setTemplete("/template/mail_voc_customer.html", ht);
			Email email = new Email();
			email.setSender(realtyEmail);
			email.setSubject(mailTitle);
			email.setReceiver(custVoiceVO.getCustEmail());
			email.setContent(tr2.getTemplate());
			emailSender.SendFileEmail(email,multifileInfo);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/cs/voc_write";
		}		
		return "redirect:/cs/voc_complete";
	}
	
	@RequestMapping(value= "/cs/voc_view/{custVoiceSeq}", method = RequestMethod.GET)
	public String vocWrite(Model model, HttpServletRequest request, CustVoiceVO custVoiceVO, @PathVariable("custVoiceSeq") int custVoiceSeq){	
		
		try {
			custVoiceVO.setCustVoiceSeq(custVoiceSeq);
			//조회수 증가
			vocService.updateForCustVoiceHitCount(custVoiceVO);
			custVoiceVO = vocService.selectOneForCustVoice(custVoiceVO);
			CustVoiceFileVO custVoiceFileVO = new CustVoiceFileVO();
			custVoiceFileVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
			custVoiceFileVO.setCustVoiceType("Q");
			custVoiceFileVO = vocService.selectOneForCustVoiceFile(custVoiceFileVO);
			
			//답변이 된 경우
			CustVoiceReplyVO custVoiceReplyVO = new  CustVoiceReplyVO();
			CustVoiceFileVO custVoiceFileVO2 = new CustVoiceFileVO();
			if("Y".equals(custVoiceVO.getIsReply())) {
				custVoiceReplyVO.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
				custVoiceReplyVO=vocService.selectOneForCustVoiceReply(custVoiceReplyVO);				
				custVoiceFileVO2.setCustVoiceSeq(custVoiceVO.getCustVoiceSeq());
				custVoiceFileVO2.setCustVoiceType("A");
				custVoiceFileVO2 = vocService.selectOneForCustVoiceFile(custVoiceFileVO2);
			}
			model.addAttribute("vo", custVoiceVO);
			model.addAttribute("replyVO", custVoiceReplyVO);
			
			model.addAttribute("fileVO", custVoiceFileVO);
			model.addAttribute("fileReplyVO", custVoiceFileVO2);
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/cs/vocView";
	}
	
	@RequestMapping(value= "/cs/voc_complete", method = RequestMethod.GET)
	public String vocComplete(Model model, HttpServletRequest request, CustVoiceVO custVoiceVO){	
		
		try {
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/cs/vocComplete";
	}
}
