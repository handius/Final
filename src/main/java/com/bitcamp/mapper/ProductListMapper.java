package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.OrderOptionDTO;
import com.bitcamp.DTO.Product.OrderValueDTO;
import com.bitcamp.DTO.Product.searchTextDTO;

public interface ProductListMapper {
	public List<ListDTO> getList(HashMap<String,Object> listData);
	public int getCount(HashMap<String, Object> countData);
	public List<String> getImages(int list_no);
	public List<String> getHash(int hashPage);
	public List<String> getHashSearch(String searchData);
	
	public int insertPerfectOrderData(ListDTO dto);
	public int insertListMainImages(HashMap<String, Object> imageData);
	public int insertListHashTag(HashMap<String, Object> hashData);
	public int insertListOptionData(HashMap<String, Object> optionData);
	public int insertOrderMadeData(ListDTO dto);
	public int insertOrderData(HashMap<String, Object> orderData);
	public List<String> getAllImages();
	public int insertOrderOptionData(OrderValueDTO orderValue);
	public ListDTO getNoList(int no);
	public List<OrderOptionDTO> getOrderOptionList(int no);
	public Integer getListOrderMember();
	public List<searchTextDTO> getSearchText();
	public int insertSearcher(String searchData);
}
