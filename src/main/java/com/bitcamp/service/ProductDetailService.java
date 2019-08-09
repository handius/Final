package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.mapper.ProductDetailMapper;

@Service("productDetailService")
public class ProductDetailService {
	
	@Autowired
	private ProductDetailMapper mapper;
	
	public ListDTO productDetailService(int list_no) {
		ListDTO dto = mapper.productDetailGet(list_no);
		return dto;
	}
	
	public List<String> productDetailImgGetService(int list_no) {
		List<String> list = mapper.productDetailImgGet(list_no);
		return list;
	}
}
