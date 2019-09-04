package com.bitcamp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.freeboard.FreeboardRepDTO;
import com.bitcamp.service.FreeboardRepService;

@RestController
public class FreeboardRepController {

	@Resource(name = "freeboardRepService")
	private FreeboardRepService replySerivce;

	@RequestMapping(value = "/freeboard/freeboardReply", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freeboardReply(@RequestBody FreeboardRepDTO repDTO) {

		Map<String, Object> result = new HashMap<>();

		try {
			replySerivce.saveReplyService(repDTO);
			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}

	@RequestMapping(value = "/modifyReply", method = RequestMethod.POST)
	@ResponseBody
	public void modifyReply(@RequestParam int rep_no, @RequestParam String rep_content) {
		// return replySerivce.getReplyData(rep_no);
		replySerivce.updateReplyDataService(rep_no, rep_content);
	}

	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public void deleteReply(@RequestParam int rep_no) {
		replySerivce.deleteReplyService(rep_no);
	}

	@RequestMapping(value = "freeboard/ReplyReply", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> freeboardRepRep(@RequestBody FreeboardRepDTO repDTO) {
		Map<String, Object> result = new HashMap<>();

		try {
			System.out.println(repDTO.getMember_no());
			replySerivce.saveReplyRepService(repDTO);

			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}

		return result;
	}

	@RequestMapping(value = "/freeboardRep", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam("no") int freeboard_no, ModelAndView mav, Model model) {

		HashMap<String, Object> listMap = new HashMap<>();
		listMap.put("freeboard_no", freeboard_no);

		List<FreeboardRepDTO> list = replySerivce.getReplyService(listMap);

		mav.setViewName("freeboard/freeboardRep");
		mav.addObject("list", list);
		model.addAttribute("freeboard_no", freeboard_no);
		
		return mav;
	}
	
	

}
