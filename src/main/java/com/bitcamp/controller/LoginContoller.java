package com.bitcamp.controller;

import java.security.Principal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DAO.CustomUser;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.service.CustomUserDetailService;
import com.bitcamp.service.MemberService;

@Controller
public class LoginContoller {

	@Resource
	private MemberService memberService;
	
	@Resource
	private CustomUserDetailService userService;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if (logout != null) {
			model.addAttribute("logout", "logout..");
		}

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

	@RequestMapping(value="login/loginResult", method=RequestMethod.GET)
	public String loginResult(Principal prin, HttpServletRequest request) {
		
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		System.out.println(user.getMember());
		
		HttpSession session = request.getSession();
		session.setAttribute("member", user.getMember());	//로그인 정보 세션 설정
		
		return "login/logintest";
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

	@RequestMapping(value = "/access_denied_page")
	public String accessDeniedPage() throws Exception {
		return "login/access_denied_page";
	}

	@RequestMapping("login/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		System.out.println("로갓");

		return "login";
	}

}
