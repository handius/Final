package com.bitcamp.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginContoller {
	
	@RequestMapping("login")
	public String login() {
		return "login/loginform";
	}
	
	@RequestMapping("login/searchID")
	public String searchID() {
		return "login/searchIDform";
	}
	
	@RequestMapping("login/searchPassword")
	public String searchPassword() {
		return "login/searchPasswordform";
	}
	
	@RequestMapping("login/changePassword")
	public String changePassword() {
		return "login/changePasswordform";
	}
	
	@RequestMapping("login/searchPasswordform")
	public String SearchPasswordform() {
		
		return "login/searchPasswordform";
	}
	
	@RequestMapping("login/loginResult")
	public String loginResult(String error, String logout, Model model) {
		
		if(error!=null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout!=null) {
			model.addAttribute("logout","logout..");
		}
		
		return "/main";
	}
	
	@RequestMapping("login/searchIDResult")
	public String SearchIDResult(@RequestParam("name") String user_name, @RequestParam("email") String user_email) {
		
		return "";
	}
	
	@RequestMapping("login/searchPasswordResult")
	public String changePasswordResult() {
		return "";
	}
	
	@RequestMapping("login/loginFail")
	public String loginFail() {
		return "login/loginFail";
	}
	
}
