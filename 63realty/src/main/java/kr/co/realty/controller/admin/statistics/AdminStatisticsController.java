package kr.co.realty.controller.admin.statistics;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.realty.data.log.service.LogService;
import kr.co.realty.data.log.vo.UserLogVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class AdminStatisticsController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminStatisticsController.class);
	
	@Autowired
	private CommonUtil commonUtil;
	
	@Autowired
	private LogService logService;


	@RequestMapping(value = "/console/statistics/visit", method = RequestMethod.GET)
	public String visitList(Model model, HttpServletRequest request, Authentication authentication, SearchVO searchVO) {
		
		try {
			String sDate="";
			String eDate="";
			if(commonUtil.isNull(searchVO.getSearchFromDate()) && commonUtil.isNull(searchVO.getSearchToDate())) {
				eDate = commonUtil.getTodate("yyyyMMdd");
				sDate = commonUtil.getDiffdate("yyyyMMdd", -1);
				searchVO.setIntFromDate(Integer.parseInt(sDate));
				searchVO.setIntToDate(Integer.parseInt(eDate));
				searchVO.setSearchFromDate(sDate.substring(0, 4)+"-"+sDate.substring(4, 6)+"-"+sDate.substring(6, 8));
				searchVO.setSearchToDate(eDate.substring(0, 4)+"-"+eDate.substring(4, 6)+"-"+eDate.substring(6, 8));
			}else {
				sDate = commonUtil.snvl(searchVO.getSearchFromDate().replace("-", ""));
				eDate = commonUtil.snvl(searchVO.getSearchToDate().replace("-", ""));
				searchVO.setIntFromDate(Integer.parseInt(sDate));
				searchVO.setIntToDate(Integer.parseInt(eDate));
			}
			List<UserLogVO> userLogVO = logService.selectListForUserLog(searchVO);
			
			int tot = 0;
			for(UserLogVO vo : userLogVO) {
				tot+=vo.getUserCnt();
				vo.setIntDate(commonUtil.chgDateFormat("yyyyMMdd","yyyy-MM-dd",vo.getIntDate()));
			}
			
			model.addAttribute("list", userLogVO);
			model.addAttribute("tot", tot);
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
		return "/console/statistics/visitList";
	}
	
	@RequestMapping(value = "/console/statistics/visit_excel", method = RequestMethod.GET)
	public String visitExcel(Model model, HttpServletRequest request, SearchVO searchVO, Map<String, Object> modelMap) {
		
		try {
			
			String excelName = "일별 현황("+searchVO.getSearchFromDate()+"~"+searchVO.getSearchToDate()+")";			
			
			List<UserLogVO> userLogVO = logService.selectListForUserLog(searchVO);
			
			int tot = 0;
			for(UserLogVO vo : userLogVO) {
				tot+=vo.getUserCnt();
				vo.setIntDate(commonUtil.chgDateFormat("yyyyMMdd","yyyy-MM-dd",vo.getIntDate()));
			}
			
			List<String> colName1 = new ArrayList<String>();
			colName1.add("일자");
			colName1.add("방문자수");
			
			modelMap.put("excelName", excelName);
			modelMap.put("excelSeet", "통계");
			modelMap.put("colName1", colName1);
			
			modelMap.put("list", userLogVO);
			modelMap.put("tot", tot);
			modelMap.put("searchVO", searchVO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
		}
		return "excelView";
	}
}
