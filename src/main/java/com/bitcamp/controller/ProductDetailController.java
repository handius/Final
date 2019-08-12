package com.bitcamp.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "productdetail/productdetail.mall";
	}
	
	@RequestMapping(value="/ajaxqaboardinsert")
	public void ajaxqaboardinsert(@RequestBody Map<String, Object> map, HttpSession session) {
		
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
		
		service.productDetailQandAInsertService(dto);
	}
}
