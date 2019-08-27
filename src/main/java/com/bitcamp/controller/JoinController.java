package com.bitcamp.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DAO.CustomUser;
import com.bitcamp.mapper.MemberMapper;
import com.bitcamp.service.JoinService;

@Controller
public class JoinController {

	@Resource(name = "joinService")
	private JoinService joinService;

	@Autowired
	private MemberMapper member;
	
	@RequestMapping("/join")
	public String join() {
		return "join/terms.mall";
	}

	@RequestMapping("join/terms")
	private String terms() {
		return "join/terms.mall";
	}

	@RequestMapping("join/joinform")
	public String joinform() {
		return "join/joinform.mall";
	}

	@RequestMapping(value = "/user/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public int check(@RequestParam("user_id") String user_id) {
		
		if (user_id.length() > 0) { // 아이디 입력하지 않았을 때
			for (int i = 0; i < user_id.length(); i++) {
				char ch = user_id.charAt(i);
				if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
					return 1; // 아이디 형식에 맞지 않을때
				}
			}
			if (user_id.length() < 4 || user_id.length() > 12) {
				return 3; // 아이디 길이가 4~12자가 아닐 때
			}
			if (member.readMember(user_id) == null) {
				return 4; // 아이디 사용 가능
			}
		} else {
			return 5;
		}
		return 2;
	}

	@RequestMapping("join/joinResult")
	public String join(@RequestParam("id") String user_id, @RequestParam("password") String user_password,
			@RequestParam("name") String user_name, @RequestParam("email") String user_email,
			@RequestParam String address1, @RequestParam String address2) throws Exception {
		String user_address = address1 + " " + address2;
		// user_name+user_email+user_address);
		joinService.userRegisterService(user_id, user_password, user_name, user_email, user_address);

		return "join/joinResult";
	}

	@RequestMapping(value = "join/joinConfirm", method = RequestMethod.GET)
	public String joinConfirm(@RequestParam("user_id") String user_id, @RequestParam("user_email") String user_email,
			@RequestParam() String user_certkey) {

		System.out.println("키키키");
		System.out.println(user_email);
		System.out.println(user_certkey);

		joinService.updateCertStatusService(user_id, user_email, user_certkey);

		return "join/joinConfirm.mall";
	}
	
	@RequestMapping("join/popup/jusoPopup")
	public String addressAPI(){
		return "join/popup/jusoPopup";
	}

}
