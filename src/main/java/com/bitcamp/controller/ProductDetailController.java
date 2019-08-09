package com.bitcamp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.service.ProductDetailService;

@Controller
public class ProductDetailController {
	
	@Autowired
	private ProductDetailService service;

	@RequestMapping("/productDetail/{list_no}")
	public String productDetail(@PathVariable int list_no , Model model) {
		System.out.println(list_no); //테스트
		
		Map<String, Object> map = service.productDetailService(list_no);
		
		model.addAttribute("listDTO", map.get("productDetail"));
		model.addAttribute("imgList", map.get("productDetailImg"));
		model.addAttribute("optionList", map.get("productDetailOption"));
		return "productdetail/productdetail.mall";
	}
}
