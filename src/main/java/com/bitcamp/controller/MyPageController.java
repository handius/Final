package com.bitcamp.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DAO.CustomUser;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.service.CustomUserDetailService;
import com.bitcamp.service.MyPageService;

import lombok.Setter;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;

	@Resource
	private CustomUserDetailService userService;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwdEncoder;

	@RequestMapping("myPage")
	public String myPage(Principal prin, HttpSession session) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		if (memberDTO != null) {
			return "mypage/myPage.mall";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping("pWCheck")
	public String pWCheck(HttpSession session) {
		return "mypage/pWCheck.mall";
	}

	@RequestMapping("pWCheckResult")
	public String pWCheckResult(Principal prin, HttpSession session, @RequestParam String password) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		boolean result = pwdEncoder.matches(password, memberDTO.getUser_password());
		if (result) {
			return "redirect:/userInfo";
		} else {
			return "redirect:/pWCheck";
		}
	}

	@RequestMapping("userInfo")
	public String userInfo(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		model.addAttribute("memberDTO", memberDTO);
		return "mypage/userInfo.mall";
	}

	@RequestMapping("userInfoResult")
	public String userInfoResult(Principal prin, HttpSession session, @RequestParam(value = "password") String password,
			@RequestParam(value = "user_name") String user_name, @RequestParam(value = "user_nick") String user_nick,
			@RequestParam(value = "user_email") String user_email,
			@RequestParam(value = "user_address") String user_address,
			@RequestParam(value = "user_call") String user_call) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		memberDTO.setUser_name(user_name);
		memberDTO.setUser_nick(user_nick);
		memberDTO.setUser_email(user_email);
		memberDTO.setUser_address(user_address);
		memberDTO.setUser_call(user_call);
		System.out.println(password);
		if (password != "") {
			String newPwd = pwdEncoder.encode(password);
			System.out.println(newPwd);
			service.updateUserPassword(memberDTO.getMember_no(), newPwd);
		}
		service.updateUserInfo(memberDTO);
		return "redirect:/myPage";
	}

	@RequestMapping("customerQA")
	public String customerQA(HttpSession session) {
		return "mypage/customerQA.mall";
	}

	@RequestMapping("customerQAResult")
	public String customerQAResult(Principal prin, HttpSession session, @RequestParam String question_type,
			@RequestParam String question_title, @RequestParam String question_content) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		service.insertCQA(memberDTO.getMember_no(), question_type, question_title, question_content);
		return "redirect:myPage";
	}

	@RequestMapping("withdraw")
	public String withdraw(Principal prin, HttpSession session) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		service.withdraw(memberDTO.getUser_id());
		return "redirect:login/logout";
	}

	@RequestMapping("buyList")
	public String buyList(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		List<OrderDTO> buyList = service.buyList(memberDTO.getMember_no());
		model.addAttribute("buyList", buyList);
		return "mypage/buyList.mall";
	}

	@RequestMapping("cQAList")
	public String cQAList(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		List<CustomerQABoardDTO> cQAList = service.cQAList(memberDTO.getMember_no());
		model.addAttribute("cQAList", cQAList);
		return "mypage/cQAList.mall";
	}

	@RequestMapping("buyerPQAList")
	public String buyerPQAList(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		Map<String, Object> parameters = service.buyerPQList(memberDTO.getMember_no());
		List<QABoardDTO> buyerPQList = (List<QABoardDTO>) parameters.get("buyerPQList");
		List<String> list_title_list = (List<String>) parameters.get("list_title_list");
		model.addAttribute("buyerPQList", buyerPQList);
		model.addAttribute("list_title_list", list_title_list);
		return "mypage/buyerPQAList.mall";
	}

	@RequestMapping("buyerReviewList")
	public String buyerReviewList(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		Map<String, Object> parameters = service.buyerReviewList(memberDTO.getMember_no());
		List<BuyReviewDTO> buyerReviewList = (List<BuyReviewDTO>) parameters.get("buyerReviewList");
		List<String> list_title_list = (List<String>) parameters.get("list_title_list");
		model.addAttribute("buyerReviewList", buyerReviewList);
		model.addAttribute("list_title_list", list_title_list);
		return "mypage/buyerReviewList";
	}

	@RequestMapping("sellList")
	public String sellList(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		List<OrderDTO> sellList = service.sellList(memberDTO.getUser_id());
		System.out.println(memberDTO.getUser_id());
		model.addAttribute("sellList", sellList);
		System.out.println(sellList);
		return "mypage/sellList.mall";
	}

	@RequestMapping("sellerPQAList")
	public String sellerPQAList(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		List<QABoardDTO> sellerPQAList = service.sellerPQAList(memberDTO.getUser_id());
		model.addAttribute("sellerPQAList", sellerPQAList);
		return "mypage/sellerPQAList";
	}

	@RequestMapping("sellerReviewList")
	public String sellerReviewList(Principal prin, HttpSession session, Model model) {
		// MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		MemberDTO memberDTO = user.getMember();
		List<BuyReviewDTO> sellerReviewList = service.sellerReviewList(memberDTO.getUser_id());
		model.addAttribute("sellerReviewList", sellerReviewList);
		return "mypage/sellerReviewList";
	}
}
