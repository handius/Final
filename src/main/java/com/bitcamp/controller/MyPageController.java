package com.bitcamp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;

	@RequestMapping("myPage")
	public String myPage(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/myPage";
	}

	@RequestMapping("pWCheck")
	public String pWCheck(Authentication authentication, @RequestParam String password) {
		return "mypage/pWCheck";
	}

	@RequestMapping("pWCheckResult")
	public String pWCheckResult(Authentication authentication, @RequestParam String password) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		boolean result = service.pWCheck(memberDTO.getUser_id(), password);
		if (result) {
			return "redirect:userInfo";
		} else {
			return "redirect:pWCheck";
		}
	}

	@RequestMapping("userInfo")
	public String userInfo(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		model.addAttribute("memberDTO", memberDTO);
		return "mypage/userInfo";
	}

	@RequestMapping("userInfoResult")
	public String userInfoResult(Authentication authentication, @RequestParam String password,
			@RequestParam String name, @RequestParam String nick, @RequestParam String email,
			@RequestParam String address, @RequestParam String call) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		memberDTO.setUser_password(password);
		memberDTO.setUser_name(name);
		memberDTO.setUser_nick(nick);
		memberDTO.setUser_email(email);
		memberDTO.setUser_address(address);
		memberDTO.setUser_call(call);
		service.updateUserInfo(memberDTO);
		return "mypage/userInfoResult";
	}

	@RequestMapping("customerQA")
	public String customerQA(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/customerQA";
	}

	@RequestMapping("customerQAResult")
	public String customerQAResult(Authentication authentication, @RequestParam String question_type,
			@RequestParam String question_title, @RequestParam String question_content) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		service.insertCQA(memberDTO.getMember_no(), question_type, question_title, question_content);
		return "redirect:myPage";
	}

	@RequestMapping("withdraw")
	public String withdraw(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		service.withdraw(memberDTO.getUser_id());
		return "redirect:myPage";
	}

	@RequestMapping("buyList")
	public String buyList(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		List<OrderDTO> buyList = service.buyList(memberDTO.getMember_no());
		model.addAttribute("buyList", buyList);
		return "mypage/buyList";
	}

	@RequestMapping("cQAList")
	public String cQAList(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		List<CustomerQABoardDTO> cQAList = service.cQAList(memberDTO.getMember_no());
		model.addAttribute("cQAList", cQAList);
		return "mypage/cQAList";
	}

	@RequestMapping("buyerPQAList")
	public String buyerPQAList(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		List<QABoardDTO> buyerPQAList = service.buyerPQAList(memberDTO.getMember_no());
		model.addAttribute("buyerPQAList", buyerPQAList);
		return "mypage/buyerPQAList";
	}

	@RequestMapping("buyerReviewList")
	public String buyerReviewList(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		List<BuyReviewDTO> buyerReviewList = service.buyerReviewList(memberDTO.getMember_no());
		model.addAttribute("buyerReviewList", buyerReviewList);
		return "mypage/buyerReviewList";
	}

	@RequestMapping("sellList")
	public String sellList(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		List<OrderDTO> sellList = service.sellList(memberDTO.getUser_id());
		model.addAttribute("sellList", sellList);
		return "mypage/sellList";
	}

	@RequestMapping("sellerPQAList")
	public String sellerPQAList(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		List<QABoardDTO> sellerPQAList = service.sellerPQAList(memberDTO.getUser_id());
		model.addAttribute("sellerPQAList", sellerPQAList);
		return "mypage/sellerPQAList";
	}

	@RequestMapping("sellerReviewList")
	public String sellerReviewList(Authentication authentication, Model model) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		List<BuyReviewDTO> sellerReviewList = service.sellerReviewList(memberDTO.getUser_id());
		model.addAttribute("sellerReviewList", sellerReviewList);
		return "mypage/sellerReviewList";
	}
}
