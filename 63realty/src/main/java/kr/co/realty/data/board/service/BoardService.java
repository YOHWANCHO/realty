package kr.co.realty.data.board.service;

import java.util.List;

import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.board.vo.BoardVO;
import kr.co.realty.util.SearchVO;

public interface BoardService {
	
	public int selectCountListForBoard(SearchVO searchVO) throws Exception;
	public List<BoardVO> selectListForBoard(SearchVO searchVO) throws Exception;
	
	public int selectCountListForCodeInBoard(SearchVO searchVO) throws Exception;
	public List<BoardVO> selectListForCodeInBoard(SearchVO searchVO) throws Exception;
	public int insertMainBoard(BoardVO boardVO) throws Exception;	
	public int updateMainBoard(BoardVO boardVO) throws Exception;	
	public int insertMainBoardFile(BoardFileVO boardFileVO) throws Exception;
	public BoardVO selectOneForMainBoard(BoardVO boardVO) throws Exception;
	public BoardVO selectOneForMainBoardPreNext(SearchVO searchVO) throws Exception;
	public BoardFileVO selectOneForMainBoardFile(BoardFileVO boardFileVO) throws Exception;
	public BoardFileVO selectOneForMainBoardFileSeq(BoardFileVO boardFileVO) throws Exception;
	public int deleteMainBoard(BoardVO boardVO) throws Exception;
	public int deleteMainBoardFile(BoardFileVO boardFileVO) throws Exception;
	public int deleteMainBoardFileSeq(BoardFileVO boardFileVO) throws Exception;
	public int updateForMainBoardHitCount(BoardVO boardVO) throws Exception;
	
}
