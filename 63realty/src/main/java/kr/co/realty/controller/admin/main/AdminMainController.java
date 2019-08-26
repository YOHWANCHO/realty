package kr.co.realty.controller.admin.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.menu.service.MenuService;
import kr.co.realty.data.menu.vo.MenuVO;

@Controller
public class AdminMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@Autowired
	MenuService menuService;
	
	@RequestMapping(value=  "/console/main", method = RequestMethod.GET)
	public String adminMain(Model model, HttpServletRequest request){	
		return "/console/main";
	}
	@RequestMapping(value=  "/console/main/{eCode}", method = RequestMethod.GET)
	public String adminMainComm(Model model, HttpServletRequest request, Authentication authentication, RedirectAttributes redirectAttr, HttpSession httpSession,@PathVariable("eCode") String eCode){
		
		String msg = "";
		if("403".equals(eCode)) {
			msg = "권한이 없습니다.";
		}		
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/console/main";
		
	}

}
