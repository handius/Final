package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("ifpagemain", 1);
		return "main.mall";
	}
	@RequestMapping("/admin")
	public String adminmain(Model model) {
		model.addAttribute("admin_category", "member");
		return "admin/memberlist.admin";
	}
	@RequestMapping("/admin/memberdetail")
	public String memberdetail(Model model) {
		model.addAttribute("admin_category", "member");
		return "admin/memberdetail.admin";
	}
	@RequestMapping("/admin/analnewmember")
	public String analnewmember(Model model) {
		model.addAttribute("admin_category", "anal");
		return "admin/newmember.admin";
	}
	@RequestMapping("/admin/analproduct")
	public String analproduct(Model model) {
		model.addAttribute("admin_category", "anal");
		return "admin/popularproducts.admin";
	}
	@RequestMapping("/admin/mainset")
	public String mainset(Model model) {
		model.addAttribute("admin_category", "mainset");
		return "admin/mainset.admin";
	}
	@RequestMapping("/admin/qna")
	public String adminqna(Model model) {
		model.addAttribute("admin_category", "operate");
		return "admin/questionlist.admin";
	}
	@RequestMapping("/admin/answer")
	public String answer(Model model) {
		model.addAttribute("admin_category", "operate");
		return "admin/answer.admin";
	}
}
