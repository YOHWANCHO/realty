package kr.co.realty.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.realty.data.log.service.LogService;
import kr.co.realty.data.log.vo.UserLogVO;
import kr.co.realty.util.CommonUtil;

public class UserLogSessionInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(UserLogSessionInterceptor.class);
	
	@Autowired
	CommonUtil commonUtil;
	
	@Autowired
	LogService logService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
//		logger.info("*********************************************");
//		logger.info("request.getSession().isNew() : "+request.getSession().isNew()+" : "+request.getSession().getAttribute("sessionID"));
//		logger.info("*********************************************");
		
		if(request.getSession().isNew()) {
			
			String sessionID = commonUtil.getTodate("yyyyMMddHHmm")+"_"+request.getSession().getId();
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("sessionID", sessionID);
			
//			logger.info("inside : "+httpSession.isNew());
//			logger.info("inside : "+httpSession.getId());
//			logger.info("inside : "+httpSession.getAttribute("sessionID"));
			
			String ip = request.getHeader("X-FORWARDED-FOR");
	        if (ip == null) ip = request.getRemoteAddr();
	        String refererUrl = request.getHeader("referer");
	        
	        UserLogVO userLogVO = new UserLogVO();
	        userLogVO.setSessionID(sessionID);
	        userLogVO.setIp(ip);
	        userLogVO.setRefererUrl(refererUrl);
	        logService.insertUserLog(userLogVO);
		}
		return true;
	}
}
