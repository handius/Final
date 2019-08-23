package com.bitcamp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
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

import lombok.Setter;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwdEncoder;

	@RequestMapping("myPage")
	public String myPage(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
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
	public String pWCheckResult(HttpSession session, @RequestParam String password) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		boolean result = pwdEncoder.matches(password, memberDTO.getUser_password());
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
		return "mypage/userInfo.mall";
	}

	@RequestMapping("userInfoResult")
	public String userInfoResult(HttpSession session, @RequestParam String password, @RequestParam String user_name,
			@RequestParam String user_nick, @RequestParam String user_email, @RequestParam String user_address,
			@RequestParam String user_call) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		memberDTO.setUser_name(user_name);
		memberDTO.setUser_nick(user_nick);
		memberDTO.setUser_email(user_email);
		memberDTO.setUser_address(user_address);
		memberDTO.setUser_call(user_call);
		if (password != null) {
			String newPwd = pwdEncoder.encode(password);
			service.updateUserPassword(memberDTO.getMember_no(), newPwd);
		}
		service.updateUserInfo(memberDTO);
		return "redirect:/myPage";
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
		return "redirect:login/logout";
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
		Map<String, Object> parameters = service.buyerPQList(memberDTO.getMember_no());
		List<QABoardDTO> buyerPQList = (List<QABoardDTO>) parameters.get("buyerPQList");
		List<String> list_title_list = (List<String>) parameters.get("list_title_list");
		// List<QABoardDTO> buyerPAList = service.buyerPAList(buyerPQList);
		model.addAttribute("buyerPQList", buyerPQList);
		model.addAttribute("list_title_list", list_title_list);
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
