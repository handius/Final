package com.bitcamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@RequestMapping("order/order")
	public String a() {
		return "order/order";
	}

	@RequestMapping("order/success")
	public String b() {
		return "order/success";
	}

	@RequestMapping("order/failure")
	public String c() {
		return "order/failure";
	}
}
