package com.bitcamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;

	@RequestMapping("mypage")
	public String myPage(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/myPage";
	}

	@RequestMapping("userInfo")
	public String userInfo(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/userInfo";
	}
	
	@RequestMapping("userInfoResult")
	public String userInfoResult(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/userInfoResult";
	}

	@RequestMapping("buyList")
	public String buyList(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/buyList";
	}

	@RequestMapping("cQAList")
	public String cQAList(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/cQAList";
	}

	@RequestMapping("buyerPQAList")
	public String buyerPQAList(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/buyerPQAList";
	}

	@RequestMapping("buyerReviewList")
	public String buyerReviewList(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/buyerReviewList";
	}

	@RequestMapping("sellList")
	public String sellList(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/sellList";
	}

	@RequestMapping("sellerReviewList")
	public String sellerReviewList(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/sellerReviewList";
	}

	@RequestMapping("sellerPQAList")
	public String sellerPQAList(Authentication authentication) {
		MemberDTO memberDTO = (MemberDTO) authentication.getPrincipal();
		return "mypage/sellerPQAList";
	}
}
