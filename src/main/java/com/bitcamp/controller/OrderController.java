package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@RequestMapping("order/order")
	public String a() {
		return "order/order";
	}

	@RequestMapping("order/payment")
	public String b() {
		return "order/payment";
	}

	@RequestMapping("order/success")
	public String c() {
		return "order/success";
	}

	@RequestMapping("order/failure")
	public String d() {
		return "order/failure";
	}
}
