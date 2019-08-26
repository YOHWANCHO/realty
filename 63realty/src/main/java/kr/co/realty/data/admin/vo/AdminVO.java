package kr.co.realty.data.admin.vo;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.co.realty.domain.Role;
import lombok.Data;

@Data
public class AdminVO implements UserDetails{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int admSeq;						//관리자 seq
	private String admID;					//관리자 사번
	private String admPW;					//관리자 password
	private String admName;				//관리자 이름
	private String email;					//관리자 이메일
	private String[] arrEmail;					//관리자 이메일
	
	private String departmentName;		//관리자 부서명
	private String telnum;					//관리자 번호
	private String[] arrTelnum;					//관리자 번호
	
	private String mobilenum;				//관리자 모바일 번호
	private String[] arrMobilenum;				//관리자 모바일 번호
	
	private String isUse;					//관리자 사용여부
	private String authority;				//관리자 권한
	private String regDate;					//관리자 등록일
		
	private String username; 
	private String password;
	
	private List<Role> authorities; 
	private boolean accountNonExpired = true; 
	private boolean accountNonLocked = true; 
	private boolean credentialsNonExpired = true; 
	private boolean enabled = true;
	
	@Override 
	public String getUsername() { 
		return username; 
	} 
	
	public void setUsername(String username) { 
		this.username = username; 
	} 
	
	@Override 
	public String getPassword() { 
		return password; 
	} 
	
	public void setPassword(String password) { 
		this.password = password; 
	} 
	
	@Override 
	public Collection<? extends GrantedAuthority> getAuthorities() { 
		return this.authorities; 
	} 
	
	public void setAuthorities(List<Role> authorities) { 
		this.authorities = authorities; 
	}


	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return this.accountNonExpired;
	}
	
	public void setAccountNonExpired(boolean accountNonExpired) { 
		this.accountNonExpired = accountNonExpired; 
	}
	
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return this.accountNonLocked;
	}
	
	public void setAccountNonLocked(boolean accountNonLocked) { 
		this.accountNonLocked = accountNonLocked; 
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return this.credentialsNonExpired;
	}
	
	public void setCredentialsNonExpired(boolean credentialsNonExpired) { 
		this.credentialsNonExpired = credentialsNonExpired; 
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return this.enabled;
	}
	
	public void setEnabled(boolean enabled) { 
		this.enabled = enabled; 
	}
}
