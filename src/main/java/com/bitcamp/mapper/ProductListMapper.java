package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.Product.ProductDTO;

public interface ProductListMapper {
	public List<ProductDTO> getList(HashMap<String,Object> listData);
	/*public int getCount(HashMap<String, Object> countData);*/
	
	/*public int insertPerfectOrderData(ListDTO dto);
	public int insertOrderMadeData(ListDTO dto);
	public int insertListMainImages(HashMap<String, Object> imageData);
	public int insertListHashTag(HashMap<String, Object> hashData);
	public int insertListOptionData(HashMap<String, Object> optionData);
	public int insertOrderData(HashMap<String, Object> orderData);
	public int insertOrderOptionData(HashMap<String, Object> orderOptionData);*/
}
