package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.Product.OptionDTO;
import com.bitcamp.mapper.ProductDetailMapper;

@Service("productDetailService")
public class ProductDetailService {
	
	@Autowired
	private ProductDetailMapper mapper;
	
	public Map<String, Object> productDetailService(int list_no) {
		Map<String, Object> map = new HashMap<>();
		List<OptionDTO> optionList = mapper.productDetailOptionGet(list_no);
		
		//옵션의 재고가 0일때 해당 재고 이름을 재고 없음으로 표시
		for(int i=0; i<optionList.size(); i++) {
			OptionDTO option = optionList.get(i);
			if(option.getOption_stock() <= 0) {
				option.setOption_name("재고가 없습니다");
				optionList.set(i, option);
			}
		}
		
		map.put("productDetail", mapper.productDetailGet(list_no));
		map.put("productDetailImg", mapper.productDetailImgGet(list_no));
		map.put("productDetailOption", optionList);
		
		return map;
	}
}
