package kr.co.realty.controller.admin.contents;

import java.util.ArrayList;
import java.util.HashMap;
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
import kr.co.realty.data.balance.service.BalanceService;
import kr.co.realty.data.balance.vo.BalanceVO;
import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.building.vo.BLDCodeVO;
import kr.co.realty.data.building.vo.BuildingFileVO;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.data.greenhouse.service.GreenHouseService;
import kr.co.realty.data.greenhouse.vo.GreenHouseVO;
import kr.co.realty.data.oneFile.service.OneFileService;
import kr.co.realty.data.oneFile.vo.OneFileVO;
import kr.co.realty.data.reReader.service.ReReaderService;
import kr.co.realty.data.reReader.vo.ReReaderVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.FileUploadUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class AdminContentsController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminContentsController.class);
	
	@Autowired
	private BuildingService buildingService;
	
	@Autowired
	private OneFileService oneFileService;
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@Autowired
	private GreenHouseService greenHouseService;
	
	@Autowired
	private BalanceService balanceService;
	
	@Autowired
	private ReReaderService reReaderService;
	
	@Value("#{conf['file.folder.building']}")
	private String fileFolder;
	
	@Value("#{conf['file.folder.oneFile']}")
	private String oneFileFolder;
	
	
	
	@RequestMapping(value = "/console/contents/building", method = RequestMethod.GET)
	public String building(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {

		try {
			searchVO.setTotalCount(buildingService.selectCountListForBuilding(searchVO));
			List<BuildingVO> list = buildingService.selectListForBuilding(searchVO);
			
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
		return "/console/contents/buildingList";
	}

	@RequestMapping(value = "/console/contents/building_write", method = RequestMethod.GET)
	public String buildingWrite(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,BLDCodeVO bldCodeVO) {

		try {			
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> bldCode = buildingService.selectListForBLDCode(bldCodeVO);
			model.addAttribute("list", bldCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/buildingWrite";
	}
	
//	@Transactional
	@RequestMapping(value = "/console/contents/building_writeAction", method = RequestMethod.POST)
	public String buildingWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BuildingVO buildingVO, Authentication authentication) {
		
		List<Map<String,Object>> multifileInfo = new ArrayList<Map<String,Object>>();
		String filePath = commonUtil.getFilePath(fileFolder);
		
		try {			
			
			AdminVO adminVO = (AdminVO)authentication.getPrincipal();
			buildingVO.setRegID(adminVO.getAdmID());
			buildingService.insertBuildingInfo(buildingVO);			
			
			fileUploadUtil.fileType= new String[]{"IMAGE"};	
			multifileInfo=fileUploadUtil.fileUpload(request, filePath);
			
			for(Map<String,Object> v : multifileInfo){
				String originalFileName	=	(String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName	=	(String) v.get("STORED_FILE_NAME");
				String fileSize			=	(String) v.get("FILE_SIZE");				
				String fileType		=	(String) v.get("FILE_TYPE");
				String fileFormName		=	(String) v.get("FORM_NAME");
				
				BuildingFileVO buildingFileVO = new BuildingFileVO();
				buildingFileVO.setBldInfoSeq(buildingVO.getBldInfoSeq());				
				buildingFileVO.setFileType(fileType);
				buildingFileVO.setFileOrgnm(originalFileName);
				buildingFileVO.setFileSavenm(storedFileName);
				buildingFileVO.setFilePath(filePath);
				buildingFileVO.setFileSize(fileSize);				
				buildingFileVO.setFileFormName(fileFormName);
				buildingService.insertBuildingInfoFile(buildingFileVO);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/contents/building_write";
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:/console/contents/building";
	}
		
	@RequestMapping(value = "/console/contents/building_modify/{bldInfoSeq}", method = RequestMethod.GET)
	public String buildingModify(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,  @PathVariable("bldInfoSeq") int bldInfoSeq, SearchVO searchVO) {
		
		try {			
			
			BuildingVO buildingVO = new BuildingVO();
			buildingVO.setBldInfoSeq(bldInfoSeq);
			BuildingVO vo = buildingService.selectOneForBuilding(buildingVO);
			vo.setArrBldTelnum(commonUtil.divideMobile(vo.getBldTelnum()));
			
			BuildingFileVO buildingFileVO = new BuildingFileVO();
			buildingFileVO.setBldInfoSeq(buildingVO.getBldInfoSeq());
			buildingFileVO = buildingService.selectOneForBuildingFile(buildingFileVO);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo1 = buildingService.selectListForBLDCode(bldCodeVO);
			
			bldCodeVO.setBldCodeSeq(vo.getBldZone());
			List<BLDCodeVO> combo2 = buildingService.selectListForBLDCode(bldCodeVO);
			
//			searchVO.setBldZone(vo.getBldZone());
//			searchVO.setBldDivision(vo.getBldDivision());
//			List<BLDCodeVO> combo3 = buildingService.selectListForBuildingCombo(searchVO);
			
			model.addAttribute("vo", vo);
			model.addAttribute("fileVO", buildingFileVO);
			model.addAttribute("combo1", combo1);
			model.addAttribute("combo2", combo2);
//			model.addAttribute("combo3", combo3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/buildingModify";
	}
	
	@RequestMapping(value = "/console/contents/building_delete/{bldInfoSeq}", method = RequestMethod.GET)
	public String buildingDelete(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,  @PathVariable("bldInfoSeq") int bldInfoSeq, SearchVO searchVO) {
		
		try {			
			
			BuildingVO buildingVO = new BuildingVO();
			buildingVO.setBldInfoSeq(bldInfoSeq);
			buildingService.deleteOneForBuilding(buildingVO);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/console/contents/building";
	}
	
//	@Transactional
	@RequestMapping(value = "/console/contents/building_modifyAction", method = RequestMethod.POST)
	public String buildingModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BuildingVO buildingVO, Authentication authentication) {
		
		List<Map<String,Object>> multifileInfo = new ArrayList<Map<String,Object>>();
		String filePath = commonUtil.getFilePath(fileFolder);
		
		try {
			int regSeq =  buildingService.updateBuildingInfo(buildingVO);
			fileUploadUtil.fileType= new String[]{"IMAGE"};	
			multifileInfo=fileUploadUtil.fileUpload(request, filePath);
			for(Map<String,Object> v : multifileInfo){
				String originalFileName	=	(String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName	=	(String) v.get("STORED_FILE_NAME");
				String fileSize			=	(String) v.get("FILE_SIZE");				
				String fileType		=	(String) v.get("FILE_TYPE");
				String fileFormName		=	(String) v.get("FORM_NAME");
				
				BuildingFileVO buildingFileVO = new BuildingFileVO();
				buildingFileVO.setBldInfoSeq(buildingVO.getBldInfoSeq());				
				buildingFileVO.setFileType(fileType);
				buildingFileVO.setFileOrgnm(originalFileName);
				buildingFileVO.setFileSavenm(storedFileName);
				buildingFileVO.setFilePath(filePath);
				buildingFileVO.setFileSize(fileSize);				
				buildingFileVO.setFileFormName(fileFormName);
				buildingService.insertBuildingInfoFile(buildingFileVO);
			}
			
		} catch (Exception e) {
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/contents/building_modify/"+buildingVO.getBldInfoSeq();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:/console/contents/building";
	}
	
	
	//부동산 자료 구독관리
	
	@RequestMapping(value = "/console/contents/bldLetter", method = RequestMethod.GET)
	public String lease(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {
		
		try{					
			searchVO.setTotalCount(reReaderService.selectCountListForReReader(searchVO));
			List<ReReaderVO> list = reReaderService.selectListForReReader(searchVO);
			model.addAttribute("searchVO", searchVO);					
			model.addAttribute("list", list);
		}catch(Exception e){
			e.printStackTrace();
			redirectAttr.addFlashAttribute("mag", "조회 에러");			
		}	
		return "/console/contents/bldLetterList";
	}
	
	@RequestMapping(value = "/console/contents/bldLetter_excel", method = RequestMethod.POST)
	public String visitExcel(Model model, HttpServletRequest request, SearchVO searchVO, Map<String, Object> modelMap) {
		
		try {
			
			String excelName = "구독 현황("+searchVO.getSearchFromDate()+"~"+searchVO.getSearchToDate()+")"+ reReaderService.selectCountListForReReader(searchVO)+"건";			
			
			List<ReReaderVO> reReaderVO = reReaderService.selectListForReReaderExcel(searchVO);		
			
			
			List<String> colName1 = new ArrayList<String>();
			colName1.add("분류");
			colName1.add("이름");
			colName1.add("연락처");			
			colName1.add("이메일");
			colName1.add("등록일");
			colName1.add("취소일");
			colName1.add("취소이름");
			
			modelMap.put("excelName", excelName);
			modelMap.put("excelSeet", "구독현황");
			modelMap.put("colName1", colName1);
			
			modelMap.put("list", reReaderVO);
			modelMap.put("searchVO", searchVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
		return "excelViewReader";
	}
	
	@RequestMapping(value = "/console/contents/lease", method = RequestMethod.GET)
	public String lease(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, OneFileVO oneFileVO) {

		oneFileVO.setBoardID(commonUtil.getBoardID(request));
		
		try{			
			oneFileVO = oneFileService.selectOneFile(oneFileVO);
			model.addAttribute("vo", oneFileVO);					
		}catch(Exception e){
			e.printStackTrace();
			redirectAttr.addFlashAttribute("mag", "조회 에러");			
		}	
		return "/console/contents/leaseView";
	}
	
	@RequestMapping(value = "/console/contents/lease_modifyAction", method = RequestMethod.POST)
	public String leaseModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, OneFileVO oneFileVO, Authentication authentication) {
		
		String filePath = oneFileFolder;
		AdminVO adminVO = (AdminVO)authentication.getPrincipal();
		
		Map<String,Object> fileInfo = new HashMap<String,Object>();
		try{
			oneFileVO.setRegID(adminVO.getAdmID());
			oneFileVO.setBoardID(commonUtil.getBoardID(request));
						
			fileUploadUtil.fileType=new String[]{"PDF"};
			fileInfo = fileUploadUtil.fileUpload(request, filePath,"uploadFile");
			if(fileInfo != null){
				oneFileVO.setFileOrgnm(fileInfo.get("ORIGINAL_FILE_NAME").toString());
				oneFileVO.setFileSavenm(fileInfo.get("STORED_FILE_NAME").toString());
				oneFileVO.setFilePath(filePath);
				oneFileVO.setFileSize(fileInfo.get("FILE_SIZE").toString());
				oneFileVO.setFileType(fileInfo.get("FILE_TYPE").toString());
				oneFileVO.setFileFormName(fileInfo.get("INPUT_TYPE_NAME").toString());
				oneFileService.mergeOneFile(oneFileVO);
			}
		}catch(Exception e){
			e.printStackTrace();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			return "redirect:/console/contents/lease";
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:/console/contents/lease";
	}
	
	
	/**
	 * 에너지 온실가스 배출실적
	 */
	@RequestMapping(value="/console/contents/greenhouse", method = RequestMethod.GET)
	public String greenhouseList(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {
		
		try {		
			
			searchVO.setTotalCount(greenHouseService.selectCountListForGreenHouse(searchVO));
			List<GreenHouseVO> list = greenHouseService.selectListForGreenHouse(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/greenhouseList";
	}
	
	@RequestMapping(value = "/console/contents/greenhouse_write", method = RequestMethod.GET)
	public String greenhouseWrite(Model model, HttpServletRequest request) {
		
		try {			
			model.addAttribute("today", commonUtil.getTodate("yyyy"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/greenhouseWrite";
	}
	
	// @Transactional
	@RequestMapping(value = "/console/contents/greenhouse_writeAction", method = RequestMethod.POST)
	public String greenhouseWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, GreenHouseVO greenHouseVO, Authentication authentication) {
		List<GreenHouseVO> saveVO = new ArrayList<GreenHouseVO>() ;
		GreenHouseVO vo = new GreenHouseVO();
		try {
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			
			String regID = adminVO.getAdmID();			
			int sYear =  greenHouseVO.getGrYear();
			String sDesc =  greenHouseVO.getGrDesc();
			String[] tco = greenHouseVO.getTco();
			String[] toe = greenHouseVO.getToe();
			
			int row=0;
			
			for(int i=0; i<tco.length; i++) {
				
				int result = i%5;
				switch (result) {
				case 0:
					vo.setColPlace(tco[i]);
					break;
				case 1:
					vo.setFirstQ(tco[i]);
					break;
				case 2:
					vo.setSecondQ(tco[i]);
					break;
				case 3:
					vo.setThirdQ(tco[i]);
					break;
				case 4:
					vo.setFourthQ(tco[i]);
					vo.setGrOrder(row);
					vo.setGrFlag(100);
					vo.setGrYear(sYear);
					vo.setGrDesc(sDesc);
					vo.setRegID(regID);					
					saveVO.add(vo);
					vo = new GreenHouseVO();
					row++;
					break;
				default:
					break;
				}
			}
			
			row=0;
			for(int i=0; i<toe.length; i++) {
				int result = i%5;
				switch (result) {
				case 0:
					vo.setColPlace(toe[i]);
					break;
				case 1:
					vo.setFirstQ(toe[i]);
					break;
				case 2:
					vo.setSecondQ(toe[i]);
					break;
				case 3:
					vo.setThirdQ(toe[i]);
					break;
				case 4:
					vo.setFourthQ(toe[i]);
					vo.setGrOrder(row);
					vo.setGrFlag(200);
					vo.setGrYear(sYear);
					vo.setGrDesc(sDesc);
					vo.setRegID(regID);					
					saveVO.add(vo);
					vo = new GreenHouseVO();
					row++;
					break;
				default:
					break;
				}
			}
						
			for(GreenHouseVO save : saveVO) {
				greenHouseService.insertGreenHouse(save);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_writeAction", "_write");
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_writeAction", "");
	}
	
	
	@RequestMapping(value = "/console/contents/greenhouse_modify/{grYear}", method = RequestMethod.GET)
	public String greenhouseModify(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, @PathVariable("grYear") int grYear) {
		
		try {
			
			GreenHouseVO greenHouseVO = new GreenHouseVO();
			greenHouseVO.setGrYear(grYear);
			List<GreenHouseVO> list = greenHouseService.selectListForOneGreenHouse(greenHouseVO);
			int colTco=0;
			int colToe=0;
			for(GreenHouseVO vo : list) {
				if("tot".equals(vo.getColPlace()) && vo.getGrFlag() == 100 ) {
					colTco = vo.getGrOrder()+1;
				}
				if("tot".equals(vo.getColPlace()) && vo.getGrFlag() == 200 ) {
					colToe = vo.getGrOrder()+1;
				}
			}
			
			model.addAttribute("list", list);
			model.addAttribute("colTco", colTco);
			model.addAttribute("colToe", colToe);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/greenhouseModify";
	}
	
	// @Transactional
	@RequestMapping(value = "/console/contents/greenhouse_modifyAction", method = RequestMethod.POST)
	public String greenhouseModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, GreenHouseVO greenHouseVO, Authentication authentication) {
		List<GreenHouseVO> saveVO = new ArrayList<GreenHouseVO>() ;
		GreenHouseVO vo = new GreenHouseVO();
		
		try {			
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			
			String regID = adminVO.getAdmID();			
			int sYear =  greenHouseVO.getGrYear();
			String sDesc =  greenHouseVO.getGrDesc();
			String[] tco = greenHouseVO.getTco();
			String[] toe = greenHouseVO.getToe();
			
			greenHouseService.deleteGreenHouse(greenHouseVO);
			
			int row=0;
			
			for(int i=0; i<tco.length; i++) {
				
				int result = i%5;
				switch (result) {
				case 0:
					vo.setColPlace(tco[i]);
					break;
				case 1:
					vo.setFirstQ(tco[i]);
					break;
				case 2:
					vo.setSecondQ(tco[i]);
					break;
				case 3:
					vo.setThirdQ(tco[i]);
					break;
				case 4:
					vo.setFourthQ(tco[i]);
					vo.setGrOrder(row);
					vo.setGrFlag(100);
					vo.setGrYear(sYear);
					vo.setGrDesc(sDesc);
					vo.setRegID(regID);					
					saveVO.add(vo);
					vo = new GreenHouseVO();
					row++;
					break;
				default:
					break;
				}
			}
			
			row=0;
			for(int i=0; i<toe.length; i++) {
				int result = i%5;
				switch (result) {
				case 0:
					vo.setColPlace(toe[i]);
					break;
				case 1:
					vo.setFirstQ(toe[i]);
					break;
				case 2:
					vo.setSecondQ(toe[i]);
					break;
				case 3:
					vo.setThirdQ(toe[i]);
					break;
				case 4:
					vo.setFourthQ(toe[i]);
					vo.setGrOrder(row);
					vo.setGrFlag(200);
					vo.setGrYear(sYear);
					vo.setGrDesc(sDesc);
					vo.setRegID(regID);					
					saveVO.add(vo);
					vo = new GreenHouseVO();
					row++;
					break;
				default:
					break;
				}
			}
						
			for(GreenHouseVO save : saveVO) {
				greenHouseService.insertGreenHouse(save);
			}	
		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_modifyAction", "_modify") + "/"
			+ greenHouseVO.getGrYear();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_modifyAction", "");
	}
	
	@RequestMapping(value = "/console/contents/greenhouse_delete", method = RequestMethod.GET)
	public String greenhouseDeleteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, GreenHouseVO greenHouseVO) {
		
		try {
			greenHouseService.deleteGreenHouse(greenHouseVO);			
		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "삭제 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/contents/greenhouse_modify/"+greenHouseVO.getGrYear();
		}
		redirectAttr.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:/console/contents/greenhouse";
	}
	
	/**
	 * 결산공고
	 */
	@RequestMapping(value="/console/contents/closing", method = RequestMethod.GET)
	public String closingList(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {
		
		try {		
			
			searchVO.setTotalCount(balanceService.selectCountListForBalance(searchVO));
			List<BalanceVO> list = balanceService.selectListForBalance(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/closingList";
	}
	
	@RequestMapping(value = "/console/contents/closing_write", method = RequestMethod.GET)
	public String closingWrite(Model model, HttpServletRequest request) {
		
		try {
			
			model.addAttribute("today", commonUtil.getTodate("yyyy"));
			model.addAttribute("boardID", commonUtil.getBoardID(request));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/closingWrite";
	}
	
	// @Transactional
	@RequestMapping(value = "/console/contents/closing_writeAction", method = RequestMethod.POST)
	public String closingWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BalanceVO balanceVO, Authentication authentication) {
			
		try {
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			balanceVO.setRegID(adminVO.getAdmID());			
			balanceService.insertBalance(balanceVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_writeAction", "_write");
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_writeAction", "");
	}
	
	
	@RequestMapping(value = "/console/contents/closing_modify/{blYear}", method = RequestMethod.GET)
	public String closingModify(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, @PathVariable("blYear") int blYear) {
		
		try {
			
			BalanceVO balanceVO = new BalanceVO();
			balanceVO.setBlYear(blYear);
			balanceVO = balanceService.selectOneForBalance(balanceVO);
			
			model.addAttribute("vo", balanceVO);		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/contents/closingModify";
	}
	
	// @Transactional
	@RequestMapping(value = "/console/contents/closing_modifyAction", method = RequestMethod.POST)
	public String closingModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BalanceVO balanceVO) {
				
		try {			
			balanceService.updateBalance(balanceVO);			
		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_modifyAction", "_modify") + "/"
			+ balanceVO.getBlYear();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_modifyAction", "");
	}
	
	@RequestMapping(value = "/console/contents/closing_delete", method = RequestMethod.GET)
	public String closingDeleteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BalanceVO balanceVO) {
		
		try {
			balanceService.deleteBalance(balanceVO);			
		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "삭제 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_delete", "_modify") + "/"
					+ balanceVO.getBlYear();
		}
		redirectAttr.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_delete", "");
	}
	
	
	
}
