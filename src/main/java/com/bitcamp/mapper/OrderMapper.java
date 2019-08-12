package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

import com.bitcamp.DTO.order.OrderDTO;

public interface OrderMapper {

	void insertOrder(Map<String, Object> parameters);

	void updateOption_stock(Map<Integer, Integer> option);

//	void updateName(Map<String, Object> parameters);

//	void updateCall(Map<String, Object> parameters);

//	void updateAddress(Map<String, Object> parameters);
}
