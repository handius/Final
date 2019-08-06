package com.bitcamp.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DTO.member.MemberDTO;
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
	
	@RequestMapping(value="/user/idCheck", method=RequestMethod.GET)
	@ResponseBody
	public int check(@RequestParam("userId") String user_id) {
		System.out.println(joinService.userIdCheckService(user_id));
		return joinService.userIdCheckService(user_id);
	}
	
	@RequestMapping("join/joinResult")
	public String join(@RequestParam("id") String user_id, @RequestParam("password") String user_password, @RequestParam("name") String user_name, @RequestParam("email") String user_email, @RequestParam String address1, @RequestParam String address2) throws Exception {
		String user_address = address1+" "+address2;
//		System.out.println(user_id+ user_password+ user_name+user_email+user_address);
		joinService.userRegisterService(user_id, user_password, user_name, user_email, user_address);
		
		return "";
	}
	
}
