package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.service.ProductService;

@Controller
public class ProductController {
	@Resource(name="pservice")
	private ProductService service;
	
	@RequestMapping(value="/orderList", method= {RequestMethod.POST, RequestMethod.GET})
	public String listProduct(@RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, Model model) {
		String list_category = "";
		int pagePerCount = 8;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status);
		System.out.println("hashList : " + hashTag);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status);
		List<String> hashList = service.getHashService(20);
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/orderList";
	}
	
	@RequestMapping(value="/orderList/{category}", method= {RequestMethod.POST, RequestMethod.GET})
	public String listProduct(@RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @PathVariable(required=false, name="category")String list_category, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, Model model) {
		int pagePerCount = 8;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status);
		List<String> hashList = service.getHashService(20);
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/orderList";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxHashPager", method={RequestMethod.POST, RequestMethod.GET})
	public List<String> ajaxHashPager(@RequestParam int hashPage) {
		int endrow = hashPage * 12;
		return service.getHashService(endrow);
	}
	
	@RequestMapping(value="/sell", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellProduct() {
		return "sell/sell";
	}
}
