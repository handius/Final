package com.bitcamp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bitcamp.DTO.Product.ListDTO;

@Service("productDetailService")
public class ProductDetailService {
	
	public List<ListDTO> productDetailService() {
		List<ListDTO> list = new ArrayList<>();
		return list;
	}
}
