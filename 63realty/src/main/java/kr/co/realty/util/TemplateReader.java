package kr.co.realty.util;

import java.util.Hashtable;
import java.util.Vector;

public class TemplateReader
{
	static String IF_TAG="<if";
	static String ELSE_TAG="<else>";
	static String ENDIF_TAG="</if>";
	static String OP_EQUAL="==";
	static String OP_NOT_EQUAL="!=";
	static String OP_GT=">=";
	static String OP_LT="<=";
	static String PLUS="+";
	static String MINUS="-";
	static String BY="*";
	static String DIVIDE="/";
	
	String doc;
	Hashtable hash;

	public TemplateReader() {
//		null constructor
	}	
	
	public TemplateReader(Hashtable hash, String doc)
	{
//**		System.out.println("TemplateReader constructor made");
		this.hash = hash;
		this.doc = doc;
	}
	
	public void setHashtable(Hashtable hash)
	{
		this.hash=hash;	
	}
	
	public void setDocument(String doc)
	{
		this.doc=doc;	
	}
	
	public Hashtable getHashtable()
	{
		return this.hash;	
	}
	
	public String getDocument()
	{
		return this.doc;	
	}
	
	public String getTemplate()
	{
		String returnVal = interprate( replace( doc, hash ) );
		return returnVal;
	}
	
	public String interprate(String str)
	{
		return interprate(str,hash);
	}
	
	@SuppressWarnings("unchecked")
	public String interprate(String str, Hashtable ht)
	{
		Vector TorF = new Vector();
		int depth = -1;
		String key = IF_TAG;
		int idx = str.indexOf(key);
		String returnVal = "";
		String compValue = null;
		int advance = 0;
		int adder = 1;
		boolean isTrue=false;
		boolean wasTrue=false;
		if(idx>=0)
		{
			returnVal= str.substring(0,idx);
			while(key!=null)
			{
				advance = idx+key.length();
				if(key.equals(IF_TAG))
				{
					adder = 1;
					String operator = OP_GT;
					int idx2 = str.indexOf( ">=", advance );
					int idx1 = str.indexOf( ">", advance );
					if( idx2 > 0 && idx2 == idx1 )
					{
						idx1 = str.indexOf( ">", idx2+2 );
					}else
					{
						idx2 = -1;	
					}
					if( idx2 < 0 ) 
					{
						idx2 = str.indexOf(OP_EQUAL, advance);
						operator = OP_EQUAL;
					}
					if( idx2 < 0 || idx2>idx1 ) 
					{
						idx2 = str.indexOf(OP_NOT_EQUAL, advance);
						operator = OP_NOT_EQUAL;
					}
					if( idx2 < 0 || idx2>idx1 ) 
					{
						idx2 = str.indexOf(OP_LT, advance);
						operator = OP_LT;
					}
					if( idx2 >= 0 && idx2 < idx1 ) 
					{
						compValue = str.substring( idx2+2, idx1 ).trim();
					}else
					{
						idx2 = -1;	
					}
					String check = ( str.substring( advance, ((idx2>=0)?idx2:idx1)) ).trim();
					
//**					System.out.println("CHECK : "+check);
					advance = idx1+1;
					if(depth<0||isTrue)
					{
						String checkValue = (String)ht.get(check);
//**				System.out.println( "TML ==> "+check+"="+checkValue +" : "+ compValue +" : "+ operator);
						if(checkValue != null && checkValue.length() > 0)
						{
							if( compValue == null )
							{
								TorF.add("T");
							}else if( ( operator.equals(OP_EQUAL) && checkValue.equals(compValue) ) ) 
							{
								TorF.add("T");
							}else if( ( operator.equals(OP_NOT_EQUAL) && !checkValue.equals(compValue) ) ) 
							{
								TorF.add("T");
							}else if( operator.equals(OP_GT) || operator.equals(OP_LT) ) 
							{
								try
								{
									int intCheck = Integer.parseInt( checkValue );
									int intComp = Integer.parseInt( compValue );
									if( ( operator.equals(OP_GT) && intCheck >= intComp ) || ( operator.equals(OP_LT) && intCheck <= intComp ) )
									{
										TorF.add("T");
									}else
									{
										TorF.add("F");
									}
								}catch (Exception e)
								{
									TorF.add("F");	
								}
						    }else
							{
								TorF.add("F");	
							}
								compValue = null;
//**							System.out.println((depth+1)+" : T added : "+check);
						}else
						{
							TorF.add("F");
//**							System.out.println((depth+1)+" : F added : "+check);
						}
					}else
					{
						TorF.add("F");
//**						System.out.println((depth+1)+" : F added : "+check);
					}
				}else if(key.equals(ELSE_TAG))
				{
					if(wasTrue||depth<=0)
					{
						if(isTrue) 
						{
							TorF.set(depth,"F");
//**							System.out.println(depth+" : F set");
						}else
						{
							TorF.set(depth,"T");
//**							System.out.println(depth+" : T set");
						}
					}else
					{
						TorF.set(depth,"F");
//**						System.out.println(depth+" : F set");
					}
					adder = 0;
				}else if(key.equals(ENDIF_TAG))
				{
					adder = -1;
				}
				
				key = getNextTag(str, advance);
				if(key!=null)
				{
//**					System.out.println("NEXT TAG : "+key);
					idx = str.indexOf(key, advance);
				
					depth += adder;
//**					System.out.println("DEPTH : "+depth);	
					if(depth>=0)
					{
						isTrue = ((String)TorF.elementAt(depth)).equals("T");
						if(depth>0)	wasTrue = ((String)TorF.elementAt(depth-1)).equals("T");
						
					}else
					{
						TorF.removeAllElements();
					}
					if(isTrue||depth<0)
					{
						returnVal += str.substring(advance, idx);
					}
				}
			} // end of while(idx>=0)
		} // end of if(idx>=0)
		returnVal += str.substring(advance);
//**		System.out.println(returnVal);
		return returnVal;
	}
	
