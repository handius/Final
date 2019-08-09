package com.bitcamp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.OptionDTO;
import com.bitcamp.mapper.ProductDetailMapper;

@Service("productDetailService")
public class ProductDetailService {
	
	@Autowired
	private ProductDetailMapper mapper;
	
	public ListDTO productDetailService(int list_no) {
		return mapper.productDetailGet(list_no);
	}
	
	public List<String> productDetailImgGetService(int list_no) {
		return mapper.productDetailImgGet(list_no);
	}
	
	public List<OptionDTO> productDetailOptionGet(int list_no) {
		return mapper.productDetailOptionGet(list_no);
	}
}
