package kr.co.realty.controller.common;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.realty.data.board.service.BoardService;
import kr.co.realty.data.board.vo.BoardFileVO;
import kr.co.realty.data.building.service.BuildingService;
import kr.co.realty.data.building.vo.BuildingFileVO;
import kr.co.realty.data.comm.vo.PhotoUploadVO;
import kr.co.realty.data.oneFile.service.OneFileService;
import kr.co.realty.data.oneFile.vo.OneFileVO;
import kr.co.realty.data.voc.service.VocService;
import kr.co.realty.data.voc.vo.CustVoiceFileVO;
import kr.co.realty.util.CommonUtil;
import kr.co.realty.util.Email;
import kr.co.realty.util.FileUploadUtil;
import kr.co.realty.util.TemplateReader;

@Controller
public class CommController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommController.class);
	
	@Value("#{conf['file.folder.editor']}")
    private String proEditorFolder; 
	
    @Value("#{conf['file.folder.viewPath']}")
	private String viewPath;
    
    @Autowired
    private CommonUtil commonUtil;
    
    @Autowired
    private BuildingService buildingService;
    
    @Autowired
    private BoardService boardService;
    
    @Autowired
    private OneFileService oneFileService;
    
    @Autowired
    private FileUploadUtil fileUploadUtil;
    
    @Autowired
	private VocService vocService;

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	@RequestMapping("/comm/photoUpload")
	public String photoUpload(HttpServletRequest request, PhotoUploadVO vo){

		String callback = vo.getCallback();
		String callback_func = vo.getCallback_func();
		String file_result = "";	

//		String resultPath = request.getScheme() + "://" +request.getHeader("Host");
//		logger.info("*** : "+resultPath);		
		List<Map<String,Object>> fileInfo = new ArrayList<Map<String,Object>>();
		String filePath = commonUtil.getFilePath(proEditorFolder);
		try {
			fileInfo = fileUploadUtil.fileUpload(request, filePath );
			if(fileInfo.size() == 0 || fileInfo.size() > 2)
			{
				file_result += "&errstr=error";
			}
			Map<String,Object> v  = fileInfo.get(0);
			String originalFileName	=	(String) v.get("ORIGINAL_FILE_NAME");
			String storedFileName	=	(String) v.get("STORED_FILE_NAME");
//			file_result += "&bNewLine=true&sFileName="+originalFileName+"&sFileURL="+resultPath+viewPath+filePath+storedFileName;
			file_result += "&bNewLine=true&sFileName="+originalFileName+"&sFileURL="+viewPath+filePath+storedFileName;
			
		} catch (Exception e) {
			   file_result += "&errstr=error";
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return "redirect:" + callback + "?callback_func="+callback_func+file_result;		
	}
	
	@RequestMapping("/comm/buildingFileDownload")
	public ModelAndView buildingFileDownload(HttpServletRequest request, BuildingFileVO vo) throws Exception{
		
		vo = buildingService.selectOneForBuildingFile(vo);		
		Map<String,Object> fileInfo = new HashMap<String, Object>();
		fileInfo.put("realFileName", vo.getFileSavenm());
		fileInfo.put("fileName", vo.getFileOrgnm());
		fileInfo.put("filePath", vo.getFilePath());	
		return new ModelAndView("fileDownloadUtil","fileInfo", fileInfo);
	}
	
	@RequestMapping("/comm/mainBoardFileDownload")
	public ModelAndView mainBoardFileDownload(HttpServletRequest request, BoardFileVO vo) throws Exception{
		
		vo = boardService.selectOneForMainBoardFileSeq(vo);		
		Map<String,Object> fileInfo = new HashMap<String, Object>();
		fileInfo.put("realFileName", vo.getFileSavenm());
		fileInfo.put("fileName", vo.getFileOrgnm());
		fileInfo.put("filePath", vo.getFilePath());	
		return new ModelAndView("fileDownloadUtil","fileInfo", fileInfo);
	}
	
	@RequestMapping("/comm/oneFileDownload")
	public ModelAndView oneFileDownload(HttpServletRequest request, OneFileVO vo) throws Exception{
		
		vo = oneFileService.selectOneFile(vo);		
		Map<String,Object> fileInfo = new HashMap<String, Object>();
		fileInfo.put("realFileName", vo.getFileSavenm());
		fileInfo.put("fileName", vo.getFileOrgnm());
		fileInfo.put("filePath", vo.getFilePath());	
		return new ModelAndView("fileDownloadUtil","fileInfo", fileInfo);
	}
	
	@RequestMapping("/comm/vocFileDownload")
	public ModelAndView vocFileDownload(HttpServletRequest request, CustVoiceFileVO custVoiceFileVO) throws Exception{
		
		custVoiceFileVO = vocService.selectOneForCustVoiceFile(custVoiceFileVO);		
		Map<String,Object> fileInfo = new HashMap<String, Object>();
		fileInfo.put("realFileName", custVoiceFileVO.getFileSavenm());
		fileInfo.put("fileName", custVoiceFileVO.getFileOrgnm());
		fileInfo.put("filePath", custVoiceFileVO.getFilePath());	
		return new ModelAndView("fileDownloadUtil","fileInfo", fileInfo);
	}
}
