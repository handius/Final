package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginContoller {
	
	@RequestMapping("login/login")
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
}
