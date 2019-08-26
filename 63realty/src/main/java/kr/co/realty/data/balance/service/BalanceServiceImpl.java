package kr.co.realty.data.balance.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.realty.data.balance.dao.BalanceDAO;
import kr.co.realty.data.balance.vo.BalanceVO;
import kr.co.realty.util.SearchVO;


@Service("balanceService")
public class BalanceServiceImpl implements BalanceService {
	
	@Resource(name="balanceDAO")
	private BalanceDAO balanceDAO;

	@Override
	public int selectCountListForBalance(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)balanceDAO.selectOne("balance.selectCountListForBalance",searchVO);
	}
	
	@Override
	public int selectCountOneForBalance(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)balanceDAO.selectOne("balance.selectCountOneForBalance",searchVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BalanceVO> selectListForBalance(SearchVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return balanceDAO.selectList("balance.selectListForBalance", searchVO);
	}

	@Override
	public int insertBalance(BalanceVO balanceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)balanceDAO.insert("balance.insertBalance", balanceVO);
	}
	
	@Override
	public int updateBalance(BalanceVO balanceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)balanceDAO.update("balance.updateBalance", balanceVO);
	}
	
	@Override
	public int deleteBalance(BalanceVO balanceVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)balanceDAO.delete("balance.deleteBalance", balanceVO);
	}

	@Override
	public BalanceVO selectOneForBalance(BalanceVO balanceVO) throws Exception {
		// TODO Auto-generated method stub
		return (BalanceVO)balanceDAO.selectOne("balance.selectOneForBalance",balanceVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BalanceVO> selectListForYearBalance() throws Exception {
		// TODO Auto-generated method stub
		return balanceDAO.selectList("selectListForYearBalance");
	}

}
