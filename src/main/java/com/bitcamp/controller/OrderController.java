package com.bitcamp.controller;

import java.util.ArrayList;

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
	public String order(@PathVariable int list_no, HttpSession session) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		if (memberDTO != null) {
			return "order/order";
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping("order/orderResult")
	public String success(HttpSession session, @RequestParam String name, @RequestParam String call,
			@RequestParam String address) {
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		OrderDTO orderDTO = (OrderDTO) session.getAttribute("orderDTO");
		service.buyProduct(memberDTO.getMember_no(), orderDTO);
		service.updateUserInfo(memberDTO.getMember_no(), name, call, address);
		return "order/orderResult";
	}
}
