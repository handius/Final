package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.Product.ListDTO;

public interface ProductListMapper {
	public List<ListDTO> getList(HashMap<String,Object> listData);
	public int getCount(HashMap<String, Object> countData);
	public List<String> getImages(int list_no);
	public List<String> getHash(String list_category);
	/*public int insertPerfectOrderData(ListDTO dto);
	public int insertOrderMadeData(ListDTO dto);
	public int insertListMainImages(HashMap<String, Object> imageData);
	public int insertListHashTag(HashMap<String, Object> hashData);
	public int insertListOptionData(HashMap<String, Object> optionData);
	public int insertOrderData(HashMap<String, Object> orderData);
	public int insertOrderOptionData(HashMap<String, Object> orderOptionData);*/
}
