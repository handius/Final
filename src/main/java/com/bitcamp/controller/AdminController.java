package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/")
	public String main() {
		return "main";
	}
}