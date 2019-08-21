package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

public interface OrderMapper {

	int insertOrder(Map<String, Object> parameters);

	void updateBuy_count(int list_no);

	void updateOption_stock(Map<String, Integer> option);

	void updateName(Map<String, Object> parameters);

	void updateCall(Map<String, Object> parameters);

	void updateAddress(Map<String, Object> parameters);

	List<String> findImage(int list_no);

}
