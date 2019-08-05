package com.bitcamp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.ProductDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/sell", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellProduct(@RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @RequestParam(defaultValue="")String list_category, List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, Model model) {
		int pagePerCount = 5;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		
		
		model.addAttribute("list", list);
		return "sell";
	}
}
