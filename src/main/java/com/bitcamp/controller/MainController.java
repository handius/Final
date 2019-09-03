package com.bitcamp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.DTO.admin.MainImageDTO;
import com.bitcamp.DTO.admin.MainViewDTO;
import com.bitcamp.VO.admin.MainProductVO;
import com.bitcamp.service.AdminService;

@Controller
public class MainController {
	@Autowired
	private AdminService adservice;
	
	@RequestMapping("/mobile")
	public String mobileMain(Model model) {

		List<MainViewDTO> mainview = adservice.getMainViewList();
		List<MainImageDTO> mainimg = adservice.getMainImageList();
		List<MainProductVO> product1 = new ArrayList<>();
		List<MainProductVO> product2 = new ArrayList<>();
		List<MainProductVO> product3 = new ArrayList<>();
		String[] template2 = mainview.get(1).getMain_view_product().split(",");
		String[] template4 = mainview.get(3).getMain_view_product().split(",");
		String[] template5 = mainview.get(4).getMain_view_product().split(",");
		
		for(int i = 0; i < template2.length; i++) {
			MainProductVO vo1 = adservice.getMainProduct(template2[i]);
			MainProductVO vo2 = adservice.getMainProduct(template4[i]);
			MainProductVO vo3 = adservice.getMainProduct(template5[i]);
			product1.add(vo1);
			product2.add(vo2);
			product3.add(vo3);
		}
		
		model.addAttribute("product1", product1);
		model.addAttribute("product2", product2);
		model.addAttribute("product3", product3);
		model.addAttribute("mainviewlist", mainview);
		model.addAttribute("mainimglist", mainimg);
		model.addAttribute("ifpagemain", 1);
		return "mobile/m_main.m";
	}
	
	@RequestMapping("/")
	public String main(Model model) {
		
		List<MainViewDTO> mainview = adservice.getMainViewList();
		List<MainImageDTO> mainimg = adservice.getMainImageList();
		List<MainProductVO> product1 = new ArrayList<>();
		List<MainProductVO> product2 = new ArrayList<>();
		List<MainProductVO> product3 = new ArrayList<>();
		String[] template2 = mainview.get(1).getMain_view_product().split(",");
		String[] template4 = mainview.get(3).getMain_view_product().split(",");
		String[] template5 = mainview.get(4).getMain_view_product().split(",");
		
		for(int i = 0; i < template2.length; i++) {
			MainProductVO vo1 = adservice.getMainProduct(template2[i]);
			MainProductVO vo2 = adservice.getMainProduct(template4[i]);
			MainProductVO vo3 = adservice.getMainProduct(template5[i]);
			product1.add(vo1);
			product2.add(vo2);
			product3.add(vo3);
		}
		
		model.addAttribute("product1", product1);
		model.addAttribute("product2", product2);
		model.addAttribute("product3", product3);
		model.addAttribute("mainviewlist", mainview);
		model.addAttribute("mainimglist", mainimg);
		model.addAttribute("ifpagemain", 1);
		return "main.mall";
	}
}
