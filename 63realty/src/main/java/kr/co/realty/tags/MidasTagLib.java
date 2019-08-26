package kr.co.realty.tags;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.realty.util.CommonUtil;

public class MidasTagLib{
	
	@Autowired
	CommonUtil commonUtil;
	
	public static String parseDateFormat (String pattern ,String date){
		if("".equals(date))
			return "";
			
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date parsedDate = null;
		try{
			if("today".equals(date))		parsedDate = new Date();
			else							parsedDate = sdf.parse(date);
			
		}catch (Exception e ){
			e.printStackTrace();
		}
        return sdf.format(parsedDate);
    }

	public static String parseMoneyFormat (String money) throws ParseException{
		
		if(money!=null && !money.equals("")){
			DecimalFormat df = new DecimalFormat("#,##0");
			double tmp = Double.valueOf(money).doubleValue();
			
	        return df.format(tmp);
		}else{
			return "";
		}
		
    }
	
	public static String textOverflow(String text, Integer length){
		
		if(text.length() > length)
		{
			
			text = text.substring(0, length);
			text += "...";
		}
		
		return text;
    }
	
	public static String nl2br(String string) {
		
		string = (string != null) ? string.replace("\n", "<br/>") : null;
		
        return string;
    }
	
	/*
	 * 날짜 계산
	 * 	begin : 날짜, diffNum : 날짜차이
	 * return "Y" - diffNum 내 날짜차이
	 */
	public static boolean diffDate(String begin, Integer diffNum) throws Exception{
			
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    
	    Date beginDate = formatter.parse(begin);
	    Date toDate = formatter.parse(parseDateFormat("yyyy-MM-dd","today"));
	 
	    long diff = toDate.getTime() - beginDate.getTime();
	    long diffDays = diff / (24 * 60 * 60 * 1000);
	    
	    if(diffNum>=diffDays){
	    	return true;
	    }else{
	    	return false;
	    }
	}
	
	/*
	 * html 태그제거
	 */
	public static String delHtmlTag(String htmlStr) throws Exception{
		
		Pattern tag = Pattern.compile("<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>");
		Matcher mat = tag.matcher(htmlStr);
		return mat.replaceAll("").replaceAll("&nbsp;", "").trim();
		
	}
	
	/*
	 * 1자리 숫자 2자리수 표현 1->01
	 */
	public static String addZero(String num){
		String str = String.format("%02d", Integer.parseInt(num));
//		String str="00";
		return str;
	}
	
	/*
	 * 전화번호, 핸드폰 번호 formatter
	 */
	public static String makePhoneNumber(String num, String mask) {
	    String formatNum = "";
	    if(num == null || "".equals(num)) {
	    	return num;
	    }
	    
	    num = num.replaceAll("-","");

	    if (num.length() == 11) {
	        if (mask.equals("Y")) {
	            formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-****-$3");
	        }else{
	            formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
	        }
	    }else if(num.length()==8){
	        formatNum = num.replaceAll("(\\d{4})(\\d{4})", "$1-$2");
	    }else{
	        if(num.indexOf("02")==0){
	            if(mask.equals("Y")){
	                formatNum = num.replaceAll("(\\d{2})(\\d{3,4})(\\d{4})", "$1-****-$3");
	            }else{
	                formatNum = num.replaceAll("(\\d{2})(\\d{3,4})(\\d{4})", "$1-$2-$3");
	            }
	        }else{
	            if(mask.equals("Y")){
	                formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-****-$3");
	            }else{
	                formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
	            }
	        }
	    }
	    return formatNum;
	}
	
	/*
	 * String 날짜 포맷
	 */
	public static String splitDate(String strDate, String delim) {
		String formatNum = "";
		if(strDate == null || "".equals(strDate)) {
			return strDate;
		}
		
		if(strDate.length() == 8) {
			formatNum = strDate.replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1"+delim+"$2"+delim+"$3");
		}	
		return formatNum;
	}
	
	public static String maskingName(String name) {
		
		if(name==null || "".equals(name)) {
			return name;
		}
		
		String result="";
		for(int i=0; i<name.length(); i++) {
			if(i==0 || i == name.length()-1) {
				result=result+name.charAt(i);
			}else {
				result=result+"*";
			}			
		}
		
		return result;
	}	
}
