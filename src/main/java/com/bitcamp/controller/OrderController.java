package com.bitcamp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;

	// @RequestMapping("order/order/{list_no}")
	// public String a(@PathVariable int list_no) {
	// return "order/order";
	// }

	// @RequestMapping("order/orderResult")
	// public String success(OrderDTO orderDTO) {
	// service.buyProduct(orderDTO);
	// return "order/orderResult";
	// }

	@RequestMapping("please")
	public String please() {
		return "order/test";
	}

	@RequestMapping("test")
	public String success(String user_name, String user_call, String user_address) {
		OrderDTO orderDTO = new OrderDTO();
		ArrayList<Integer> al1 = new ArrayList<>();
		al1.add(1);
		al1.add(2);
		al1.add(3);
		ArrayList<String> al2 = new ArrayList<>();
		al2.add("a");
		al2.add("b");
		al2.add("c");
		orderDTO.setOrder_no(1);
		orderDTO.setList_no(1);
		orderDTO.setMember_no(1);
		orderDTO.setOrder_price(100);
		orderDTO.setOrder_add_option(al1);
		orderDTO.setOrder_amount(al1);
		orderDTO.setOrder_date("20190809");
		orderDTO.setOrdermade_no(al1);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_no(1);
		service.buyProduct(orderDTO);
//		service.updateUserInfo(memberDTO.getMember_no(), user_name, user_call, user_address);
		return "order/orderResult";
	}
}
