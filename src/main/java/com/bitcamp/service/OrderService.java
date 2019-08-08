package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.mapper.OrderMapper;

@Service("orderService")
public class OrderService {
	@Autowired
	OrderMapper mapper;

	@Transactional
	public void buyProduct(OrderDTO orderDTO) {
		List<Integer> order_add_option = orderDTO.getOrder_add_option();
		List<Integer> order_amount = orderDTO.getOrder_amount();
		String add_option = "";
		String amount = "";
		for (int i = 0; i < order_add_option.size(); i++) {
			add_option = add_option + order_add_option.get(i);
			amount = amount + order_amount.get(i);
			if (i < order_add_option.size() - 1) {
				amount = amount + ",";
			}
		}
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("list_no", orderDTO.getList_no());
		parameters.put("member_no", orderDTO.getMember_no());
		parameters.put("order_price", orderDTO.getOrder_price());
		parameters.put("order_add_option", add_option);
		parameters.put("order_amount", amount);
		parameters.put("order_date", orderDTO.getOrder_date());
		parameters.put("ordermade_no", orderDTO.getOrdermade_no());
		mapper.insertOrder(parameters);
		mapper.updateOption_stock(add_option, amount);
	}

	public void updateUserInfo(int member_no, String user_name, String user_address) {
		List<String> nameaddress = mapper.nameAddress(member_no);
//		mapper.updateUserInfo(user_name, user_address);
	}
}
