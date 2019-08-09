package com.bitcamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
