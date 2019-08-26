package kr.co.realty.data.menu.service;

import java.util.List;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.menu.vo.MenuVO;

public interface MenuService {
	
	public List<MenuVO> selectListForAuthMenu(AdminVO adminVo) throws Exception;
	public List<MenuVO> selectListForAuthMenuEdit(AdminVO adminVo) throws Exception;
	public List<MenuVO> selectListForMenu() throws Exception;

}
