package kr.co.realty.data.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.board.dao.BoardDAO;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.util.SearchVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;

	@Override
	public int selectCountListForBoard(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)boardDAO.selectOne("board.selectCountListForBoard", searchVO);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BoardVO> selectListForBoard(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectList("board.selectListForBoard", searchVO); 
	}
	
	@Override
	public int selectCountListForCodeInBoard(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)boardDAO.selectOne("board.selectCountListForCodeInBoard", searchVO);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BoardVO> selectListForCodeInBoard(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectList("board.selectListForCodeInBoard", searchVO); 
	}

	@Override
	public int insertMainBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) boardDAO.insert("board.insertMainBoard", boardVO);
	}

	@Override
	public int updateMainBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)boardDAO.update("board.updateMainBoard", boardVO);
	}

	@Override
	public int insertMainBoardFile(BoardFileVO boardFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)boardDAO.insert("board.insertMainBoardFile", boardFileVO);
	}

	@Override
	public BoardVO selectOneForMainBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return (BoardVO)boardDAO.selectOne("board.selectOneForMainBoard", boardVO);
	}
	
	@Override
	public BoardVO selectOneForMainBoardPreNext(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (BoardVO)boardDAO.selectOne("board.selectOneForMainBoardPreNext", searchVO);
	}

	@Override
	public BoardFileVO selectOneForMainBoardFile(BoardFileVO boardFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (BoardFileVO)boardDAO.selectOne("board.selectOneForMainBoardFile", boardFileVO);
	}
	@Override
	public BoardFileVO selectOneForMainBoardFileSeq(BoardFileVO boardFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (BoardFileVO)boardDAO.selectOne("board.selectOneForMainBoardFileSeq", boardFileVO);
	}

	@Override
	public int deleteMainBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) boardDAO.delete("board.deleteMainBoard", boardVO);
	}
	@Override
	public int deleteMainBoardFile(BoardFileVO boardFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) boardDAO.delete("board.deleteMainBoardFile", boardFileVO);
	}
	
	@Override
	public int deleteMainBoardFileSeq(BoardFileVO boardFileVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) boardDAO.delete("board.deleteMainBoardFileSeq", boardFileVO);
	}

	@Override
	public int updateForMainBoardHitCount(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) boardDAO.update("board.updateForMainBoardHitCount", boardVO);
	}
}
