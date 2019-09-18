package com.bitcamp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;

	@RequestMapping("order/order/{list_no}")
	public String order(@PathVariable int list_no, HttpSession session, Model model) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		String list_image_loc = service.findImage(list_no).get(0);
		model.addAttribute("list_image_loc", list_image_loc);
		if (memberDTO != null) {
			return "order/order.mall";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping("order/orderResult")
	public String success(HttpSession session, @RequestParam String name, @RequestParam String call,
			@RequestParam String address1, @RequestParam String address2) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");
		String address = address1 + " " + address2;
		service.buyProduct(memberDTO.getMember_no(), orderDTO);
		service.updateUserInfo(memberDTO.getMember_no(), name, call, address);
		return "order/orderResult.mall";
	}

	@RequestMapping("support/{artist_no}")
	public String support(Principal prin, HttpSession session, @PathVariable int artist_no) {
		return "redirect:/artistDetail/" + artist_no;
	}

	@RequestMapping("order/popup/jusoPopup")
	public String addressAPI() {
		return "order/popup/jusoPopup";
	}
}
