package kr.co.realty.domain;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.log.service.LogService;
import kr.co.realty.data.log.vo.AdmLogVO;
import kr.co.realty.data.menu.service.MenuService;
import kr.co.realty.data.menu.vo.MenuVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	private LogService logService;
	
	@Autowired
	private MenuService menuService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// TODO Auto-generated method stub
				
		String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null)
        	ip = request.getRemoteAddr();
		
        AdminVO adminVO = (AdminVO)authentication.getPrincipal();
        AdmLogVO admLogVO= new AdmLogVO();
        admLogVO.setIp(ip);
        admLogVO.setAdmID(adminVO.getAdmID());
        admLogVO.setAdmName(adminVO.getAdmName());
        admLogVO.setLoginYN("Y");
		try {
			logService.insertAdminLog(admLogVO);
			
			/*
			 * 메뉴권한 세션 저장
			 */
			HttpSession httpSession = request.getSession();
			List<MenuVO> menuVO = menuService.selectListForAuthMenu(adminVO);
			httpSession.setAttribute("menuList", menuVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	response.sendRedirect("/console/main");	
	}
}
