package kr.co.realty.util;

import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@Component("xmlUtil")
public class XmlUtil {

	
	/**
	 * URL에서 파싱
	 * @param url
	 * @return
	 * @throws Exception
	 */
	public static List<HashMap> xmlParsing(String url) throws Exception{
		
		List<HashMap> rtnList = new ArrayList<HashMap>();
		
		 SimpleDateFormat oldFormat = new SimpleDateFormat("EEE, dd MMMM yyyy HH:mm:ss Z", Locale.ENGLISH);
			SimpleDateFormat newFormat = new SimpleDateFormat("yyyy.MM.dd");
		
		 try{
			 
			 String userAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1;";
			 
			 URLConnection urlConn = null;
			 
			
			 URL rssUrl = new URL(url);
			 urlConn = rssUrl.openConnection();
			 urlConn.setUseCaches(false);
			 urlConn.setRequestProperty("User-Agent", userAgent);
			 
            
			 
			 Document document =DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(urlConn.getInputStream());
			    // xpath 생성
			   XPath  xpath = XPathFactory.newInstance().newXPath();

			   
			   // 파싱 구분자 선택
			   String expression = "//*/item";
				   
			   // 데이터 파싱
			   if(!expression.equals("")){
				   NodeList  cols = (NodeList) xpath.compile(expression).evaluate(document, XPathConstants.NODESET);
				   if(cols.getLength()>0){
					   
					   for( int idx=0; idx<cols.getLength(); idx++ ){
						   
						   NodeList col =cols.item(idx).getChildNodes();
						   HashMap map = new HashMap();
						   
						   // 개수만큼 생성
						   for(int i=0; i<col.getLength(); i++){
							   
							   String temContent = col.item(i).getTextContent().trim();
							   //temContent = temContent.replaceAll("<[^>]*>", ""); //정규식으로 태그 제거
							   //System.out.println(col.item(i).getNodeName()+":::::::"+temContent.trim());
							   
							   if(col.item(i).getNodeName().equals("pubDate")){
								   String pDate = temContent.trim();
									Date parsedDate = oldFormat.parse(pDate);
									map.put(col.item(i).getNodeName(), newFormat.format(parsedDate));
							   }else if(col.item(i).getNodeName().equals("category")){
							   
								   if(map.get("category")!=null){
									   map.put(col.item(i).getNodeName(), map.get("category")+","+temContent.trim());
								   }else{
									   map.put(col.item(i).getNodeName(), temContent.trim());
								   }
								   
							   }else{
								   map.put(col.item(i).getNodeName(), temContent.trim());
							   }
							   
						   }
						   rtnList.add(map);
					   }
					   
				   }else{
					   return null;
				   }
			   }

		   }catch(Exception e){

			   e.printStackTrace();

		   }

		 
		return rtnList;
//		return null;
	}
}
