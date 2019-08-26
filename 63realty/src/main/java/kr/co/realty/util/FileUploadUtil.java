package kr.co.realty.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploadUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);
 // filetype = new String( "",);
	int seq=0;
	String localPath = null;
	public String[] fileType = null;
	public boolean isRename = true;

	public void setLocalPath(String localPath) {
		this.localPath = localPath;
	}
	public String getLocalPath() {
		return localPath;
	}
	
	private String _getRandomString(){

		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyyMMddHHmmssSSS", Locale.KOREA );
		String name= sdf.format(new Date());

		return name+String.format("%03d", ++seq);
	}
	
	private boolean _checkFileType( String fileExtension)
	{
		if(fileExtension == null)
			return true;
		
		for(String t : fileType)
		{
			switch(t)
			{
				case "IMAGE":
					if((   
							".JPG".equals(fileExtension.toUpperCase()) 
							|| ".JPEG".equals(fileExtension.toUpperCase()) 
							|| ".PNG".equals(fileExtension.toUpperCase())
							|| ".BMP".equals(fileExtension.toUpperCase())
							|| ".GIF".equals(fileExtension.toUpperCase())
					))
					{
						return true;
					}
					break;
				case "VIDEO":
					if((   
							".MP4".equals(fileExtension.toUpperCase()) 
							|| ".MP3".equals(fileExtension.toUpperCase())
					))
					{
						return true;
					}
					
				case "EXCEL":
					if((   
							".XLS".equals(fileExtension.toUpperCase()) 
							|| ".XLSX".equals(fileExtension.toUpperCase())
							))
					{
						return true;
					}
					
				case "PDF":
					if(".PDF".equals(fileExtension.toUpperCase())){
						return true;
					}
					
				case "FILE":					
						return true;					
					
			}
		}
		return false;
	}
	
	private String getFileType(String extention){
		
		if((   
				".JPG".equals(extention.toUpperCase()) 
				|| ".JPEG".equals(extention.toUpperCase()) 
				|| ".PNG".equals(extention.toUpperCase())
		))
		{
			return "IMG";
		}else if((   
				".MP4".equals(extention.toUpperCase()) 
				|| ".MP3".equals(extention.toUpperCase())
		))
		{
			return "MOV";
		}else{
			return "ETC";
		}
		
		
				
	}
	
	public void uploadedFileDelete(String fileName){
		
		File file = new File(localPath+fileName);
		if(file.exists() == true){
			file.delete();
		}
	}
	
	public Map<String,Object> fileUpload(HttpServletRequest request,  String folderName, String inputName) throws Exception{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		MultipartFile multipartFile = multipartHttpServletRequest.getFile(inputName);
		
		if(multipartFile != null && multipartFile.isEmpty() == false){
			
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = null;
			
			String filePath = localPath + folderName;
			inputName 		= multipartFile.getName();
			originalFileName = multipartFile.getOriginalFilename();
			originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
						
			if(fileType != null)
			{
				if(_checkFileType( originalFileExtension ) == false)
				{
					logger.info("file Extension error: " + originalFileName);
					fileType = null;
					return null;
				}
				fileType = null;
			}
			
			
			File file = new File(filePath);
			if(file.exists() == false){
			    file.mkdirs();
			}
			
			if(isRename == true)
				storedFileName = _getRandomString() + originalFileExtension;
			else 
				storedFileName =  originalFileName;
				
			file = new File(filePath + storedFileName);
			while(file.exists() == true)
			{
				storedFileName = _getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
			}
			
			multipartFile.transferTo(file);
			logger.info("UPLODAD:" + filePath + storedFileName);
			Map<String, Object> fileInfoMap = new HashMap<String,Object>();
			fileInfoMap.put("INPUT_TYPE_NAME", inputName);
			fileInfoMap.put("ORIGINAL_FILE_NAME", originalFileName);
			fileInfoMap.put("STORED_FILE_NAME", storedFileName);
			fileInfoMap.put("FILE_SIZE", String.valueOf(multipartFile.getSize()));
			fileInfoMap.put("FILE_TYPE", getFileType(originalFileExtension));
			
			return fileInfoMap;
		}
		
		return null;
	}
	
	public List<Map<String,Object>> fileUpload(HttpServletRequest request,  String folderName ) throws Exception{
		
	       MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	       Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	        
	       MultipartFile multipartFile = null;
	       String inputName = null;
	       String originalFileName = null;
	       String originalFileExtension = null;
	       String storedFileName = null;
	       String filePath = localPath + folderName;
	        
	       List<Map<String,Object>> fileInfo = new ArrayList<Map<String,Object>>();
	       
	       File file = new File(filePath);
	       if(file.exists() == false){
	           file.mkdirs();
	       }
	        
	       while(iterator.hasNext()){
	           multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	           if(multipartFile.isEmpty() == false){
	        	   inputName 		= multipartFile.getName();
	               originalFileName = multipartFile.getOriginalFilename();
	               originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	               
	               
	               if(fileType != null)
	             	{
	             		if(_checkFileType( originalFileExtension ) == false)
	             		{
	             			logger.info("file Extension error: " + originalFileName);
	             			return null;
	             		}
	             	}
	               
	               if(isRename == true)
	             		storedFileName = _getRandomString() + originalFileExtension;
	               else 
	             		storedFileName =  originalFileName;
	                
	               file = new File(filePath + storedFileName);	               
	               multipartFile.transferTo(file);
	               Map<String, Object> fileInfoMap = new HashMap<String,Object>();
	               fileInfoMap.put("FORM_NAME", inputName);
	               fileInfoMap.put("ORIGINAL_FILE_NAME", originalFileName);
	               fileInfoMap.put("STORED_FILE_NAME", storedFileName);
	               fileInfoMap.put("FILE_TYPE", getFileType(originalFileExtension));
	               fileInfoMap.put("FILE_SIZE", String.valueOf(multipartFile.getSize()));
	               fileInfoMap.put("FILE_PATH",filePath);
	               fileInfo.add(fileInfoMap);
	           }
	       }
	       return fileInfo;
	   }
	
	//제외되는 파일이 있는 업로드
	public List<Map<String,Object>> exMultiFileUpload(HttpServletRequest request,  String folderName, String excludeName) throws Exception{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String inputName = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String filePath = localPath + folderName;
		
		List<Map<String,Object>> fileInfo = new ArrayList<Map<String,Object>>();
		
		File file = new File(filePath);
		if(file.exists() == false){
			file.mkdirs();
		}
		
		while(iterator.hasNext()){
			String saveFileInput = iterator.next();
			multipartFile = multipartHttpServletRequest.getFile(saveFileInput);
			if(multipartFile.isEmpty() == false){
				if(!excludeName.equals(saveFileInput)){		//제외되는 파일명
					inputName 		= multipartFile.getName();
					originalFileName = multipartFile.getOriginalFilename();
					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
					
					
//					if(fileType.size()>0)
//					{
//						if(_checkFileType( originalFileExtension ) == false)
//						{
//							System.out.println("file Extension error: " + originalFileName);
//							return null;
//						}
//					}
					
					if(isRename == true)
						storedFileName = _getRandomString() + originalFileExtension;
					else 
						storedFileName =  originalFileName;
					
					file = new File(filePath + storedFileName);					
					multipartFile.transferTo(file);
					Map<String, Object> fileInfoMap = new HashMap<String,Object>();
					fileInfoMap.put("FORM_NAME", inputName);
					fileInfoMap.put("ORIGINAL_FILE_NAME", originalFileName);
					fileInfoMap.put("STORED_FILE_NAME", storedFileName);
					fileInfoMap.put("FILE_SIZE", String.valueOf(multipartFile.getSize()));
					fileInfoMap.put("FILE_TYPE", getFileType(originalFileExtension));
					fileInfo.add(fileInfoMap);
				}
			}
		}
		return fileInfo;
	}
}
