package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

import com.bitcamp.DTO.order.OrderDTO;

public interface OrderMapper {

	void insertOrder(Map<String, Object> parameters);

	void updateOption_stock(String add_option, String amount);

	List<String> nameAddress(int member_no);

}
