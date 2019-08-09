package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductDetailController {

	@RequestMapping("/productDetail/{list_no}")
	public String productDetail(@PathVariable int list_no) {
		
		return "productdetail/productdetail.mall";
	}
}
