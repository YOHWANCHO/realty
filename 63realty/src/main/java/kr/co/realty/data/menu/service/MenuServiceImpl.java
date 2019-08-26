package kr.co.realty.data.menu.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.menu.dao.MenuDAO;
import kr.co.realty.data.menu.vo.MenuVO;
import kr.co.realty.util.CommonUtil;

@Service("menuService")
public class MenuServiceImpl implements MenuService{
	
	private static final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);

	@Resource(name = "menuDao")
	private MenuDAO menuDao;
	
	@Autowired
	private CommonUtil commonUtil;

	@SuppressWarnings("unchecked")
	@Override
	public List<MenuVO> selectListForAuthMenu(AdminVO adminVo) throws Exception {
		// TODO Auto-generated method stub
		return menuDao.selectList("menu.selectListForAuthMenu", adminVo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MenuVO> selectListForMenu() throws Exception {
		// TODO Auto-generated method stub
		return menuDao.selectList("menu.selectListForMenu");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MenuVO> selectListForAuthMenuEdit(AdminVO adminVo) throws Exception {
		// TODO Auto-generated method stub
		return menuDao.selectList("menu.selectListForAuthMenuEdit", adminVo);
	}
	
	
}
