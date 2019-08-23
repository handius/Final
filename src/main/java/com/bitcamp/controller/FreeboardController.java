package com.bitcamp.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.service.FreeboardRepService;
import com.bitcamp.service.FreeboardService;

@Controller
public class FreeboardController {

	@Resource(name = "freeboardService")
	private FreeboardService fbservice;

	@Resource(name = "freeboardRepService")
	private FreeboardRepService replySerivce;

	// @PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value="/freeboard")
	public String freeboardList(
			@RequestParam(value = "category", required = false, defaultValue = "전체") String freeboard_category,
			@RequestParam(value = "searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(required = false) String curr, Model model, Principal prin, Authentication auth) {

		// 검색, 리스트출력
		HashMap<String, Object> listMap = new HashMap<>();
		listMap.put("freeboard_category", freeboard_category);
		listMap.put("searchType", searchType);
		listMap.put("searchKeyword", searchKeyword);

		// 페이징
		int totalCount = fbservice.getListCountService(listMap);
		int currpage = 1;
		if (curr != null)
			currpage = Integer.parseInt(curr);
		int pagepercount = 10;
		int blockSize = 10;

		PageDTO page = new PageDTO(currpage, totalCount, pagepercount, blockSize);
		listMap.put("startrow", page.getStartrow());
		listMap.put("endrow", page.getEndrow());

		List<FreeboardDTO> list = fbservice.listService(listMap);

		model.addAttribute("list", list);
		model.addAttribute("paging", page);

		return "freeboard/freeboardList.mall";
	}

	@RequestMapping("freeboard/detail")
	public String freeboardDetail(@RequestParam("no") int freeboard_no, Model model) {

		FreeboardDTO dto = fbservice.detailService(freeboard_no);
		int countRep = replySerivce.countReply(freeboard_no);
		fbservice.updateHitsService(freeboard_no);

		model.addAttribute("board", dto);
		model.addAttribute("countRep", countRep);

		return "freeboard/freeboardDetail.mall";
	}

	@RequestMapping("/freeboard/write")
	public String freeboardWrite(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("member");

		return "freeboard/freeboardWriteform.mall";
	}

	@RequestMapping("freeboard/freeboardWriteResult")
	public String freeboardWriteResult(@RequestParam("category") String freeboard_category,
			@RequestParam("title") String freeboard_title, @RequestParam int member_no,
			@RequestParam("content") String freeboard_content) {

		FreeboardDTO dto = new FreeboardDTO();
		dto.setFreeboard_category(freeboard_category);
		dto.setFreeboard_title(freeboard_title);
		dto.setFreeboard_content(freeboard_content);
		dto.setMember_no(member_no);

		fbservice.writeService(dto);

		return "redirect:/freeboard";
	}

	@RequestMapping("freeboard/boardDelete")
	public String freeboardDelete(@RequestParam("no") int freeboard_no) {
		fbservice.deleteService(freeboard_no);
		return "redirect:/freeboard";
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

		return "redirect:/freeboard/detail?no=" + freeboard_no;
	}

}
