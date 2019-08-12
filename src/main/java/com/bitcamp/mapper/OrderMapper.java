package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.order.OrderDTO;

public interface OrderMapper {

	int insertOrder(Map<String, Object> parameters);

	void updateOption_stock(Map<String, Integer> option);

	void updateName(Map<String, Object> parameters);

	void updateCall(Map<String, Object> parameters);

	void updateAddress(Map<String, Object> parameters);
}
