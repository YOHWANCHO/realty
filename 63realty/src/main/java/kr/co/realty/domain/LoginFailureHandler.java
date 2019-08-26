package kr.co.realty.domain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import kr.co.realty.data.log.service.LogService;
import kr.co.realty.data.log.vo.AdmLogVO;

public class LoginFailureHandler implements AuthenticationFailureHandler{
	
	@Autowired
	private LogService logService;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null)
        	ip = request.getRemoteAddr();
		
        String admID = request.getParameter("admID");
        AdmLogVO admLogVO= new AdmLogVO();
        admLogVO.setIp(ip);
        admLogVO.setAdmName("");
        admLogVO.setAdmID(admID);
        admLogVO.setLoginYN("N");
		try {
			logService.insertAdminLog(admLogVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("/console/login?error=1");
 	}

}
