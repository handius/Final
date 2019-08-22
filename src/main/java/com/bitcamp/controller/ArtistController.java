package com.bitcamp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.Product.ListDTO;
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
	public List<Map<String, Object>> ajaxArtistBoardDetailProductList(@RequestBody Map<String, Integer> map) {
		HashMap<String, Object> hashmap = new HashMap<>();
		
		int CurrentPage = map.get("currentProductInput");
		int sqlSize = 5;
		int start_sql = (CurrentPage-1) * sqlSize + 1;
		int end_sql = start_sql + sqlSize -1;
		
		hashmap.put("artist_no", map.get("artist_no"));
		hashmap.put("start_sql", start_sql);
		hashmap.put("end_sql", end_sql);
		
		return service.artistBoardDetailProductListService(hashmap);
	}
	
	@ResponseBody
	@RequestMapping("/ajaxArtistDetailBuyReviewList")
	public List<BuyReviewDTO> ajaxArtistDetailBuyReviewList(@RequestBody Map<String, Integer> map) {
		HashMap<String, Object> hashmap = new HashMap<>();

		int CurrentPage = map.get("currentBuyReviewInput");
		int sqlSize = 5;
		int start_sql = (CurrentPage-1) * sqlSize + 1;
		int end_sql = start_sql + sqlSize -1;
		hashmap.put("artist_no", map.get("artist_no"));
		hashmap.put("start_sql", start_sql);
		hashmap.put("end_sql", end_sql);
		
		return service.artistBoardDetailBuyReviewList(hashmap);
	}
}
