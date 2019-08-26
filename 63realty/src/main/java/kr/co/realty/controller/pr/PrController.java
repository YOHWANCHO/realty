package kr.co.realty.controller.pr;

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

import kr.co.realty.data.balance.service.BalanceService;
import kr.co.realty.data.balance.vo.BalanceVO;
import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.data.greenhouse.service.GreenHouseService;
import kr.co.realty.data.greenhouse.vo.GreenHouseVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class PrController {
	
	private static final Logger logger = LoggerFactory.getLogger(PrController.class);
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	BalanceService balanceService;
	
	@Autowired
	CommonUtil commonUtil;
	
	@Value("#{conf['file.folder.viewPath']}")
	private String viewPath;
	
	@Autowired
	private GreenHouseService greenHouseService;
		
	@RequestMapping(value= "/pr/performance", method = RequestMethod.GET)
	public String historyList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			
			if(searchVO.getGrYear() == null) {
				searchVO.setGrYear(Integer.parseInt(commonUtil.getTodate("yyyy"))-1);
			}			
			GreenHouseVO greenHouseVO = new GreenHouseVO();
			List<GreenHouseVO> commboYear = greenHouseService.selectListForYearGreenHouse(greenHouseVO);
			
			greenHouseVO.setGrYear(searchVO.getGrYear());
			List<GreenHouseVO> list = greenHouseService.selectListForOneGreenHouse(greenHouseVO);
			int colTco=0;
			int colToe=0;
			for(GreenHouseVO vo : list) {
				if("tot".equals(vo.getColPlace()) && vo.getGrFlag() == 100 ) {
					colTco = vo.getGrOrder()+1;
				}
				if("tot".equals(vo.getColPlace()) && vo.getGrFlag() == 200 ) {
					colToe = vo.getGrOrder()+1;
				}
			}
			
			model.addAttribute("list", list);
			model.addAttribute("commboYear", commboYear);
			model.addAttribute("colTco", colTco);
			model.addAttribute("colToe", colToe);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/performance";
	}	
	
	@RequestMapping(value= "/pr/socialNews_list", method = RequestMethod.GET)
	public String socialNewList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			String [] arrBoardID= {"320","330","335"};
			searchVO.setArrBoardID(arrBoardID);
			searchVO.setUserFlag("USER");
			searchVO.setPageCount(5);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/socialNewsList";
	}
	
	@RequestMapping(value= "/pr/socialNews_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String socialNewsView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
		try {			
			
			BoardVO boardVO = new BoardVO();
			boardVO.setMainBoardSeq(mainBoardSeq);
			boardVO = boardService.selectOneForMainBoard(boardVO);
			
			BoardVO preNext = new BoardVO();
			String [] arrBoardID= {"320","330","335"};
			searchVO.setArrBoardID(arrBoardID);
			searchVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			if (!commonUtil.isNull(boardVO.getShowDate()) && boardVO.getShowDate().length() > 9) {
				searchVO.setShowDate(boardVO.getShowDate().substring(0, 10));
			}
			preNext = boardService.selectOneForMainBoardPreNext(searchVO);
			
			boardService.updateForMainBoardHitCount(boardVO);
			
			model.addAttribute("vo", boardVO);
			model.addAttribute("preNext", preNext);
			model.addAttribute("searchVO", searchVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/socialNewsView";
	}
	@RequestMapping(value= "/pr/social_list", method = RequestMethod.GET)
	public String socialList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(320);
			searchVO.setUserFlag("USER");
			searchVO.setPageCount(5);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/socialList";
	}
	
	@RequestMapping(value= "/pr/social_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String socialView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
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
			
			boardService.updateForMainBoardHitCount(boardVO);
			
			model.addAttribute("vo", boardVO);
			model.addAttribute("preNext", preNext);
			model.addAttribute("searchVO", searchVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/socialView";
	}
	
	
	@RequestMapping(value= "/pr/news_list", method = RequestMethod.GET)
	public String newsList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(330);
			searchVO.setUserFlag("USER");
			searchVO.setPageCount(5);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/newsList";
	}
	
	@RequestMapping(value= "/pr/news_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String newsView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
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
			
			boardService.updateForMainBoardHitCount(boardVO);
						
			model.addAttribute("vo", boardVO);
			model.addAttribute("preNext", preNext);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/newsView";
	}
	@RequestMapping(value= "/pr/etcNews_list", method = RequestMethod.GET)
	public String etcNewsList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(335);
			searchVO.setUserFlag("USER");
			searchVO.setPageCount(5);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/etcNewsList";
	}
	
	@RequestMapping(value= "/pr/etcNews_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String etcNewsView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
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
			
			boardService.updateForMainBoardHitCount(boardVO);
			
			model.addAttribute("vo", boardVO);
			model.addAttribute("preNext", preNext);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/etcNewsView";
	}
	
	@RequestMapping(value= "/pr/office_list", method = RequestMethod.GET)
	public String officeList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(350);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/officeList";
	}
	
	@RequestMapping(value= "/pr/office_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
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
		return "/pr/officeView";
	}
	
	@RequestMapping(value= "/pr/monthly_list", method = RequestMethod.GET)
	public String monthlyList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(360);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/monthlyList";
	}
	
	@RequestMapping(value= "/pr/monthly_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String monthlyView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
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
		return "/pr/monthlyView";
	}
	
	
	
	@RequestMapping(value= "/pr/issue_list", method = RequestMethod.GET)
	public String issueList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(370);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/issueList";
	}
	
	@RequestMapping(value= "/pr/issue_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String issueView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
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
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/issueView";
	}
	
	
	
	@RequestMapping(value= "/pr/daily_list", method = RequestMethod.GET)
	public String dailyList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setBoardID(380);
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/dailyList";
	}
	
	@RequestMapping(value= "/pr/daily_view/{mainBoardSeq}", method = {RequestMethod.GET,RequestMethod.POST})
	public String dailyView(Model model, HttpServletRequest request, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO){	
		
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
		return "/pr/dailyView";
	}

	
	@RequestMapping(value= "/pr/settlement", method = RequestMethod.GET)
	public String settlement(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			
			if(searchVO.getBlYear() == null) {
				searchVO.setBlYear(Integer.parseInt(commonUtil.getTodate("yyyy"))-1);
			}		
			
			List<BalanceVO> commboYear = balanceService.selectListForYearBalance();
			
			BalanceVO balanceVO = new BalanceVO();
			balanceVO.setBlYear(searchVO.getBlYear());
			balanceVO = balanceService.selectOneForBalance(balanceVO);
			
			model.addAttribute("vo", balanceVO);
			model.addAttribute("commboYear", commboYear);			
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/pr/settlement";
	}

}
