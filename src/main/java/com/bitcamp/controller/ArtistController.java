package com.bitcamp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.artist.ArtistRepDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.service.ArtistService;

@Controller
public class ArtistController {
	
	@Autowired
	private ArtistService service;
	
	@RequestMapping("/artistDetail/{artist_no}")
	public String artistBoard(@PathVariable int artist_no, Model model) {
		Map<String, Object> map = service.artistBoardDetailService(artist_no);
		model.addAttribute("artistInfo", map.get("artistInfo"));
		model.addAttribute("artistBoardDetail", map.get("artistBoardDetail"));
		return "artist/artistDetail.mall";
	}
	
	@RequestMapping("/artistInsert")
	public String artistInsert() {
		String insertResultMessage = service.artistBoardInsertService(64); //임시번호
		System.out.println(insertResultMessage);
		return "redirect:/login";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxArtistBoardDetailProductList")
	public Map<String, Object> ajaxArtistBoardDetailProductList(@RequestBody Map<String, Integer> map) {	
		return service.artistBoardDetailProductListService(map);
	}
	
	@ResponseBody
	@RequestMapping("/ajaxArtistDetailBuyReviewList")
	public Map<String, Object> ajaxArtistDetailBuyReviewList(@RequestBody Map<String, Integer> map) {	
		return service.artistBoardDetailBuyReviewListService(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxArtistDetailRepInsert", produces="application/text; charset=utf-8")
	public String ajaxArtistDetailRepInsert(@RequestBody Map<String, String> map, HttpSession session) {
		String resultMessage = "로그인부터 하세요";
		Object obj = session.getAttribute("member");
		
		if(obj != null) {
			MemberDTO mdto = (MemberDTO)obj;
			int member_no = mdto.getMember_no();
			int artist_no = Integer.parseInt(map.get("artist_no"));
			String artist_rep_content = map.get("artist_rep_content");
			
			ArtistRepDTO repdto = new ArtistRepDTO();
			repdto.setArtist_no(artist_no);
			repdto.setMember_no(member_no);
			repdto.setArtist_rep_content(artist_rep_content);
			int InsertResult = service.artistBoardDetailRepInsertService(repdto);
			if(InsertResult == 0) {
				resultMessage = "댓글 등록에 실패 햇습니다.";
			}
			else {
				resultMessage = "댓글이 등록 되었습니다.";
			}
		}
		
		return resultMessage;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxArtistBoardDetailRepList")
	public List<ArtistRepDTO> ajaxArtistBoardDetailRepList(@RequestBody Map<String, Integer> map) {
		return service.artistBoardDetailRepListService(map);
	}
}
