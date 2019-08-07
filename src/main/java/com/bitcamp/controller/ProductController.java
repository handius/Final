package com.bitcamp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.VO.file.FileVO;
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
	
	@ResponseBody
	@RequestMapping(value="/ajaxHashSearcher", method={RequestMethod.POST, RequestMethod.GET})
	public List<String> ajaxHashPager(@RequestParam String searchData) {
		return service.getHashSearchService(searchData);
	}
	
	@RequestMapping(value="/sell", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellProduct() {
		return "sell/sell";
	}
	
	@RequestMapping(value="/sell/insertPerfectOrder", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellPerfectOrder() {
		return "sell/insertPerfectOrder";
	}
	
	@RequestMapping(value="/sell/insertOrderMade", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellOrderMade() {
		return "sell/insertOrderMade";
	}
	
	@RequestMapping(value="*/uploadAjaxAction", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ResponseEntity<List<FileVO>> uploadAjaxPost(HttpSession session, MultipartFile[] uploadFile) {
		List<FileVO> list = new ArrayList<>();
		System.out.println("ajax controller 입장");
		String path = session.getServletContext().getRealPath("/resources/image");
		System.out.println(path);
		String uploadFolder = path;
		for(MultipartFile multipartFile : uploadFile) {
			FileVO filevo = new FileVO();
			String uploadFileName = multipartFile.getOriginalFilename();
			filevo.setFileName(uploadFileName);
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);	
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "-" + uploadFileName;
			try {
				File saveFile = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				filevo.setUploadPath(uploadFolder);
				filevo.setUuid(uuid.toString());
				list.add(filevo);
				
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@RequestMapping(value="*/insertPerfectOrderForm", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertPerfectOrder(ListDTO dto){
		System.out.println(dto);
		int result = service.insertPerfectOrderDataService(dto);
		System.out.println("결과 : " + result);
		return "redirect:/orderList";
	}
	
	@RequestMapping(value="*/insertOrderMadeForm", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertOrderMade(ListDTO dto){
		System.out.println(dto);
		int result = service.insertOrderMadeDataService(dto);
		System.out.println("결과 : " + result);
		return "redirect:/orderList";
	}
}
