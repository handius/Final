package com.bitcamp.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.service.JoinService;

@Controller
public class JoinController {
	
	@Resource(name="joinService")
	private JoinService joinService;

	@RequestMapping("join/terms")
	private String terms() {
		return "join/terms";
	}
	
	@RequestMapping("join/joinform")
	public String joinform() {
		return "join/joinform";
	}
	
	@RequestMapping("join/joinResult")
	public String join(@RequestParam String id, @RequestParam String password1, @RequestParam String password2, @RequestParam String name, @RequestParam String email, @RequestParam String address1, @RequestParam String address2) {
		System.out.println(id);
		System.out.println(password1);
		return "";
	}
	
	@RequestMapping(value="/user/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int check(@RequestParam("userId") String user_id) {
		System.out.println("dddddddddddd");
		System.out.println(user_id);
		return joinService.userIdCheck(user_id);
	}
	
}
