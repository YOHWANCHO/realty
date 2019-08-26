package kr.co.realty.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.StringTokenizer;

import org.springframework.stereotype.Component;

@Component("parseUtil")
public class ParseUtil {

	public int parseToInteger(String value, int defaultValue)
	{
		int result;
		try{
			result = Integer.parseInt(value);
		}
		catch (Exception e){
			return defaultValue;
		}
		return result;
	}
	public String parseToString(String value, String defaultValue)
	{

		String result="";
		result = String.valueOf(value);
		if(result == null)
		{
			return defaultValue;
		}
		return result;
		
	}
	public String parseToDate(int unixTime)
	{
		Date d = new Date( unixTime * 1000L ); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//	System.out.println(sdf.format(d));
		return sdf.format(d);
	}
	public String parseToDate(int unixTime, String dateFormat)
	{
		Date d = new Date( unixTime * 1000L ); 
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
	//	System.out.println(sdf.format(d));
		return sdf.format(d);
	}
	public String parseToDate(String unixTime, String dateFormat)
	{
		
		int time = parseToInteger(unixTime,0);
		
		Date d = new Date( time * 1000L ); 
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
	//	System.out.println(sdf.format(d));
		return sdf.format(d);
	}
	
	public ArrayList<String> StringToken(  String target, String delimiter)
	{
		ArrayList<String> result = new ArrayList<String>();
		
		StringTokenizer st = new StringTokenizer(target);
		while(st.hasMoreElements())
		{
			String tk = st.nextToken(delimiter);
			result.add(tk);
		}
		
		return result;
	}
	
	public int parseToUnixtime(String time, int defaultValue)
	{
		if(time == null) 
			return defaultValue;

		int result=0;
		Date date;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = sdf.parse(time);
			result = (int) (date.getTime() / 1000);
		} catch (ParseException e) {
			return defaultValue;
		}
		return result;
	}
	public int parseToUnixtime(String time, String patten, int defaultValue)
	{
		if(time == null) 
			return defaultValue;

		int result=0;
		Date date;
		SimpleDateFormat sdf = new SimpleDateFormat(patten);
		try {
			date = sdf.parse(time);
			result = (int) (date.getTime() / 1000);
		} catch (ParseException e) {
			return defaultValue;
		}
		return result;
	}
	 
	public String makeSerial(int size)
	{

		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();

		for(int i=0;i<size;i++){
			if(rnd.nextBoolean()){
				buf.append((char)((int)(rnd.nextInt(26))+65));
			}else{
				buf.append((rnd.nextInt(10))); 
			}
		}
		return buf.toString();
	}
	
	
}
