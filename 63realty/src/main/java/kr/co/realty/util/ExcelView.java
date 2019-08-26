package kr.co.realty.util;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import kr.co.realty.data.log.vo.UserLogVO;




//public class ExcelView extends AbstractExcelView {
public class ExcelView extends AbstractXlsxView {

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String excelName = (String) model.get("excelName");
		String excelSeet = (String) model.get("excelSeet");
		int tot = (int) model.get("tot");
		List<String> colName1 = (List<String>) model.get("colName1");
		List<UserLogVO> colValue = (List<UserLogVO>) model.get("list");

		response.setContentType("application/msexcel");
		response.setHeader("Content-Disposition", "attachment; filename="
				+ new String(excelName.getBytes("utf-8"), "8859_1") + ".xls");

		Sheet sheet = workbook.createSheet(excelSeet);
		sheet.setColumnWidth(0, (short)8000);
		CellStyle cs = workbook.createCellStyle();
		cs.setWrapText(true);
		cs.setAlignment(CellStyle.ALIGN_CENTER);
		cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		cs.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		cs.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		cs.setBorderRight(HSSFCellStyle.BORDER_THIN);
		cs.setBorderTop(HSSFCellStyle.BORDER_THIN);
		cs.setBottomBorderColor(HSSFColor.GREY_80_PERCENT.index);
		cs.setLeftBorderColor(HSSFColor.GREY_80_PERCENT.index);
		cs.setRightBorderColor(HSSFColor.GREY_80_PERCENT.index);
		cs.setTopBorderColor(HSSFColor.GREY_80_PERCENT.index);
		CellStyle cs1 = workbook.createCellStyle();		
		cs1.setWrapText(true);
		cs1.setAlignment(CellStyle.ALIGN_CENTER);
		cs1.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
		Row titleRow = sheet.createRow(0);
		titleRow.setHeight((short)1000);
		Cell tcell = titleRow.createCell(0);
		tcell.setCellValue(excelName);
		tcell.setCellStyle(cs1);
		
		CellStyle csHeader = workbook.createCellStyle();
		csHeader.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		csHeader.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		csHeader.setBorderRight(HSSFCellStyle.BORDER_THIN);
		csHeader.setBorderTop(HSSFCellStyle.BORDER_THIN);
		csHeader.setBottomBorderColor(HSSFColor.GREY_80_PERCENT.index);
		csHeader.setLeftBorderColor(HSSFColor.GREY_80_PERCENT.index);
		csHeader.setRightBorderColor(HSSFColor.GREY_80_PERCENT.index);
		csHeader.setTopBorderColor(HSSFColor.GREY_80_PERCENT.index);
		// 상단 메뉴명 생성
		Row menuRow1 = sheet.createRow(1);
		for (int i = 0; i < colName1.size(); i++) {
			Cell cell;
			cell = menuRow1.createCell(i);	
			cell.setCellValue(colName1.get(i));
			
			csHeader.setWrapText(true);
			csHeader.setAlignment(CellStyle.ALIGN_CENTER);
			csHeader.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			csHeader.setFillForegroundColor(HSSFColor.AQUA.index);
			csHeader.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
			cell.setCellStyle(csHeader);
		}

		int i=0;
		int k=2;
		
		for(UserLogVO v : colValue){
			Row row = sheet.createRow(i + k);
			Cell cell0 = row.createCell(0);
			cell0.setCellValue(v.getIntDate());
			cell0.setCellStyle(cs);
			
			Cell cell1 = row.createCell(1);
			cell1.setCellValue(v.getUserCnt());
			cell1.setCellStyle(cs);
			i++;
		}
		Row row = sheet.createRow(i + k);
		Cell cell0 = row.createCell(0);
		cell0.setCellValue("합계");
		
		
		
		cell0.setCellStyle(csHeader);
		
		Cell cell1 = row.createCell(1);
		cell1.setCellValue(tot);
		cell1.setCellStyle(csHeader);
	}
}
