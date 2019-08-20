package com.bitcamp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String myPage(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		if (memberDTO != null) {
			return "mypage/myPage";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping("pWCheck")
	public String pWCheck(HttpSession session, @RequestParam String password) {
		return "mypage/pWCheck";
	}

	@RequestMapping("pWCheckResult")
	public String pWCheckResult(HttpSession session, @RequestParam String password) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		boolean result = service.pWCheck(memberDTO.getUser_id(), password);
		if (result) {
			return "redirect:/userInfo";
		} else {
			return "redirect:/pWCheck";
		}
	}

	@RequestMapping("userInfo")
	public String userInfo(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		model.addAttribute("memberDTO", memberDTO);
		return "mypage/userInfo";
	}

	@RequestMapping("userInfoResult")
	public String userInfoResult(HttpSession session, @RequestParam String password, @RequestParam String name,
			@RequestParam String nick, @RequestParam String email, @RequestParam String address,
			@RequestParam String call) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
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
	public String customerQA(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		return "mypage/customerQA";
	}

	@RequestMapping("customerQAResult")
	public String customerQAResult(HttpSession session, @RequestParam String question_type,
			@RequestParam String question_title, @RequestParam String question_content) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		service.insertCQA(memberDTO.getMember_no(), question_type, question_title, question_content);
		return "redirect:myPage";
	}

	@RequestMapping("withdraw")
	public String withdraw(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		service.withdraw(memberDTO.getUser_id());
		return "redirect:myPage";
	}

	@RequestMapping("buyList")
	public String buyList(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<OrderDTO> buyList = service.buyList(memberDTO.getMember_no());
		model.addAttribute("buyList", buyList);
		return "mypage/buyList";
	}

	@RequestMapping("cQAList")
	public String cQAList(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<CustomerQABoardDTO> cQAList = service.cQAList(memberDTO.getMember_no());
		model.addAttribute("cQAList", cQAList);
		return "mypage/cQAList";
	}

	@RequestMapping("buyerPQAList")
	public String buyerPQAList(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<QABoardDTO> buyerPQAList = service.buyerPQAList(memberDTO.getMember_no());
		model.addAttribute("buyerPQAList", buyerPQAList);
		return "mypage/buyerPQAList";
	}

	@RequestMapping("buyerReviewList")
	public String buyerReviewList(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<BuyReviewDTO> buyerReviewList = service.buyerReviewList(memberDTO.getMember_no());
		model.addAttribute("buyerReviewList", buyerReviewList);
		return "mypage/buyerReviewList";
	}

	@RequestMapping("sellList")
	public String sellList(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<OrderDTO> sellList = service.sellList(memberDTO.getUser_id());
		model.addAttribute("sellList", sellList);
		return "mypage/sellList";
	}

	@RequestMapping("sellerPQAList")
	public String sellerPQAList(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<QABoardDTO> sellerPQAList = service.sellerPQAList(memberDTO.getUser_id());
		model.addAttribute("sellerPQAList", sellerPQAList);
		return "mypage/sellerPQAList";
	}

	@RequestMapping("sellerReviewList")
	public String sellerReviewList(HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		List<BuyReviewDTO> sellerReviewList = service.sellerReviewList(memberDTO.getUser_id());
		model.addAttribute("sellerReviewList", sellerReviewList);
		return "mypage/sellerReviewList";
	}
}
