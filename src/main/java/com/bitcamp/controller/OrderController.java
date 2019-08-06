package com.bitcamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;

	@RequestMapping("order/order/{list_no}")
	public String a(@PathVariable int list_no, Model model) {
		return "order/order";
	}

	@RequestMapping("order/orderResult")
	public String success() {
		return "order/orderResult";
	}
}
