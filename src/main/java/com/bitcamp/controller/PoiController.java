package com.bitcamp.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.VO.admin.NewMemberVO;
import com.bitcamp.service.AdminService;
import com.fasterxml.jackson.core.JsonParser;

@Controller
public class PoiController {
	
	@Autowired
	private AdminService adservice;
	
	@RequestMapping(value = "/exceldown")
	public void excelDown(@RequestParam String search,
							HttpServletResponse response) throws Exception {

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("exceldown");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		// 테이블 위
		CellStyle header = wb.createCellStyle();
		
		// 폰트
		Font header_font = wb.createFont();
		header_font.setBold(true);
		header_font.setFontName("맑은 고딕");
		header_font.setFontHeight((short)(11*20));
		
		// 폰트 적용
		header.setFont(header_font);
		header.setAlignment(HorizontalAlignment.CENTER);
		header.setVerticalAlignment(VerticalAlignment.CENTER);
		
		// 생성
		row = sheet.createRow(rowNo++);
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,1));
		cell = row.createCell(0);
		cell.setCellStyle(header);
		cell.setCellValue("신규 가입자 수");
        row.setHeight((short)500); 
		
		// 테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();
		
		// 폰트 테스트 중
		Font font = wb.createFont();
		font.setFontName("맑은 고딕");

		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 빨간색입니다.
		headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		// 폰트 적용
		headStyle.setFont(font);

		// 데이터는 가운데 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("가입일");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("신규가입자 수");

		List<NewMemberVO> list = adservice.getNewMemberList(search);
		
		// 데이터 부분 생성
		for (NewMemberVO dto : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getJoin_date() + "일");
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(dto.getJoin_count());

		}
		sheet.setColumnWidth((short)0, (short)4000);
		sheet.setColumnWidth((short)1, (short)4000);

		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=New Member.xls");

		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();

	}
}
