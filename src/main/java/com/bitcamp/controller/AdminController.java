package com.bitcamp.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.VO.admin.DateVO;
import com.bitcamp.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adservice;
	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("ifpagemain", 1);
		return "main.mall";
	}
	@RequestMapping("/admin")
	public String adminmain(@RequestParam(required=false) String curr,
							 @RequestParam(required=false) String user_name,
							 @ModelAttribute DateVO search_date,
							 @RequestParam(required=false) String tempROLE,
							 Model model) {

		// 쿼리 돌릴 값 (검색)
		HashMap<String, Object> search_map = new HashMap<>();
		search_map.put("user_name", user_name);
		int date1 = search_date.getSearch_date_year();
		int date2 = search_date.getSearch_date_month();
		String make_to_char = date1 + "-" + date2;
		search_map.put("search_date", make_to_char);
		
		// 페이징
		int currpage = 1;
		if(curr != null) currpage = Integer.parseInt(curr);
		int totalCount = adservice.getMemberCount(search_map);		// count(*)
		int pagepercount = 10;										// 페이지 당 표시할 게시글 갯수
		int blockSize = 5;											// 페이징 블록 사이즈
		PageDTO page = new PageDTO(currpage, totalCount, pagepercount, blockSize);
		
		// 쿼리 돌릴 값 (페이징)
		search_map.put("startrow", page.getStartrow());
		search_map.put("endrow", page.getEndrow());
		
//		System.out.println(search_map.get("user_name"));
//		System.out.println(search_map.get("search_date"));
//		System.out.println(search_map.get("startrow"));
//		System.out.println(search_map.get("endrow"));
		
		List<MemberDTO> memberlist = adservice.getMemberList(search_map);
		
		model.addAttribute("admin_category", "member");
		model.addAttribute("memberList", memberlist);
		model.addAttribute("paging", page);
			
		// 페이징 검색 값
		HashMap<String, Object> test = new HashMap<>();
		Integer year = search_date.getSearch_date_year();
		Integer month = search_date.getSearch_date_month();
		if(user_name != null) test.put("user_name", user_name);
		if(year != 0) test.put("search_date_year", year);
		if(month != 0) test.put("search_date_month", month);
		if(tempROLE != null) test.put("tempROLE", tempROLE);
		model.addAttribute("test", test);
		return "admin/memberlist.admin";
	}
	
	@RequestMapping("/admin/memberdetail")
	public String memberdetail(Model model) {
		model.addAttribute("admin_category", "member");
		return "admin/memberdetail.admin";
	}
	
	@RequestMapping("/admin/analnewmember")
	public String analnewmember(Model model) {
		model.addAttribute("admin_category", "anal");
		return "admin/newmember.admin";
	}
	@RequestMapping("/admin/analproduct")
	public String analproduct(Model model) {
		model.addAttribute("admin_category", "anal");
		return "admin/popularproducts.admin";
	}
	@RequestMapping("/admin/mainset")
	public String mainset(Model model) {
		model.addAttribute("admin_category", "mainset");
		return "admin/mainset.admin";
	}
	@RequestMapping("/admin/qna")
	public String adminqna(Model model) {
		model.addAttribute("admin_category", "operate");
		return "admin/questionlist.admin";
	}
	@RequestMapping("/admin/answer")
	public String answer(Model model) {
		model.addAttribute("admin_category", "operate");
		return "admin/answer.admin";
	}
}
