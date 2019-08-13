package com.bitcamp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.mapper.MemberMapper;
import com.bitcamp.service.FreeboardService;

@Controller
public class FreeboardController {

	@Resource(name = "freeboardService")
	private FreeboardService fbservice;
	
	@Autowired
	private MemberMapper mem;

//	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("freeboard/freeboardList")
	public String freeboardList(
			@RequestParam(value = "category", required = false, defaultValue = "") String freeboard_category, Model model) {

		List<FreeboardDTO> list = fbservice.listService(freeboard_category);
		
		model.addAttribute("list", list);
		
		return "freeboard/freeboardList";
	}

	@RequestMapping("freeboard/freeboardDetail")
	public String freeboardDetail() {
		return "freeboard/freeboardDetail";
	}

	@RequestMapping("freeboard/freeboardWrite")
	public String freeboardWrite() {
		return "freeboard/freeboardWriteform";
	}

	@RequestMapping("freeboard/freeboardWriteResult")
	public String freeboardWriteResult(@RequestParam("title") String freeboard_title, @RequestParam int member_no,
			@RequestParam("content") String freeboard_content) {

		System.out.println("멤버번호" + member_no);

		FreeboardDTO dto = new FreeboardDTO();
		dto.setFreeboard_title(freeboard_title);
		dto.setFreeboard_content(freeboard_content);
		dto.setMember_no(member_no);

		fbservice.writeService(dto);

		return "redirect:/freeboard/freeboardList";
	}

	@RequestMapping("freeboard/searchResult")
	public String freeboardSearchResult(@RequestParam String search_type, @RequestParam String search_txt, Model model) {
		System.out.println(search_type);
		System.out.println(search_txt);

		List<FreeboardDTO> list = fbservice.searchList(search_type, search_txt);
		model.addAttribute("list",list);
		
		return "freeboard/freeboardList";
	}
}
