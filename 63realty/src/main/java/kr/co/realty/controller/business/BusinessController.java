package kr.co.realty.controller.business;

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

import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.building.vo.BLDCodeVO;
import kr.co.realty.data.building.vo.BuildingFileVO;
import kr.co.realty.data.building.vo.BuildingVO;
import kr.co.realty.data.oneFile.service.OneFileService;
import kr.co.realty.data.oneFile.vo.OneFileVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.SearchVO;

@Controller
public class BusinessController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
	@Autowired
	BuildingService buildingService;
	
	@Autowired
	CommonUtil commonUtil;
	
	@Autowired
	OneFileService oneFileService;
	
    @Value("#{conf['file.folder.viewPath']}")
	private String viewPath;
	
	@RequestMapping(value= "/business/property_list", method = RequestMethod.GET)
	public String propertyList(Model model, HttpServletRequest request, SearchVO searchVO){	
		
		try {
			searchVO.setPageCount(8);
			searchVO.setBldFlagMg("Y");
			searchVO.setTotalCount(buildingService.selectCountListForBuilding(searchVO));
			List<BuildingVO> list = buildingService.selectListForBuilding(searchVO);
			
			BLDCodeVO bldCodeVO = new BLDCodeVO();
			bldCodeVO.setBldCodeSeq(0);
			List<BLDCodeVO> combo= buildingService.selectListForBLDCode(bldCodeVO);
			
			model.addAttribute("searchVO", searchVO);
			model.addAttribute("combo", combo);			
			model.addAttribute("list", list);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "/business/propertyList";
	}
	@RequestMapping(value= "/business/property_view/{bldInfoSeq}", method = RequestMethod.GET)
	public String propertyView(Model model, HttpServletRequest request, @PathVariable("bldInfoSeq") int bldInfoSeq, SearchVO searchVO){	
		
		try {			
			BuildingVO buildingVO = new BuildingVO();
			buildingVO.setBldInfoSeq(bldInfoSeq);
			buildingVO.setBldFlagMg("Y");
			
			BuildingVO vo = buildingService.selectOneForBuilding(buildingVO);
			vo.setArrBldTelnum(commonUtil.divideMobile(vo.getBldTelnum()));
			
			BuildingFileVO buildingFileVO = new BuildingFileVO();
			buildingFileVO.setBldInfoSeq(buildingVO.getBldInfoSeq());
			buildingFileVO = buildingService.selectOneForBuildingFile(buildingFileVO);
			
			model.addAttribute("vo", vo);
			model.addAttribute("fileVO", buildingFileVO);
			model.addAttribute("viewPath", viewPath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return "/business/propertyView";
	}
	
	@RequestMapping(value= "/business/leasing_guide", method = RequestMethod.GET)
	public String leasingGuide(Model model, HttpServletRequest request, OneFileVO oneFileVO){	
		
		oneFileVO.setBoardID(240);
		
		try{			
			oneFileVO = oneFileService.selectOneFile(oneFileVO);
			model.addAttribute("vo", oneFileVO);					
		}catch(Exception e){
			e.printStackTrace();						
		}
		return "/business/leasingGuide";
	}
	
	
	


}
