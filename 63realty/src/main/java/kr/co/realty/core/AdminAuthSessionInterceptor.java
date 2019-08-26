package kr.co.realty.core;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.realty.data.menu.vo.MenuVO;

public class AdminAuthSessionInterceptor extends HandlerInterceptorAdapter{
	
	@SuppressWarnings("unchecked")
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		List<MenuVO> menuList = (List<MenuVO> )request.getSession().getAttribute("menuList");
		
		boolean authFlag = false;
		if (menuList != null) {
			String url = request.getRequestURI();
			for (MenuVO vo : menuList) {
				if(!"1".equals(vo.getLevel())) {
					if(url.indexOf(vo.getMenuUrl())>-1) {
						authFlag = true;
						request.setAttribute("reqUri", request.getRequestURI());
						break;
					}				
				}
			}
		}
		if(!authFlag) {
			response.sendRedirect("/console/main/403");
		}
		return authFlag;
		
	}
}