	private String getNextTag(String str, int start_point)
	{
		String returnVal=null;
		int idx1 = str.indexOf(IF_TAG, start_point);
		int idx2 = str.indexOf(ELSE_TAG, start_point);
//**		System.out.print(idx1+" , "+idx2);
		String tag1 = ELSE_TAG;
		if(idx1<0) idx1 = idx2 + 1;
		if(idx2<=0||idx1<idx2) 
		{
			idx2 = idx1;
			tag1 = IF_TAG;
		}
		int idx3 = str.indexOf(ENDIF_TAG, start_point);
//**		System.out.println(" --> "+idx2+" , "+idx3);
		String tag2 = ENDIF_TAG;
		if(idx2<=0) idx2 = idx3 + 1;
		if(idx2<idx3) 
		{
			idx3 = idx2;
			tag2 = tag1;
		}
		if(idx3>=0) returnVal = tag2;
		return returnVal;
	}
	
	private String replace(String str)
    {
    	return replace(str,hash);
    }
	
	@SuppressWarnings("rawtypes")
	private String replace(String str, Hashtable ht)
    {
    	int idx=str.indexOf("${");
    	while(idx>=0)
    	{
    		int idx2=str.indexOf("}",idx+2);
    		String key=str.substring(idx+2,idx2).trim();
    		String originKey = key;
    		String op = PLUS;
    		String oped = null;
    		int idx3 = key.indexOf(PLUS);
    		if( idx3 < 0)
    		{
    			op = MINUS;
    			idx3 = key.indexOf(MINUS);
    		}
    		if( idx3 < 0)
    		{
    			op = BY;
    			idx3 = key.indexOf(BY);
    		}
    		if( idx3 < 0)
    		{
    			op = DIVIDE;
    			idx3 = key.indexOf(DIVIDE);
    		}
    		if( idx3 > 0 ) 
    		{
    			oped = key.substring( idx3+1 ).trim();
    			key = key.substring( 0, idx3 ).trim();
    		}
    		String value=(String)ht.get(key);
//**    		System.out.println(key+" : "+value);
			if( value == null ) value = "";
			if( oped != null )
			{
				try
				{
					int intValue = Integer.parseInt( value );
					int intOped = Integer.parseInt( oped );
					if( op.equals(PLUS) ) intValue = intValue + intOped;
					if( op.equals(MINUS) ) intValue = intValue - intOped;
					if( op.equals(BY) ) intValue = intValue * intOped;
					if( op.equals(DIVIDE) ) intValue = intValue / intOped;
					value = intValue+"";
				}catch( Exception e ) 
				{
					if( value.length() == 0 ) value = (String)ht.get( originKey );
					if( value == null ) value = "";
				}
			}
    		str=str.substring(0,idx)+value+str.substring(idx2+1);
    		idx=str.indexOf("${");
    	}
    	return str;
    }
   	
}


