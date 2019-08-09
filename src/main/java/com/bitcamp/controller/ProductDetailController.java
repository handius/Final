package com.bitcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.service.ProductDetailService;

@Controller
public class ProductDetailController {
	
	@Autowired
	private ProductDetailService service;

	@RequestMapping("/productDetail/{list_no}")
	public String productDetail(@PathVariable int list_no , Model model) {
		System.out.println(list_no);
		
		ListDTO dto = service.productDetailService(list_no);
		List<String> imglist = service.productDetailImgGetService(list_no);
		System.out.println(imglist);
		model.addAttribute("ListDTO", dto);
		model.addAttribute("imgList", imglist.get(0));
		return "productdetail/productdetail.mall";
	}
}
