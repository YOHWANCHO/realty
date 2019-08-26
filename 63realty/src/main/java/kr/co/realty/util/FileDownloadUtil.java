package kr.co.realty.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadUtil extends AbstractView {
	
	private static final Logger logger = LoggerFactory.getLogger(FileDownloadUtil.class);
	
	String localPath;

	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}
	public String getLocalPath() {
		return localPath;
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)	throws Exception {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unchecked")
		Map<String, Object> fileInfo =(Map<String, Object>) model.get("fileInfo"); 
		
		String realFileName = (String) fileInfo.get("realFileName");
		String fileName 	= (String) fileInfo.get("fileName");
		String filePath 	= (String) fileInfo.get("filePath");
		logger.info( "/"+realFileName +"/"+ fileName + "/" + filePath );
		
		File file = new File(localPath+filePath, realFileName);
		
		response.setContentType("application/download; utf-8");
		response.setContentLength((int)file.length());
		
		String userAgent = request.getHeader("User-Agent");
		
		if(userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1) 
		{ 
			fileName = URLEncoder.encode(fileName, "UTF-8");
		}
		else
		{
			fileName = new String(fileName.getBytes("UTF-8"),"8859_1");
		}
	
		response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName +"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
	
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			if (fis != null) 	fis.close();
		}
		out.flush();
	}
	

}

