package com.bitcamp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.service.ProductDetailService;

@Controller
public class ProductDetailController {
	
	@Autowired
	private ProductDetailService service;

	@RequestMapping("/productDetail/{list_no}")
	public String productDetail(@PathVariable int list_no ,HttpSession session ,Model model) {
		System.out.println(list_no); //테스트
		
		Map<String, Object> map = service.productDetailService(list_no);
		
		model.addAttribute("listDTO", map.get("productDetail"));
		model.addAttribute("imgList", map.get("productDetailImg"));
		model.addAttribute("optionList", map.get("productDetailOption"));
		model.addAttribute("qaBoardList", map.get("productDetailQABoardList"));
		model.addAttribute("QACurrentPage", 1);
		return "productdetail/productdetail.mall";
	}
	
	
	@RequestMapping("/ajaxqaboardinsert")
	public @ResponseBody String ajaxqaboardinsert(@RequestBody Map<String, Object> map, HttpSession session) {
		
		int list_no = Integer.parseInt((String)map.get("list_no"));
		int member_no = 64; //임시 회원번호
		String qa_board_content =  (String) map.get("qa_content");
		int qa_board_secret = 0;
		if(map.get("qa_secret").equals(true)) {
			qa_board_secret = 1;
		}
		
		QABoardDTO dto = new QABoardDTO();
		dto.setList_no(list_no);
		dto.setMember_no(member_no);
		dto.setQa_board_content(qa_board_content);
		dto.setQa_board_secret(qa_board_secret);
		
		return ""+service.productDetailQandAInsertService(dto);
	}
	
	@RequestMapping("/ajaxqaboardList")
	public @ResponseBody List<QABoardDTO> ajaxqaboardList(@RequestBody Map<String, String> map) {
		int list_no = Integer.parseInt(map.get("list_no"));
		int qaCurrentPage = Integer.parseInt(map.get("currentpage"));
		int sqlSize = 5;
		int start_sql = (qaCurrentPage-1) * sqlSize + 1;
		int end_sql = start_sql + sqlSize -1;
		QABoardDTO dto = new QABoardDTO();
		dto.setList_no(list_no);
		dto.setStart_sql(start_sql);
		dto.setEnd_sql(end_sql);
		
		return service.productDetailQandAList(dto);
	}
	
}
