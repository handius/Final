package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeboardController {

	@RequestMapping("freeboard/freeboardList")
	public String freeboardList() {
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

}
