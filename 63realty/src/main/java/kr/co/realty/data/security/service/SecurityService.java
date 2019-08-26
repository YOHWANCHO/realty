package kr.co.realty.data.security.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.realty.data.admin.service.AdminService;
import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.login.service.AdminLoginService;
import kr.co.realty.domain.Role;
import kr.co.realty.util.CommonUtil;

@Service("securityService")
public class SecurityService implements UserDetailsService{
	
	private static final Logger logger = LoggerFactory.getLogger(SecurityService.class);
	
	@Autowired
	private AdminLoginService adminLoginService;
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("username : " + username); // 회원 정보 dao 에서 데이터를 읽어 옴. 
		// test 값을 암호화함. 
		AdminVO adminVo = new AdminVO();
		adminVo.setAdmID(username);
		try {
			adminVo = adminLoginService.selectOneForLogin(adminVo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new UsernameNotFoundException("접속자 정보를 찾을 수 없습니다.");
		}
		if (null==adminVo || "".equals(commonUtil.nvl(adminVo.getAdmID())) || "".equals(commonUtil.nvl(adminVo.getAuthority()))) {
 			throw new UsernameNotFoundException("접속자 정보를 찾을 수 없습니다."); 
		}		

		Role role = new Role(); 
		role.setName(adminVo.getAuthority()); 
		List<Role> roles = new ArrayList<Role>(); 
		roles.add(role); 
		adminVo.setAuthorities(roles); // 만약 데이터가 없을 경우 익셉션 
		return adminVo;
	}

}
