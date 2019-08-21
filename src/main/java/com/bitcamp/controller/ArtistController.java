package com.bitcamp.controller;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.service.ArtistService;

@Controller
public class ArtistController {
	
	@Autowired
	private ArtistService service;
	
	@RequestMapping("/artistDetail/{artist_no}")
	public String artistBoard(@PathVariable int artist_no) {
		return "artist/artistDetail.mall";
	}
	
	@RequestMapping("/artistInsert")
	public String artistInsert() {
		String insertResultMessage = service.artistBoardInsertService(64);
		System.out.println(insertResultMessage);
		return "redirect:/login";
	}
}
