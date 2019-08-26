package kr.co.realty.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import kr.co.realty.data.menu.vo.MenuVO;
import kr.co.realty.tags.MidasTagLib;

@Component("commonUtil")
public class CommonUtil {
		
	/**
	 * 현재 날짜시간 구함
	 * param : String format 'yyyyMMddHHmmss'
	 */
	public String getTodate(String format){
		Calendar cl = Calendar.getInstance();
		long ut = cl.getTimeInMillis();
		DateFormat df = new SimpleDateFormat(format);
		String ll = df.format(ut);		
		return ll;
	}
	
	/**
	 * 오늘과 월 차이를 구함
	 * param : String format 'yyyyMMddHHmmss' , int month -1
	 */
	public String getDiffdate(String format, int month){
		Calendar cl = Calendar.getInstance();
		cl.add(Calendar.MONTH, month);
		long ut = cl.getTimeInMillis();
		DateFormat df = new SimpleDateFormat(format);
		String ll = df.format(ut);		
		return ll;
	}
	
	/**
	 * 날짜 형식 변경
	 * param : String format, String chgFormat ,String strDate
	 */
	public String chgDateFormat(String format, String chgFormat ,String strDate) {
		
		String result="";		
		try {
			Date date = new SimpleDateFormat(format).parse(strDate);
			SimpleDateFormat chgDt = new SimpleDateFormat(chgFormat);
			result = chgDt.format(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 날짜 형식 변경
	 * param : String format, String strDate
	 */
	public String chgDateFormat(String format, String strDate) {
		
		if("".equals(strDate))
			return "";
			
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date parsedDate = null;
		try{
			if("today".equals(strDate))		parsedDate = new Date();
			else							parsedDate = sdf.parse(strDate);
			
		}catch (Exception e ){
			e.printStackTrace();
		}
        return sdf.format(parsedDate);
	}
	
	public String getFilePath(String selFolder){
		
//		String selFolder = getProperties(key);
		return selFolder+getTodate("yyyy")+"/"+getTodate("MM")+"/";
	}

	public void setCookie(HttpServletResponse response, String key, String value){
		Cookie c = new Cookie(key,value);
		c.setMaxAge(60*60*24*7);
		response.addCookie(c);
	}
	
	public String getCookie(HttpServletRequest request, String key){
	    Cookie[] cookies = request.getCookies();
	    String result="";
	    if(cookies != null){
	    	for(int i=0; i<cookies.length; i++){
	    		Cookie c = cookies[i];
	    		if(key.equals(c.getName())){
	    			result = c.getValue();
	    		}
	    	}
	    }
	    return result;
	}
	
	public void deleteCookie(HttpServletResponse response, String key){
	    Cookie kc = new Cookie(key, null) ;
	    kc.setMaxAge(0) ;
	    response.addCookie(kc) ;
	}
	
    /**
     * 최대 길이 수보다 큰 문자열인 경우에 뒷부분을 "..."로 변환한다.<br><br>
     *
     * @param text  주어진 문자열
     * @param maxLength  최대 문자열 길이
     * @return String 처리된 문자열
     */
    public String textMore(String text, int maxLength) {
        String value = "";
        if( text ==  null) return null;
        if( text.length() <= (maxLength+3) ) return text;
        value = text.substring(0,maxLength) + "...";
        return value;
    }

    /**
     * @param str     문자열
     * @param delim   제거할 문자
     * @return String 특정값이 제거된 문자열
     */
    public String remove(String str, String delim) {
        StringBuffer    sb = new StringBuffer();              // 리턴할 문자열 버퍼
        StringTokenizer st = new StringTokenizer(str, delim); // 지정된 값으로 문자열을 자른다.

        while (st.hasMoreTokens()) {
                sb.append(st.nextToken());
             }

        return sb.toString();
    }
     /**
     * 문자열이 null인지 판별하여 null이면 defaultValue를 리턴하고
     * 아니면 원 문자열을 그대로 리턴한다.<br><br>
     *
     * @param  str 문자열
     * @param  defaultValue 디폴트값
     * @return String 치환된 문자열
     */
   public String nvl(String str, String defaultValue) {
                if( str == null )
                        return defaultValue;
                else
                        return str;
    }


     /**
     * 문자열이 null인지 판별하여 null이면 defaultValue를 리턴하고
     * 아니면 원 문자열을 그대로 리턴한다.<br><br>
     *
     * @param  str 문자열
     * @param  defaultValue 디폴트값
     * @return String 치환된 문자열
     */
   public String envl(String str, String defaultValue) {
                if( str == null ) {
                        return defaultValue;
                } else if (str.equals(""))     {
                        return defaultValue;
                } else {
                        return str;
                }
    }
   /**
    *null 이면 0 리턴  
    */   
    public String snvl(String str) {
                 if( str == null ) {
                         return "0";
                 } else if (str.equals(""))     {
                         return "0";
                 } else {
                         return str;
                 }
     }
    
    
    /**
     * 문자열이 null인지 판별하여 true,false 리턴    
     */    
	public boolean isNull(String str) {
		return (str == null || (str.trim().length()) == 0 );
	}

	public boolean isNull(Object obj) {
		String str = null;
		if( obj instanceof String ) {
			str = (String)obj;
		} else {
			return true;
		}
			return isNull(str);
	}


    

     /**
     * 문자열이 null인지 판별하여 null이면 ""를 리턴하고
     * 아니면 원 문자열을 그대로 리턴한다.<br><br>
         *
     * @param  str 문자열
     * @param  defaultValue 디폴트값
     * @return String 치환된 문자열
     */
   public String nvl(String str) {
                return nvl(str,"");
    }

     /**
     * 문자열이 empty_value_string 인지 판별하여 empty_value_string 이면 defaultValue를 리턴하고
     * 아니면 원 문자열을 그대로 리턴한다.<br><br>
         *
     * @param  str 문자열
     * @param  defaultValue 디폴트값
     * @return String 치환된 문자열
     */
   public String evl(String str, String defaultValue) {
                if( str.trim().length() == 0 )
                        return defaultValue;
                else
                        return str;
    }
   
   /**
    * 문자열이 empty_value_string 인지 판별하여 empty_value_string 이면 ""를 리턴하고
    * 아니면 원 문자열을 그대로 리턴한다.<br><br>
    *
    * @param  str 문자열
    * @return String 치환된 문자열
    */
   public String evl(String str) {
	   return evl(str,"");
   }

	/****************************************
	 * \n 을 <br>로 바꾼다.
	 * @param String
	 * @return String 치환된 문자열
	*****************************************/
		public String repl(String text)
		{
		        if( text == null || text.equals("") )
		        return "";
		
		        StringBuffer sb = new StringBuffer(text);
		        char ch;
		
		        for (int i = 0; i < sb.length(); i++) {
		                ch = sb.charAt(i);
		            if (ch == '\r' && sb.charAt(i+1) == '\n' )
		            {
		                    sb.replace(i,i+2,"<br>");
		                    i += 3;
		            }
		        }
		        return sb.toString();
		}		
		
	
		
		public boolean isMobile(HttpServletRequest request){
			String userAgent = request.getHeader("user-agent");
			boolean mobile1 = userAgent.matches(".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
			boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*");
			if(mobile1 || mobile2){
				return true;
			}
			return false;
		}
		
		
	//이메일 @ 분리	
	public String[] divideEmail(String email) {		
		String [] arrEmail = {"",""};
		if(!isNull(email)) {
			arrEmail = email.split("@");			
		}
		return arrEmail;
	}
	
	//전화번호 '-'로 분리
	public String[] divideMobile(String num) {
		
		String[] arrPhoneNum= new String[3];
		
		if(!isNull(num)) {				
			String mobileNum = MidasTagLib.makePhoneNumber(num,"N");			
			arrPhoneNum = mobileNum.split("-");
		}else {
			arrPhoneNum[0]="";
			arrPhoneNum[1]="";
			arrPhoneNum[2]="";
		}
		return arrPhoneNum;
	}
	
	//패스워드 체크
	public boolean checkPassWord(String pw) {		
		boolean pwPattern;	
		//문자, 숫자, 특수문자의 조합인지 확인
		Pattern p = Pattern.compile("([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])");
		Matcher m = p.matcher(pw);
		if (m.find()){
			pwPattern = true;
		}else{
			pwPattern = false;
		}
		return pwPattern;
	}	
	
	@SuppressWarnings("unchecked")
	public int getBoardID(HttpServletRequest request) {		
		List<MenuVO> menuList = (List<MenuVO> )request.getSession().getAttribute("menuList");		
		int boardID=0;
		if (menuList != null) {
			String url = request.getRequestURI();
			for (MenuVO vo : menuList) {
				if(!"1".equals(vo.getLevel())) {
					if(url.indexOf(vo.getMenuUrl())>-1) {
						boardID = vo.getMenuSeq();
						break;
					}				
				}
			}
		}
		return boardID;
	}
	
	
	//메일 템플릿 셋팅
	public TemplateReader setTemplete(String path, Hashtable<String, String> ht) throws IOException {	
	
		java.io.BufferedReader in = null;
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
	 	if(cl == null) {
	 		cl=ClassLoader.getSystemClassLoader();
	 	}
	 	InputStream input = cl.getResourceAsStream(path);
	 	in  = new java.io.BufferedReader(new InputStreamReader(input,"UTF-8"));
		StringBuffer buf = new StringBuffer();
		String line;
		while( (line = in.readLine()) != null ) buf.append(line + "\n");
		return new TemplateReader(ht, buf.toString());
	}	
	
}


