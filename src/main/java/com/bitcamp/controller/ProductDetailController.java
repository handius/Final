package com.bitcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.OptionDTO;
import com.bitcamp.service.ProductDetailService;

@Controller
public class ProductDetailController {
	
	@Autowired
	private ProductDetailService service;

	@RequestMapping("/productDetail/{list_no}")
	public String productDetail(@PathVariable int list_no , Model model) {
		System.out.println(list_no); //테스트
		
		ListDTO listdto = service.productDetailService(list_no);
		List<String> imglist = service.productDetailImgGetService(list_no);
		List<OptionDTO> optionlist = service.productDetailOptionGet(list_no);
		
		model.addAttribute("listDTO", listdto);
		model.addAttribute("imgList", imglist);
		model.addAttribute("optionList", optionlist);
		return "productdetail/productdetail.mall";
	}
}
