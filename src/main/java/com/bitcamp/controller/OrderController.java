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
	public String a(@PathVariable int list_no) {
		return "order/order";
	}

	@RequestMapping("order/orderResult")
	public String success(OrderDTO orderDTO) {
		service.buyProduct(orderDTO);
		return "order/orderResult";
	}

	// @RequestMapping("please")
	// public String please() {
	// return "order/test";
	// }
	//
	// @RequestMapping("p1")
	// public String success(@RequestParam String user_name, @RequestParam String
	// user_call,
	// @RequestParam String user_address) {
	// OrderDTO orderDTO = new OrderDTO();
	// ArrayList<Integer> al1 = new ArrayList<>();
	// al1.add(84);
	// al1.add(85);
	// al1.add(86);
	// ArrayList<Integer> al2 = new ArrayList<>();
	// al2.add(5);
	// al2.add(1);
	// al2.add(1);
	// ArrayList<String> al3 = new ArrayList<>();
	// al3.add("a");
	// al3.add("b");
	// al3.add("c");
	// orderDTO.setOrder_no(1);
	// orderDTO.setList_no(1);
	// orderDTO.setMember_no(1);
	// orderDTO.setOrder_price(100);
	// orderDTO.setOrder_add_option(al1);
	// orderDTO.setOrder_amount(al2);
	// orderDTO.setOrdermade_no(al1);
	// MemberDTO memberDTO = new MemberDTO();
	// memberDTO.setMember_no(1);
	// service.buyProduct(orderDTO);
	// service.updateUserInfo(memberDTO.getMember_no(), user_name, user_call,
	// user_address);
	// return "order/orderResult";
	// }
}
