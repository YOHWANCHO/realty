package kr.co.realty.controller.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.data.oneFile.service.OneFileService;
import kr.co.realty.data.oneFile.vo.OneFileVO;
import kr.co.realty.util.SearchVO;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private OneFileService oneFileService;
	
	@Autowired
	private BuildingService buildingService;
	
    @Value("#{conf['file.folder.viewPath']}")
	private String viewPath;
	

	@RequestMapping(value=  {"/","/main","/index"}, method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request){	
		
		try {
			
			//공지사항
			SearchVO searchVO = new SearchVO();
			searchVO.setBoardID(310);
			searchVO.setUserFlag("USER");
			searchVO.setPageCount(3);			
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("noticeList", list);
			
			//임대차 안내문
			OneFileVO oneFileVO  = new OneFileVO();
			oneFileVO.setBoardID(240);
			oneFileVO = oneFileService.selectOneFile(oneFileVO);
			model.addAttribute("oneFileVO", oneFileVO);
			
			//빌딩정보
			searchVO.setPageCount(10000);
			searchVO.setTotalCount(buildingService.selectCountListForBuilding(searchVO));
			searchVO.setBldFlagMg("Y");
			List<BuildingVO> buildingList = buildingService.selectListForBuilding(searchVO);
			model.addAttribute("buildingList", buildingList);
			model.addAttribute("viewPath", viewPath);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "/index";
	}
	
	@RequestMapping(value=  {"/eng","/eng/index"}, method = RequestMethod.GET)
	public String endMain(Model model, HttpServletRequest request){	
		
		try {
			SearchVO searchVO = new SearchVO();
			searchVO.setBoardID(390);
			searchVO.setUserFlag("USER");
			searchVO.setPageCount(3);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("engList", list);
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "/eng/index";
	}


}
