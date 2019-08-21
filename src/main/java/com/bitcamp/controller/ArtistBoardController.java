package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArtistBoardController {
	
	@RequestMapping("/artistBoard")
	public String artistBoard() {
		return "artistboard/artistBoard.mall";
	}
}
