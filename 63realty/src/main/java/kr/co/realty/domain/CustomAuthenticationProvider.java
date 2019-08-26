package kr.co.realty.domain;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.log.service.LogService;
import kr.co.realty.data.security.service.SecurityService;




public class CustomAuthenticationProvider implements AuthenticationProvider{

	@Autowired 
	private SecurityService securityService;

	@Autowired 
	private BCryptPasswordEncoder passwordEncoder;	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		
		String username = authentication.getName(); 
		String password = (String) authentication.getCredentials();
		
		AdminVO admin;
		Collection<? extends GrantedAuthority> authorities;		

		admin = (AdminVO) securityService.loadUserByUsername(username);		
		// 입력한 암호를 암호화 한다. 
		//String bcryptPassword = passwordEncoder.encode(password); 
		// matches 를 이용하여 암호를 비교한다. 
		if ( !passwordEncoder.matches(password, admin.getAdmPW()) ) {
			throw new BadCredentialsException( "암호가 일치하지 않습니다." ); 
		}
		
		

		authorities = admin.getAuthorities();
		return new UsernamePasswordAuthenticationToken(admin, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}

}
