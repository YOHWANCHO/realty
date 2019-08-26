package kr.co.realty.controller.admin.myinfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.realty.data.admin.service.AdminService;
import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.auth.vo.AuthVO;
import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.FileUploadUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class AdminMyinfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMyinfoController.class);
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private AdminService adminService;


	@RequestMapping(value = "/console/myinfo/info", method = RequestMethod.GET)
	public String info(Model model, HttpServletRequest request, Authentication authentication) {
		
		try {
			AdminVO admin = (AdminVO)authentication.getPrincipal();
			admin.setArrEmail(commonUtil.divideEmail(admin.getEmail()));
			admin.setArrMobilenum(commonUtil.divideMobile(admin.getMobilenum()));
			admin.setArrTelnum(commonUtil.divideMobile(admin.getTelnum()));
			model.addAttribute("vo", admin);
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}		
		return "/console/myinfo/infoModify";
	}
	
	@RequestMapping(value = "/console/myinfo/info_modifyAction", method = RequestMethod.POST)
	public String adminModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, AdminVO adminVO,Authentication authentication) {
		
		try {
			
			if(!commonUtil.isNull(adminVO.getAdmPW())) {
				
				if(!commonUtil.checkPassWord(adminVO.getAdmPW())) {
					redirectAttr.addFlashAttribute("msg", "비밀번호는 영문+숫자+특수문자를 포함한 조합문자만 가능합니다.");				
					return "redirect:/console/myinfo/info";
				}
				
				String encodePW = passwordEncoder.encode(adminVO.getAdmPW());
				adminVO.setAdmPW(encodePW);
			}
			adminService.updateAdminMember(adminVO);
			/*
			 * 휴대폰 번호,전화번호,email, 상세주소 암호화
			 */
			
			//사용자 정보 재정의
			AdminVO admin = (AdminVO)authentication.getPrincipal();
			admin.setAdmName(adminVO.getAdmName());			
			admin.setMobilenum(adminVO.getMobilenum());
			admin.setEmail(adminVO.getEmail());
			admin.setTelnum(adminVO.getTelnum());
			admin.setDepartmentName(adminVO.getDepartmentName());			
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/myinfo/info";
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:/console/myinfo/info";
	}
	
	
	
}
