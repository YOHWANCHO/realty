package kr.co.realty.controller.admin.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.realty.data.admin.vo.AdminVO;
import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.data.comm.service.CommCodeService;
import kr.co.realty.data.comm.vo.CommCodeVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.FileUploadUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class AdminBoardController {

	private static final Logger logger = LoggerFactory.getLogger(AdminBoardController.class);

	@Autowired
	private CommonUtil commonUtil;

	@Autowired
	private FileUploadUtil fileUploadUtil;

	@Autowired
	private BoardService boardService;

	@Autowired
	private CommCodeService commCodeService;

	@Value("#{conf['file.folder.board']}")
	private String fileFolder;

	@Value("#{conf['file.folder.viewPath']}")
	private String viewPath;

	/**
	 * 공지사항 오피스마켓리포트 월간 리포트 이슈 브리프 부동산 자료실(영문)
	 */
	@RequestMapping(value = { "/console/board/notice", "/console/board/office", "/console/board/monthly",
			"/console/board/issue", "/console/board/dailyReport",
			"/console/board/eng_estate" }, method = RequestMethod.GET)
	public String mainBoardList(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			SearchVO searchVO) {

		try {
			searchVO.setBoardID(commonUtil.getBoardID(request));
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardList1";
	}

	@RequestMapping(value = { "/console/board/notice_write", "/console/board/office_write",
			"/console/board/monthly_write", "/console/board/issue_write", "/console/board/dailyReport_write",
			"/console/board/eng_estate_write" }, method = RequestMethod.GET)
	public String mainBoardWrite(Model model, HttpServletRequest request) {

		try {
			model.addAttribute("today", commonUtil.getTodate("yyyy-MM-dd"));
			model.addAttribute("boardID", commonUtil.getBoardID(request));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardWrite1";
	}

	// @Transactional
	@RequestMapping(value = { "/console/board/notice_writeAction", "/console/board/office_writeAction",
			"/console/board/monthly_writeAction", "/console/board/issue_writeAction",
			"/console/board/dailyReport_writeAction",
			"/console/board/eng_estate_writeAction" }, method = RequestMethod.POST)
	public String mainBoardWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			BoardVO boardVO, Authentication authentication) {

		List<Map<String, Object>> multifileInfo = new ArrayList<Map<String, Object>>();
		String filePath = commonUtil.getFilePath(fileFolder);
		try {
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			boardVO.setRegID(adminVO.getAdmID());			
			boardService.insertMainBoard(boardVO);

			fileUploadUtil.fileType = null;
			multifileInfo = fileUploadUtil.fileUpload(request, filePath);
			for (Map<String, Object> v : multifileInfo) {
				String originalFileName = (String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName = (String) v.get("STORED_FILE_NAME");
				String fileSize = (String) v.get("FILE_SIZE");
				String fileType = (String) v.get("FILE_TYPE");
				String fileFormName = (String) v.get("FORM_NAME");

				BoardFileVO boardFileVO = new BoardFileVO();
				boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
				boardFileVO.setFileType(fileType);
				boardFileVO.setFileOrgnm(originalFileName);
				boardFileVO.setFileSavenm(storedFileName);
				boardFileVO.setFilePath(filePath);
				boardFileVO.setFileSize(fileSize);
				boardFileVO.setFileFormName(fileFormName);
				boardService.insertMainBoardFile(boardFileVO);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_writeAction", "_write");
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_writeAction", "");
	}

	@RequestMapping(value = { "/console/board/notice_view/{mainBoardSeq}", "/console/board/office_view/{mainBoardSeq}",
			"/console/board/monthly_view/{mainBoardSeq}", "/console/board/issue_view/{mainBoardSeq}",
			"/console/board/dailyReport_view/{mainBoardSeq}",
			"/console/board/eng_estate_view/{mainBoardSeq}" }, method = RequestMethod.GET)
	public String mainBoardView(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			@PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO) {

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

			model.addAttribute("vo", boardVO);
			model.addAttribute("fileVO", boardFileVO);
			model.addAttribute("preNext", preNext);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardView1";
	}

	@RequestMapping(value = { "/console/board/notice_modify/{mainBoardSeq}",
			"/console/board/office_modify/{mainBoardSeq}", "/console/board/monthly_modify/{mainBoardSeq}",
			"/console/board/issue_modify/{mainBoardSeq}", "/console/board/dailyReport_modify/{mainBoardSeq}",
			"/console/board/eng_estate_modify/{mainBoardSeq}" }, method = RequestMethod.GET)
	public String mainBoardModify(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			@PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO) {

		try {

			BoardVO boardVO = new BoardVO();
			boardVO.setMainBoardSeq(mainBoardSeq);
			boardVO = boardService.selectOneForMainBoard(boardVO);

			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			boardFileVO = boardService.selectOneForMainBoardFile(boardFileVO);

			model.addAttribute("vo", boardVO);
			model.addAttribute("fileVO", boardFileVO);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardModify1";
	}

	// @Transactional
	@RequestMapping(value = { "/console/board/notice_modifyAction", "/console/board/office_modifyAction",
			"/console/board/monthly_modifyAction", "/console/board/issue_modifyAction",
			"/console/board/dailyReport_modifyAction",
			"/console/board/eng_estate_modifyAction" }, method = RequestMethod.POST)
	public String mainBoardModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			BoardVO boardVO) {

		List<Map<String, Object>> multifileInfo = new ArrayList<Map<String, Object>>();
		String filePath = commonUtil.getFilePath(fileFolder);

		try {			
			int regSeq = boardService.updateMainBoard(boardVO);
			fileUploadUtil.fileType = null;
			multifileInfo = fileUploadUtil.fileUpload(request, filePath);
			for (Map<String, Object> v : multifileInfo) {
				String originalFileName = (String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName = (String) v.get("STORED_FILE_NAME");
				String fileSize = (String) v.get("FILE_SIZE");
				String fileType = (String) v.get("FILE_TYPE");
				String fileFormName = (String) v.get("FORM_NAME");

				BoardFileVO boardFileVO = new BoardFileVO();
				boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
				boardFileVO.setFileType(fileType);
				boardFileVO.setFileOrgnm(originalFileName);
				boardFileVO.setFileSavenm(storedFileName);
				boardFileVO.setFilePath(filePath);
				boardFileVO.setFileSize(fileSize);
				boardFileVO.setFileFormName(fileFormName);
				boardService.insertMainBoardFile(boardFileVO);
			}

		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_modifyAction", "_modify") + "/"
					+ boardVO.getMainBoardSeq();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_modifyAction", "");
	}

	// @Transactional
	@RequestMapping(value = { "/console/board/notice_delete", "/console/board/office_delete",
			"/console/board/monthly_delete", "/console/board/issue_delete", "/console/board/dailyReport_delete",
			"/console/board/eng_estate_delete", "/console/board/faq_delete" }, method = RequestMethod.GET)
	public String mainBoardDeleteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			BoardVO boardVO) {

		BoardFileVO boardFileVO = new BoardFileVO();
		try {
			boardService.deleteMainBoard(boardVO);
			boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			boardFileVO = boardService.selectOneForMainBoardFile(boardFileVO);

			if (boardFileVO != null) {
				fileUploadUtil.uploadedFileDelete(boardFileVO.getFilePath() + boardFileVO.getFileSavenm());
				boardService.deleteMainBoardFile(boardFileVO);
			}

		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "삭제 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_delete", "_modify") + "/"
					+ boardVO.getMainBoardSeq();
		}
		redirectAttr.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_delete", "");
	}

	/**
	 * 공지사항 오피스마켓리포트 월간 리포트 이슈 브리프 부동산 자료실(영문)
	 */
	@RequestMapping(value = { "/console/board/contribution", "/console/board/environment", "/console/board/etcNews" }, method = RequestMethod.GET)
	public String mainBoardList2(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			SearchVO searchVO) {

		try {
			searchVO.setBoardID(commonUtil.getBoardID(request));
			searchVO.setTotalCount(boardService.selectCountListForBoard(searchVO));
			List<BoardVO> list = boardService.selectListForBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardList2";
	}

	@RequestMapping(value = { "/console/board/contribution_write" ,"/console/board/environment_write","/console/board/etcNews_write" }, method = RequestMethod.GET)
	public String mainBoardWrite2(Model model, HttpServletRequest request) {

		try {
			model.addAttribute("today", commonUtil.getTodate("yyyy-MM-dd"));
			model.addAttribute("boardID", commonUtil.getBoardID(request));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardWrite2";
	}

	// @Transactional
	@RequestMapping(value = { "/console/board/contribution_writeAction","/console/board/environment_writeAction", "/console/board/etcNews_writeAction" }, method = RequestMethod.POST)
	public String mainBoardWriteAction2(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BoardVO boardVO, Authentication authentication) {

		List<Map<String, Object>> multifileInfo = new ArrayList<Map<String, Object>>();
		String filePath = commonUtil.getFilePath(fileFolder);
		try {
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			boardVO.setRegID(adminVO.getAdmID());			
			boardService.insertMainBoard(boardVO);

			fileUploadUtil.fileType = new String[] { "IMAGE" };
			multifileInfo = fileUploadUtil.fileUpload(request, filePath);
			for (Map<String, Object> v : multifileInfo) {
				String originalFileName = (String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName = (String) v.get("STORED_FILE_NAME");
				String fileSize = (String) v.get("FILE_SIZE");
				String fileType = (String) v.get("FILE_TYPE");
				String fileFormName = (String) v.get("FORM_NAME");

				BoardFileVO boardFileVO = new BoardFileVO();
				boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
				boardFileVO.setFileType(fileType);
				boardFileVO.setFileOrgnm(originalFileName);
				boardFileVO.setFileSavenm(storedFileName);
				boardFileVO.setFilePath(filePath);
				boardFileVO.setFileSize(fileSize);
				boardFileVO.setFileFormName(fileFormName);
				boardService.insertMainBoardFile(boardFileVO);
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_writeAction", "_write");
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_writeAction", "");
	}

	@RequestMapping(value = { "/console/board/contribution_view/{mainBoardSeq}", "/console/board/environment_view/{mainBoardSeq}", "/console/board/etcNews_view/{mainBoardSeq}" }, method = RequestMethod.GET)
	public String mainBoardView2(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO) {

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

			model.addAttribute("vo", boardVO);
			model.addAttribute("fileVO", boardFileVO);
			model.addAttribute("preNext", preNext);
			model.addAttribute("viewPath", viewPath);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardView2";
	}

	@RequestMapping(value = { "/console/board/contribution_modify/{mainBoardSeq}", "/console/board/environment_modify/{mainBoardSeq}", "/console/board/etcNews_modify/{mainBoardSeq}"}, method = RequestMethod.GET)
	public String mainBoardModify2(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, @PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO) {

		try {

			BoardVO boardVO = new BoardVO();
			boardVO.setMainBoardSeq(mainBoardSeq);
			boardVO = boardService.selectOneForMainBoard(boardVO);

			BoardFileVO boardFileVO = new BoardFileVO();
			boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			boardFileVO = boardService.selectOneForMainBoardFile(boardFileVO);

			model.addAttribute("vo", boardVO);
			model.addAttribute("fileVO", boardFileVO);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/boardModify2";
	}

	// @Transactional
	@RequestMapping(value = { "/console/board/contribution_modifyAction", "/console/board/environment_modifyAction", "/console/board/etcNews_modifyAction"}, method = RequestMethod.POST)
	public String mainBoardModifyAction2(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BoardVO boardVO, Authentication authentication) {

		List<Map<String, Object>> multifileInfo = new ArrayList<Map<String, Object>>();
		String filePath = commonUtil.getFilePath(fileFolder);

		try {			
			int regSeq = boardService.updateMainBoard(boardVO);

			fileUploadUtil.fileType = new String[] { "IMAGE" };
			multifileInfo = fileUploadUtil.fileUpload(request, filePath);
			for (Map<String, Object> v : multifileInfo) {
				String originalFileName = (String) v.get("ORIGINAL_FILE_NAME");
				String storedFileName = (String) v.get("STORED_FILE_NAME");
				String fileSize = (String) v.get("FILE_SIZE");
				String fileType = (String) v.get("FILE_TYPE");
				String fileFormName = (String) v.get("FORM_NAME");

				BoardFileVO boardFileVO = new BoardFileVO();
				boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
				boardFileVO.setFileType(fileType);
				boardFileVO.setFileOrgnm(originalFileName);
				boardFileVO.setFileSavenm(storedFileName);
				boardFileVO.setFilePath(filePath);
				boardFileVO.setFileSize(fileSize);
				boardFileVO.setFileFormName(fileFormName);
				boardService.insertMainBoardFile(boardFileVO);
			}

		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_modifyAction", "_modify") + "/"
					+ boardVO.getMainBoardSeq();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_modifyAction", "");
	}

	@Transactional
	@RequestMapping(value = { "/console/board/contribution_delete", "/console/board/environment_delete", "/console/board/etcNews_delete"}, method = RequestMethod.GET)
	public String mainBoardDeleteAction2(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, BoardVO boardVO, Authentication authentication) {

		BoardFileVO boardFileVO = new BoardFileVO();
		try {
			boardService.deleteMainBoard(boardVO);
			boardFileVO.setMainBoardSeq(boardVO.getMainBoardSeq());
			boardFileVO = boardService.selectOneForMainBoardFile(boardFileVO);

			if (boardFileVO != null) {
				fileUploadUtil.uploadedFileDelete(boardFileVO.getFilePath() + boardFileVO.getFileSavenm());
				boardService.deleteMainBoardFile(boardFileVO);
			}

		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "삭제 실패하였습니다.");
			e.printStackTrace();
			return "redirect:" + request.getRequestURI().replace("_delete", "_modify") + "/"
					+ boardVO.getMainBoardSeq();
		}
		redirectAttr.addFlashAttribute("msg", "삭제 되었습니다.");
		return "redirect:" + request.getRequestURI().replace("_delete", "");
	}

	/**
	 * 자주하는 질문
	 */
	@RequestMapping(value = "/console/board/faq", method = RequestMethod.GET)
	public String faqList(Model model, HttpServletRequest request, RedirectAttributes redirectAttr, SearchVO searchVO) {

		try {
			CommCodeVO commCodeVO = new CommCodeVO();
			commCodeVO.setPCodeSeq(10);
			List<CommCodeVO> commList = commCodeService.selectListForCommCode(commCodeVO);

			searchVO.setBoardID(commonUtil.getBoardID(request));
			searchVO.setTotalCount(boardService.selectCountListForCodeInBoard(searchVO));
			List<BoardVO> list = boardService.selectListForCodeInBoard(searchVO);
			model.addAttribute("list", list);
			model.addAttribute("commList", commList);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/faqList";
	}

	@RequestMapping(value = "/console/board/faq_write", method = RequestMethod.GET)
	public String faqWrite(Model model, HttpServletRequest request) {

		try {
			CommCodeVO commCodeVO = new CommCodeVO();
			commCodeVO.setPCodeSeq(10);
			List<CommCodeVO> commList = commCodeService.selectListForCommCode(commCodeVO);
			model.addAttribute("commList", commList);
			model.addAttribute("boardID", commonUtil.getBoardID(request));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/faqWrite";
	}

	@RequestMapping(value = "/console/board/faq_writeAction", method = RequestMethod.POST)
	public String faqWriteAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			BoardVO boardVO, Authentication authentication) {

		try {
			AdminVO adminVO = (AdminVO) authentication.getPrincipal();
			boardVO.setRegID(adminVO.getAdmID());
			boardService.insertMainBoard(boardVO);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			redirectAttr.addFlashAttribute("msg", "저장 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/board/faq_write";
		}
		redirectAttr.addFlashAttribute("msg", "저장되었습니다.");
		return "redirect:/console/board/faq";
	}

	@RequestMapping(value = "/console/board/faq_modify/{mainBoardSeq}", method = RequestMethod.GET)
	public String faqModify(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			@PathVariable("mainBoardSeq") int mainBoardSeq, SearchVO searchVO) {

		try {

			CommCodeVO commCodeVO = new CommCodeVO();
			commCodeVO.setPCodeSeq(10);
			List<CommCodeVO> commList = commCodeService.selectListForCommCode(commCodeVO);

			BoardVO boardVO = new BoardVO();
			boardVO.setMainBoardSeq(mainBoardSeq);
			boardVO = boardService.selectOneForMainBoard(boardVO);

			model.addAttribute("vo", boardVO);
			model.addAttribute("commList", commList);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/console/board/faqModify";
	}

	// @Transactional
	@RequestMapping(value = "/console/board/faq_modifyAction", method = RequestMethod.POST)
	public String faqModifyAction(Model model, HttpServletRequest request, RedirectAttributes redirectAttr,
			BoardVO boardVO, Authentication authentication) {

		try {
			int regSeq = boardService.updateMainBoard(boardVO);
		} catch (Exception e) {
			// TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			redirectAttr.addFlashAttribute("msg", "수정 실패하였습니다.");
			e.printStackTrace();
			return "redirect:/console/board/faq_modify/" + boardVO.getMainBoardSeq();
		}
		redirectAttr.addFlashAttribute("msg", "수정되었습니다.");
		return "redirect:/console/board/faq";
	}
}
