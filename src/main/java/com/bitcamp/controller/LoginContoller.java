package com.bitcamp.controller;

import java.security.Principal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login() {
		return "login/loginform";
	}

	@RequestMapping("searchID")
	public String searchID() {
		return "login/searchIDform.mall";
	}

	@RequestMapping("searchPassword")
	public String searchPassword() {
		return "login/searchPasswordform.mall";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request, Model model) {
		String user_id = request.getParameter("id");
		System.out.println("아이디");
		System.out.println(user_id);

		model.addAttribute("id", user_id);
		return "login/changePasswordform.mall";
	}

	@RequestMapping(value = "login/loginResult", method = RequestMethod.GET)
	public String loginResult(Principal prin, HttpServletRequest request) {
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		System.out.println(user.getMember());

		HttpSession session = request.getSession();
		session.setAttribute("member", user.getMember()); // 로그인 정보 세션 설정

		if (memberService.checkAuth(user.getMember(), "ROLE_ADMIN"))
			return "redirect:/admin";
		return "redirect:/";
	}

	@RequestMapping(value = "/searchIDResult", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String SearchIDResult(@ModelAttribute MemberDTO dto) {
		System.out.println("dddddd");
		System.out.println(dto.getUser_name());
		System.out.println(dto.getUser_email());
		String data = memberService.searchID(dto);
		return data;
	}

	@RequestMapping(value = "/searchPasswordResult", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int searchPasswordResult(@ModelAttribute MemberDTO dto) {
		System.out.println(memberService.searchPassword(dto));
		int data = memberService.searchPassword(dto);
		return data;
	}

	@RequestMapping(value = "/changePasswordResult", method = RequestMethod.POST)
	public String changePasswordChangeResult(@ModelAttribute MemberDTO dto) {
		memberService.changePassword(dto);
		return "redirect:/";
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

		return "redirect:/";
	}
}
