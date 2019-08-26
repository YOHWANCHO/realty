package kr.co.realty.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
public class ExcelUtil {
	
	
	
	public static List<String[]> cvsRead(String filePath, String encoding){
		List<String[]> cvsList = new ArrayList<String[]>();
		
		BufferedReader br = null;
        String line;
        String cvsSplitBy = ",";

        try {
            br = new BufferedReader(new InputStreamReader(new FileInputStream(filePath), encoding));
            while ((line = br.readLine()) != null) {
                String[] field = line.split(cvsSplitBy);
                
                cvsList.add(field);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
		
		
		return cvsList;
	}
	
}