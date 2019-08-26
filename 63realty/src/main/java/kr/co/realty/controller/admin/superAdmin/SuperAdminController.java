package kr.co.realty.controller.admin.superAdmin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.realty.data.admin.service.AdminService;
import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.auth.service.AuthService;
import kr.co.realty.data.auth.vo.AuthVO;
import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.log.service.LogService;
import kr.co.realty.data.log.vo.AdmLogVO;
import kr.co.realty.data.menu.service.MenuService;
import kr.co.realty.data.menu.vo.MenuVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class SuperAdminController {

	private static final Logger logger = LoggerFactory.getLogger(SuperAdminController.class);

	@Autowired
	private MenuService menuService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private AuthService authService;
	@Autowired
	private LogService logService;
	@Autowired
	private CommonUtil commonUtil;
	@Autowired
	private BuildingService buildingService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/console/superAdmin/console", method = RequestMethod.GET)
	public String admin(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {

		try {
			searchVO.setTotalCount(adminService.selectCountListForAdmin(searchVO));
			List<AdminVO> adminList = adminService.selectListForAdmin(searchVO);			
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("adminList", adminList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/superAdmin/adminList";
	}

	@RequestMapping(value = "/console/superAdmin/console_write", method = RequestMethod.GET)
	public String adminWrite(Model model, HttpServletRequest request, RedirectAttributes redirectAttr) {

		try {
			List<MenuVO> menuVO = menuService.selectListForMenu();
			model.addAttribute("menuList", menuVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/superAdmin/adminWrite";
	}

//	@Transactional
	@RequestMapping(value = "/console/superAdmin/console_WriteAction", method = RequestMethod.POST)
	public String adminWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, AdminVO adminVO,AuthVO authVO) {

		try {

			if(!commonUtil.checkPassWord(adminVO.getAdmPW())) {
				redirectAttr.addFlashAttribute("msg", "비밀번호는 영문+숫자+특수문자를 포함한 조합문자만 가능합니다.");				
				return "redirect:/console/superAdmin/console_write";
			}
			
			String encodePW = passwordEncoder.encode(adminVO.getAdmPW());
			adminVO.setAdmPW(encodePW);
			adminService.insertAdminMember(adminVO);
			/*
			 * 휴대폰 번호,전화번호,email, 상세주소 암호화
			 */

			String menuSeqs = authVO.getMenuSeqs();
			if (!commonUtil.isNull(menuSeqs)) {
				String[] arrMenuSeq = menuSeqs.split(",");
				authVO.setAdmID(adminVO.getAdmID());
				for (int i = 0; i < arrMenuSeq.length; i++) {
					authVO.setMenuSeq(Integer.parseInt(arrMenuSeq[i]));
					authService.insertAdminAuth(authVO);
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/superAdmin/console_write";
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:/console/superAdmin/console";
	}
		
	@RequestMapping(value = "/console/superAdmin/console_modify/{admID}", method = RequestMethod.GET)
	public String adminModity(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,AdminVO adminVO, @PathVariable("admID") String admID) {

		try {
			
			AdminVO admin = adminService.selectOneForAdmin(adminVO);
			
			admin.setArrEmail(commonUtil.divideEmail(admin.getEmail()));
			admin.setArrMobilenum(commonUtil.divideMobile(admin.getMobilenum()));
			admin.setArrTelnum(commonUtil.divideMobile(admin.getTelnum()));
			
			adminVO.setAdmID(admID);
			List<MenuVO> menuVO = menuService.selectListForAuthMenuEdit(adminVO);
			model.addAttribute("menuList", menuVO);
			model.addAttribute("vo", admin);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/superAdmin/adminModify";
	}
	
	@RequestMapping(value = "/console/superAdmin/console_delete/{admID}", method = RequestMethod.GET)
	public String adminDelete(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,AdminVO adminVO, @PathVariable("admID") String admID) {
		
		try {
			adminVO.setAdmID(admID);
			adminService.deleteOneForAdmin(adminVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/console/superAdmin/console";
	}
	
//	@Transactional
	@RequestMapping(value = "/console/superAdmin/console_ModifyAction", method = RequestMethod.POST)
	public String adminModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, AdminVO adminVO,AuthVO authVO) {
		
		try {
			
			if(!commonUtil.isNull(adminVO.getAdmPW())) {
				
				if(!commonUtil.checkPassWord(adminVO.getAdmPW())) {
					redirectAttr.addFlashAttribute("msg", "비밀번호는 영문+숫자+특수문자를 포함한 조합문자만 가능합니다.");				
					return "redirect:/console/superAdmin/console_modify/"+adminVO.getAdmID();
				}
				
				String encodePW = passwordEncoder.encode(adminVO.getAdmPW());
				adminVO.setAdmPW(encodePW);
			}
			adminService.updateAdminMember(adminVO);
			/*
			 * 휴대폰 번호,전화번호,email, 상세주소 암호화
			 */
			
			String menuSeqs = authVO.getMenuSeqs();
			if (!commonUtil.isNull(menuSeqs)) {
				String[] arrMenuSeq = menuSeqs.split(",");
				authVO.setAdmID(adminVO.getAdmID());
				authService.deleteAdminAuth(authVO);
				for (int i = 0; i < arrMenuSeq.length; i++) {
					authVO.setMenuSeq(Integer.parseInt(arrMenuSeq[i]));
					authService.insertAdminAuth(authVO);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/superAdmin/console_modify/"+adminVO.getAdmID();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:/console/superAdmin/console/";
	}

	
	/*	  
	 *		슈퍼어드민 관리자 로그 
	 */
	
	@RequestMapping(value = "/console/superAdmin/log_manager", method = RequestMethod.GET)
	public String adminLog(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {

		try {
			searchVO.setPageCount(20);
			searchVO.setTotalCount(logService.selectCountListForAdmLog(searchVO));			
			List<AdmLogVO> list = logService.selectListForAdmLog(searchVO);

			model.addAttribute("searchVO", searchVO);
			model.addAttribute("list", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/superAdmin/logManagerList";
	}
	

}
