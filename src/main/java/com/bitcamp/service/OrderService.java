package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mapper.OrderMapper;

@Service("orderService")
public class OrderService {
	@Autowired
	OrderMapper orderMapper;
}
