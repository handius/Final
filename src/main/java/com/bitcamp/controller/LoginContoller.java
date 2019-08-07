package com.bitcamp.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
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
	public String loginResult(@RequestParam("username") String user_id, @RequestParam("password") String user_password) {
		
		System.out.println("아이디 패스워드");
		System.out.println(user_id);
		System.out.println(user_password);
		
		return "";
	}
	
	@RequestMapping("login/searchIDResult")
	public String SearchIDResult(@RequestParam("name") String user_name, @RequestParam("email") String user_email) {
		
		return "";
	}
	
	@RequestMapping("login/searchPasswordResult")
	public String changePasswordResult() {
		return "";
	}
	
	
	
}
