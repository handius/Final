package com.bitcamp.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.service.FreeboardService;

@Controller
public class FreeboardController {

	@Resource(name = "freeboardService")
	private FreeboardService fbservice;

	@RequestMapping("freeboard/freeboardList")
	public String freeboardList() {
		
//		fbservice.listService();
		
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
	public String freeboardWriteResult(@RequestParam("title") String freeboard_title,@RequestParam int member_no,
			@RequestParam("content") String freeboard_content) {

		System.out.println("멤버번호"+member_no);
		FreeboardDTO dto = new FreeboardDTO();
		dto.setFreeboard_title(freeboard_title);
		dto.setFreeboard_content(freeboard_content);
		dto.setMember_no(member_no);
		
		fbservice.writeService(dto);

		return "redirect:/freeboard/freeboardList";
	}

}
