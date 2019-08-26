package kr.co.realty.controller.eng;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.data.oneFile.vo.OneFileVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class EngController {
	
	private static final Logger logger = LoggerFactory.getLogger(EngController.class);
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	CommonUtil commonUtil;
	
	@Value("#{conf['file.folder.viewPath']}")
	private String viewPath;
	
	@RequestMapping(value= "/eng/pr/office_list", method = RequestMethod.GET)
	public String officeList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(390);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/eng/pr/officeList";
	}
	
	@RequestMapping(value= "/eng/pr/office_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String officeView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
		try {			
			BoardVO boardVO = new BoardVO();
			boardVO.setMainBoardSeq(mainBoardSeq);
			boardVO = boardService.selectOneForMainBoard(boardVO);
			
			BoardVO preNext = new BoardVO();
			searchVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			searchVO.setBoardID(boardVO.getBoardID());
			if (!commonUtil.isNull(boardVO.getShowDate()) && boardVO.getShowDate().length() > 9) {
				searchVO.setShowDate(boardVO.getShowDate().substring(0, 10));
			}
			preNext = boardService.selectOneForMainBoardPreNext(searchVO);
			
			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			boardFileVO = boardService.selectOneForMainBoardFile(boardFileVO);
			
			boardService.updateForMainBoardHitCount(boardVO);
			
			model.addAttribute("vo", boardVO);
			model.addAttribute("fileVO", boardFileVO);
			model.addAttribute("preNext", preNext);	
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/eng/pr/officeView";
	}

}
