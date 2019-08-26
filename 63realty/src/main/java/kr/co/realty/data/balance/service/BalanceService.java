package kr.co.realty.data.balance.service;

import java.util.List;

import kr.co.realty.data.balance.vo.BalanceVO;
import kr.co.realty.util.SearchVO;

public interface BalanceService {
	
	public int selectCountListForBalance(SearchVO searchVO) throws Exception;
	public int selectCountOneForBalance(SearchVO searchVO) throws Exception;
	public List<BalanceVO> selectListForBalance(SearchVO searchVO) throws Exception;
	public List<BalanceVO> selectListForYearBalance() throws Exception;
	public int insertBalance(BalanceVO balanceVO) throws Exception;
	public int updateBalance(BalanceVO balanceVO) throws Exception;
	public int deleteBalance(BalanceVO balanceVO) throws Exception;
	public BalanceVO selectOneForBalance(BalanceVO balanceVO) throws Exception;

}
