package kr.co.realty.controller.admin.login;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminLoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminLoginController.class);
	
	@RequestMapping(value= "/console", method = RequestMethod.GET)
	public String adminDefaultLogin(Model model, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {
		return "redirect:/console/login";
	}
	
	@RequestMapping(value=  "/console/login", method = RequestMethod.GET)
	public String adminLogin(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,  Authentication authentication) throws Exception {
	
		//세션이 있을 경우 메인으로
		if(null != authentication) {
			return "redirect:/console/main";			
		}		
		
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null)
        	ip = request.getRemoteAddr();
         
        model.addAttribute("clientIp", ip);
		return "/console/login";
	}
	
	@RequestMapping(value=  "/console/loginAction", method = RequestMethod.POST)
	public void adminLoginAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {
	}
	@RequestMapping(value=  "/console/logout", method = RequestMethod.POST)
	public void adminLoginOutAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {		
	}
}
