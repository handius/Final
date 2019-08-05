package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.mapper.ProductListMapper;

@Service("service")
public class ProductService {
	/*@Autowired
	private ProductListMapper mapper;*/
	
	/*public List<ListDTO> getListService(String searchType, String searchData, PageDTO dto, String list_category, List<String> hashTag, Boolean hasStock, int status){
		return null;
	}
	
	public int getCountService(String searchType, String searchData, String list_category, List<String> hashTag, Boolean hasStock, int status) {
		return 0;
	}
	
	public int insertPerfectOrderDataService(ListDTO dto) {
		return 0;
	}
	
	public int insertOrderMadeDataService(ListDTO dto) {
		return 0;
	}
	
	public int insertOrderOptionService(List<Integer> list_order_no, List<String> order_value) {
		return 0;
	}*/
}
