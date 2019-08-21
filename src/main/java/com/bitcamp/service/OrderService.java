package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.meta.TypeQualifier;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.mapper.OrderMapper;

@Service("orderService")
public class OrderService {
	@Autowired
	OrderMapper mapper;

	public List<String> findImage(int list_no) {
		// TODO Auto-generated method stub
		return mapper.findImage(list_no);
	}

	@Transactional
	public void buyProduct(int member_no, OrderDTO orderDTO) {
		List<Integer> order_add_option = orderDTO.getOrder_add_option();
		List<Integer> order_amount = orderDTO.getOrder_amount();
		StringBuilder add_option = new StringBuilder();
		StringBuilder amount = new StringBuilder();
		List<Integer> list_order_no = orderDTO.getList_order_no();
		List<Integer> ordermade_no = orderDTO.getOrdermade_no();
		List<String> order_value = orderDTO.getOrder_value();
		StringBuilder made_no = new StringBuilder();
		add_option.append("X");
		amount.append("X");
		if (order_add_option != null) {
			for (int i = 0; i < order_add_option.size(); i++) {
				add_option.delete(0, add_option.length());
				amount.delete(0, amount.length());
				add_option.append(order_add_option.get(i));
				amount.append(order_amount.get(i));
				if (i < order_add_option.size() - 1) {
					add_option.append("/");
					amount.append("/");
				}
			}
		}
		if (list_order_no != null) {
			for (int i = 0; i < list_order_no.size(); i++) {
				made_no.append(ordermade_no.get(i));
				if (i < list_order_no.size() - 1) {
					made_no.append("/");
				}
			}
		}

		List<Map<String, Integer>> option = new ArrayList<>();
		if (order_add_option != null) {
			for (int i = 0; i < order_add_option.size(); i++) {
				Map<String, Integer> noStock = new HashMap<>();
				noStock.put("order_add_option", order_add_option.get(i));
				noStock.put("order_amount", order_amount.get(i));
				option.add(noStock);
			}
		}

		Map<String, Object> parameters = new HashMap<>();
		parameters.put("list_no", orderDTO.getList_no());
		parameters.put("member_no", member_no);
		parameters.put("order_price", orderDTO.getOrder_price());
		parameters.put("order_add_option", add_option.toString());
		parameters.put("order_amount", amount.toString());
		parameters.put("order_date", orderDTO.getOrder_date());
		parameters.put("ordermade_no", made_no.toString());
		mapper.insertOrder(parameters);

		mapper.updateBuy_count(orderDTO.getList_no());

		if (order_add_option != null) {
			for (Map<String, Integer> noStock : option) {
				mapper.updateOption_stock(noStock);
			}
		}
	}

	@Transactional
	public void updateUserInfo(int member_no, String user_name, String user_call, String user_address) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("member_no", member_no);
		parameters.put("user_name", user_name);
		parameters.put("user_call", user_call);
		parameters.put("user_address", user_address);
		mapper.updateName(parameters);
		mapper.updateCall(parameters);
		mapper.updateAddress(parameters);
	}
}
