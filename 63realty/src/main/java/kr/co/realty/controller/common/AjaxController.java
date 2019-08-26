package kr.co.realty.controller.common;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.realty.data.admin.service.AdminService;
import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.balance.service.BalanceService;
import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.building.vo.BLDCodeVO;
import kr.co.realty.data.building.vo.BuildingFileVO;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.data.greenhouse.service.GreenHouseService;
import kr.co.realty.data.login.service.AdminLoginService;
import kr.co.realty.data.oneFile.service.OneFileService;
import kr.co.realty.data.oneFile.vo.OneFileVO;
import kr.co.realty.data.reReader.service.ReReaderService;
import kr.co.realty.data.reReader.vo.ReReaderVO;
import kr.co.realty.data.voc.service.VocService;
import kr.co.realty.data.voc.vo.CustVoiceFileVO;
import kr.co.realty.data.voc.vo.CustVoiceVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.FileUploadUtil;
import kr.co.realty.util.SearchVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
		
	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	private BuildingService buildingService;
	
	@Autowired
	private AdminLoginService adminLoginService;
	
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private OneFileService oneFileService;
	
    @Value("#{conf['file.folder.viewPath']}")
	private String viewPath;	
			
    @Autowired
	private VocService vocService;
    
    @Autowired
	private GreenHouseService greenHouseService;
    
    @Autowired
	private BalanceService balanceService;
    
    @Autowired
    private ReReaderService reReaderService;
        
	/*
	 * 아이디 중복체크
	 */
	
	@RequestMapping(value = {"/ajax/userIDCheck"})
	public ModelAndView userIDCheck(ModelMap model, AdminVO adminVO) {
		
		ModelAndView modelAndView = new ModelAndView();	
		String msg="";
		try {
			if(!"".equals(commonUtil.nvl(adminVO.getAdmID()))){
				adminVO = adminLoginService.selectOneForLogin(adminVO);
				if(adminVO == null) {
					msg="NODATA";
				}else {
					msg="TOBE";
				}
			}else{
				msg = "NO_ID";
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
			msg = "ERROR";
		}
		model.put("msg", msg);
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	/*
	 * 빌딩구분 선택
	 */
	@RequestMapping(value = {"/ajax/findBLDDivision"})
	public ModelAndView findBLDDivision(ModelMap model, BLDCodeVO bldCodeVO) {
		
		ModelAndView modelAndView = new ModelAndView();
		List<BLDCodeVO> BLDCodeVO = null;
		try {			
			BLDCodeVO = buildingService.selectListForBLDCode(bldCodeVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}
		model.put("list", BLDCodeVO);
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	/*
	 * 빌딩구분 선택
	 */
	@RequestMapping(value = {"/ajax/findBLDInfo"})
	public ModelAndView findBLDInfo(ModelMap model, SearchVO searchVO) {
		
		ModelAndView modelAndView = new ModelAndView();
		List<BLDCodeVO> BLDCodeVO = null;
		try {
			BLDCodeVO = buildingService.selectListForBuildingCombo(searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();		
		}
		model.put("list", BLDCodeVO);
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	/*
	 * 빌딩구분 선택
	 */
	@RequestMapping(value = {"/ajax/findBLDInfoForManager"})
	public ModelAndView findBLDInfoForManager(ModelMap model, SearchVO searchVO) {
		
		ModelAndView modelAndView = new ModelAndView();
		List<BLDCodeVO> BLDCodeVO = null;
		try {
			BLDCodeVO = buildingService.selectListForManagerBuildingCombo(searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.put("list", BLDCodeVO);
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = {"/ajax/deleteBuildingFile"})
	public ModelAndView deleteBuildingFileAction(ModelMap model, @ModelAttribute BuildingFileVO buildingFileVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();	
		String msg="";
		try {
			fileUploadUtil.uploadedFileDelete(buildingFileVO.getFilePath());
			buildingService.deleteBuildingFile(buildingFileVO);			
			msg = "삭제 되었습니다.";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "삭제 실패 했습니다.";
		}		
		model.put("msg", msg);
		model.put("result", "Y");
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = {"/ajax/deleteMainBoardFileSeq"})
	public ModelAndView deleteMainBoardFileAction(ModelMap model, @ModelAttribute BoardFileVO boardFileVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();	
		String msg="";
		try {
			fileUploadUtil.uploadedFileDelete(boardFileVO.getFilePath());
			boardService.deleteMainBoardFileSeq(boardFileVO);			
			msg = "삭제 되었습니다.";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "삭제 실패 했습니다.";
		}		
		model.put("msg", msg);
		model.put("result", "Y");
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = {"/ajax/deleteOneFile"})
	public ModelAndView deleteOneFile(ModelMap model, @ModelAttribute OneFileVO oneFileVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();	
		String msg="";
		try {
			fileUploadUtil.uploadedFileDelete(oneFileVO.getFilePath());
			oneFileService.deleteOneFile(oneFileVO);			
			msg = "삭제 되었습니다.";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "삭제 실패 했습니다.";
		}		
		model.put("msg", msg);
		model.put("result", "Y");
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = {"/ajax/deleteCustVoiceFile"})
	public ModelAndView deleteCustVoiceFile(ModelMap model, @ModelAttribute CustVoiceFileVO custVoiceFileVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();	
		String msg="";
		try {
			fileUploadUtil.uploadedFileDelete(custVoiceFileVO.getFilePath());
			vocService.deleteCustVoiceFile(custVoiceFileVO);			
			msg = "삭제 되었습니다.";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "삭제 실패 했습니다.";
		}		
		model.put("msg", msg);
		model.put("result", "Y");
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = {"/ajax/findAdminList"})
	public String findAdminList(Model model, @ModelAttribute SearchVO searchVO, HttpServletRequest request) {		
		try {			
			searchVO.setTotalCount(adminService.selectCountListForAdmin(searchVO));
			List<AdminVO> adminList = adminService.selectListForAdmin(searchVO);			
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("adminList", adminList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  "/console/ajax/ajaxAdminList";
	}
	
	@RequestMapping(value = {"/ajax/findAdminOne"})
	public ModelAndView findAdminOne(ModelMap model, @ModelAttribute AdminVO adminVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();	
		String msg="";
		try {	
			adminVO = adminService.selectOneForAdmin(adminVO);
			
			String[] arrTel = commonUtil.divideMobile(adminVO.getTelnum());
			adminVO.setTelnum(arrTel[0]+"-"+arrTel[1]+"-"+arrTel[2]);
			
			String[] arrMo = commonUtil.divideMobile(adminVO.getMobilenum());
			adminVO.setMobilenum(arrMo[0]+"-"+arrMo[1]+"-"+arrMo[2]);
			
			msg = "true";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "false";
		}		
		model.put("msg", msg);
		model.put("result", adminVO);
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = "/ajax/getPropertyHtml")
	public String getPropertyHtml(Model model, @ModelAttribute SearchVO searchVO, HttpServletRequest request) {
		try {			
			searchVO.setPageCount(8);
			searchVO.setBldFlagMg("Y");
			searchVO.setTotalCount(buildingService.selectCountListForBuilding(searchVO));
			List<BuildingVO> list = buildingService.selectListForBuilding(searchVO);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo= buildingService.selectListForBLDCode(bldCodeVO);
			
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("combo", combo);			
			model.addAttribute("list", list);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  "/ajax/ajaxPopProperty";
	}
	
	@RequestMapping(value = "/ajaxHttp/getPropertyHtml")
	public String getPropertyHtmlHttp(Model model, @ModelAttribute SearchVO searchVO, HttpServletRequest request) {
		try {			
			searchVO.setPageCount(8);
			searchVO.setBldFlagMg("Y");
			searchVO.setTotalCount(buildingService.selectCountListForBuilding(searchVO));
			List<BuildingVO> list = buildingService.selectListForBuilding(searchVO);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo= buildingService.selectListForBLDCode(bldCodeVO);
			
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("combo", combo);			
			model.addAttribute("list", list);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  "/ajax/ajaxPopProperty";
	}
	
	@RequestMapping(value = "/ajax/modifyCustVoiceIsUse")
	public ModelAndView modifyCustVoiceIsUse(ModelMap model, @ModelAttribute CustVoiceVO custVoiceVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();	
		String msg="";
		try {
			vocService.updateForCustVoiceIsUse(custVoiceVO);
			msg = "변경 되었습니다.";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = "변경 실패 했습니다.";
		}		
		model.put("msg", msg);
		model.put("result", "Y");
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = "/ajax/checkDupYearGreen")
	public ModelAndView checkDupYearGreen(ModelMap model, @ModelAttribute SearchVO searchVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();		
		try {
			int cnt = greenHouseService.selectCountOneForGreenHouse(searchVO);
			if(cnt>0) {
				model.put("result", "N");
			}else {
				model.put("result", "Y");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = "/ajax/checkDupYear")
	public ModelAndView checkDupYear(ModelMap model, @ModelAttribute SearchVO searchVO, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();		
		try {
			int cnt = balanceService.selectCountOneForBalance(searchVO);
			if(cnt>0) {
				model.put("result", "N");
			}else {
				model.put("result", "Y");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
	
	@RequestMapping(value = "/ajaxUser/registCancelReder")
	public ModelAndView registCancelReder(ModelMap model, HttpServletRequest request, ReReaderVO reReaderVO) {
		ModelAndView modelAndView = new ModelAndView();
				
		try {			
			String result="F";			
			if("Y".equals(reReaderVO.getUserFlag())) {
				//중복체크
				int cnt = reReaderService.selectCountOneForReReader(reReaderVO);
				if(cnt>0) {
					result="DUP";
				}else {
					String ip = request.getHeader("X-FORWARDED-FOR");
			        if (ip == null)
			        	ip = request.getRemoteAddr();
			        reReaderVO.setIp(ip);
			        
			        //저장
			        reReaderService.insertReReader(reReaderVO);
					result="REG";
				}
			}else if("N".equals(reReaderVO.getUserFlag())) {
				//탈퇴 수정
				reReaderVO.setUserFlag("Y");
				int cnt = reReaderService.selectCountOneForReReader(reReaderVO);
				if(cnt == 0) {
					result="NOUP";	
				}else {
					reReaderVO.setUserFlag("N");
					reReaderService.updateCancelForReReader(reReaderVO);
					result="UP";					
				}
				
			}			
			model.put("result", result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.setViewName("jsonView");
		return  modelAndView;
	}
}
