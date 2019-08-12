package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.OptionDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;

public interface ProductDetailMapper {
	public ListDTO productDetailGet(int list_no);
	public List<String> productDetailImgGet(int list_no);
	public List<OptionDTO> productDetailOptionGet(int list_no);
	public void productDetailQandAInsert(QABoardDTO dto);
	public List<QABoardDTO> productDetailQandAList(QABoardDTO dto);
}
