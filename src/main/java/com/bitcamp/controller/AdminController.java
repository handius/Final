package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("test1", 1);
		return "main.mall";
	}
	@RequestMapping("/admin")
	public String adminmain() {
		return "admin/memberlist.admin";
	}
	@RequestMapping("/test")
	public String test(Model model) {
		return "admin/answer.mall";
	}
}
