package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.Product.OptionDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.mapper.ProductDetailMapper;

@Service("productDetailService")
public class ProductDetailService {
	
	@Autowired
	private ProductDetailMapper mapper;
	
	@Transactional
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
		
		QABoardDTO qadto = new QABoardDTO();
		qadto.setStart_sql(1);
		qadto.setEnd_sql(5);
		qadto.setList_no(list_no);
		List<QABoardDTO> qalist = mapper.productDetailQandAList(qadto);
		
		//비밀글 항목이1 일때 내용만 비밀글 처리
		for(int i=0; i<qalist.size(); i++) {
			if(qalist.get(i).getQa_board_secret() == 1) {
				qalist.get(i).setQa_board_content("비밀글 입니다.");
			}
		}
		
		map.put("productDetail", mapper.productDetailGet(list_no));
		map.put("productDetailImg", mapper.productDetailImgGet(list_no));
		map.put("productDetailOption", mapper.productDetailOptionGet(list_no));
		map.put("productDetailQABoardList", qalist);
		return map;
	}
	
	@Transactional
	public int productDetailQandAInsertService(QABoardDTO dto) {
		int qa_board_no = mapper.productDetailQandAInsert(dto);
		return mapper.productDetailQandAInsertCheck(qa_board_no);
	}
	
	public List<QABoardDTO> productDetailQandAList(QABoardDTO dto) {
		return mapper.productDetailQandAList(dto);
	}
}
