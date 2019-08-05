package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.Product.ImageDTO;
import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.ProductDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.mapper.ProductListMapper;

@Service("service")
public class ProductService {
	/*@Autowired
	private ProductListMapper mapper;
	
	public List<ProductDTO> getListService(String searchType, String searchData, PageDTO dto, String list_category, List<String> hashTag, int hasStock, int status){
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("searchType", searchType);
		hashMap.put("searchData", searchData);
		hashMap.put("PageDTO", dto);
		hashMap.put("list_category", list_category);
		hashMap.put("hashTag", hashTag);
		hashMap.put("hasStock", hasStock);
		hashMap.put("status", status);
		List<ProductDTO> productList = mapper.getList(hashMap);
		return productList;
	}*/
	
	/*public int getCountService(String searchType, String searchData, String list_category, List<String> hashTag, Boolean hasStock, int status) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("searchType", searchType);
		hashMap.put("searchData", searchData);
		hashMap.put("list_category", list_category);
		hashMap.put("hashTag", hashTag);
		hashMap.put("hasStock", hasStock);
		hashMap.put("status", status);
		int productCount = mapper.getCount(hashMap);
		return productCount;
	}*/
	
	/*public int insertPerfectOrderDataService(ListDTO dto) {
		return 0;
	}
	
	public int insertOrderMadeDataService(ListDTO dto) {
		return 0;
	}
	
	public int insertOrderOptionService(List<Integer> list_order_no, List<String> order_value) {
		return 0;
	}*/
}
