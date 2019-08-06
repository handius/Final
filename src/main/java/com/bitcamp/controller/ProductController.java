package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.service.ProductService;

@Controller
public class ProductController {
	@Resource(name="pservice")
	private ProductService service;
	
	@RequestMapping(value="/sell", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellProduct(@RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, Model model) {
		String list_category = "";
		int pagePerCount = 3;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status);
		System.out.println("hashList : " + hashTag);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status);
		List<String> hashList = service.getHashService(list_category);
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/sell";
	}
	
	@RequestMapping(value="/sell/{category}", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellProduct(@RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @PathVariable(required=false, name="category")String list_category, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, Model model) {
		int pagePerCount = 3;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status);
		List<String> hashList = service.getHashService(list_category);
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/sell";
	}
}
