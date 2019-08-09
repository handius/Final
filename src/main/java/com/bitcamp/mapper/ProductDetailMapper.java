package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.DTO.Product.ListDTO;

public interface ProductDetailMapper {
	public ListDTO productDetailGet(int list_no);
	public List<String> productDetailImgGet(int list_no);
}
