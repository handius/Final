package com.bitcamp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.DTO.freeboard.FreeboardRepDTO;
import com.bitcamp.service.FreeboardRepService;
import com.bitcamp.service.FreeboardService;

@Controller
public class FreeboardController {

	@Resource(name = "freeboardService")
	private FreeboardService fbservice;

	@Resource(name="freeboardRepService")
	private FreeboardRepService replySerivce;
	
	// @PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("freeboard/freeboardList")
	public String freeboardList(
			@RequestParam(value = "category", required = false, defaultValue = "전체") String freeboard_category,
			Model model) {

		List<FreeboardDTO> list = fbservice.listService(freeboard_category);

		model.addAttribute("list", list);

		return "freeboard/freeboardList.mall";
	}

	@RequestMapping("freeboard/freeboardDetail")
	public String freeboardDetail(@RequestParam("no") int freeboard_no, Model model) {

		FreeboardDTO dto = fbservice.detailService(freeboard_no);
		model.addAttribute("board", dto);

		return "freeboard/freeboardDetail.mall";
	}

	@RequestMapping("freeboard/freeboardWrite")
	public String freeboardWrite() {
		return "freeboard/freeboardWriteform.mall";
	}

	@RequestMapping("freeboard/freeboardWriteResult")
	public String freeboardWriteResult(@RequestParam("category") String freeboard_category,
			@RequestParam("title") String freeboard_title, @RequestParam int member_no,
			@RequestParam("content") String freeboard_content) {

		System.out.println("멤버번호" + member_no);

		FreeboardDTO dto = new FreeboardDTO();
		dto.setFreeboard_category(freeboard_category);
		dto.setFreeboard_title(freeboard_title);
		dto.setFreeboard_content(freeboard_content);
		dto.setMember_no(member_no);

		fbservice.writeService(dto);

		return "redirect:/freeboard/freeboardList";
	}

	@RequestMapping("freeboard/boardDelete")
	public String freeboardDelete(@RequestParam("no") int freeboard_no) {
		fbservice.deleteService(freeboard_no);
		return "redirect:/freeboard/freeboardList";
	}

	@RequestMapping("freeboard/boardModify")
	public String freeboardModify(@RequestParam("no") int freeboard_no, Model model) {

		FreeboardDTO dto = fbservice.detailService(freeboard_no);

		model.addAttribute("board", dto);

		return "freeboard/freeboardModify.mall";
	}

	@RequestMapping("freeboard/boardModifyResult")
	public String freeboardModifyResult(@RequestParam("no") int freeboard_no,
			@RequestParam("category") String freeboard_category, @RequestParam("title") String freeboard_title,
			@RequestParam("content") String freeboard_content) {

		FreeboardDTO dto = new FreeboardDTO();
		dto.setFreeboard_no(freeboard_no);
		dto.setFreeboard_category(freeboard_category);
		dto.setFreeboard_title(freeboard_title);
		dto.setFreeboard_content(freeboard_content);

		fbservice.modifyService(dto);

		return "redirect:/freeboard/freeboardDetail?no=" + freeboard_no;
	}

	@RequestMapping("freeboard/searchResult")
	public String freeboardSearchResult(@RequestParam String search_type, @RequestParam String search_txt,
			Model model) {
		System.out.println(search_type);
		System.out.println(search_txt);

		List<FreeboardDTO> list = fbservice.searchList(search_type, search_txt);
		model.addAttribute("list", list);

		return "freeboard/freeboardList";
	}

	@RequestMapping(value = "/freeboard/freeboardReply", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freeboardReply(@RequestBody FreeboardRepDTO repDTO){

		Map<String, Object> result = new HashMap<>();

		try {
			
			System.out.println("asdadasda");
			System.out.println(repDTO.toString());
//			replySerivce.saveReply(repDTO);
			
			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}
}
