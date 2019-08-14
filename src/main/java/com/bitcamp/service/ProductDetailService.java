package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.OptionDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.DTO.productdetail.OrderResultDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.mapper.ProductDetailMapper;

@Service("productDetailService")
public class ProductDetailService {

	@Autowired
	private ProductDetailMapper mapper;

	@Transactional
	public Map<String, Object> productDetailService(int list_no) {
		Map<String, Object> map = new HashMap<>();
		ListDTO listdto = mapper.productDetailGet(list_no);
		List<OptionDTO> optionList = mapper.productDetailOptionGet(list_no);

		// 옵션의 재고가 0일때 해당 재고 이름을 재고 없음으로 표시
		for (int i = 0; i < optionList.size(); i++) {
			OptionDTO option = optionList.get(i);
			if (option.getOption_stock() <= 0) {
				option.setOption_name("재고가 없습니다");
				optionList.set(i, option);
			}
		}

		// 작가정보에서 없는값을 매꿈
		MemberDTO memberdto = mapper.productDetailArtistGet(listdto.getList_artist());
		if (memberdto != null) {
			if (memberdto.getUser_name() == null) {
				memberdto.setUser_name("이름이 없습니다.");
			}
			if (memberdto.getUser_nick() == null) {
				memberdto.setUser_nick("닉네임이 없습니다.");
			}
			if (memberdto.getUser_call() == null) {
				memberdto.setUser_call("전화번호가 없습니다.");
			}
		}

		map.put("productDetail", listdto);
		map.put("productDetailImg", mapper.productDetailImgGet(list_no));
		map.put("productDetailOption", mapper.productDetailOptionGet(list_no));
		map.put("productDetailArtistInfo", memberdto);
		return map;
	}

	@Transactional
	public int productDetailQandAInsertService(QABoardDTO qaboarddto) {
		int qa_board_no = mapper.productDetailQandAInsertSeq();
		qaboarddto.setQa_board_no(qa_board_no);
		mapper.productDetailQandAInsert(qaboarddto);
		return mapper.productDetailQandAInsertCheck(qa_board_no);
	}

	public List<QABoardDTO> productDetailQandAList(QABoardDTO dto) {
		List<QABoardDTO> qalist = mapper.productDetailQandAList(dto);

		// 비밀글 항목이1 일때 내용만 비밀글 처리
		for (int i = 0; i < qalist.size(); i++) {
			if (qalist.get(i).getQa_board_secret() == 1) {
				qalist.get(i).setQa_board_content("비밀글 입니다.");
			}
		}

		return qalist;
	}
	
	public List<OrderResultDTO> productDetailOrderService(List<Integer> list_order_member_no) {
		return mapper.productDetailOrderResultList(list_order_member_no);
	}
	
	@Transactional
	public int buyReviewInsertService(BuyReviewDTO buyreviewdto) {
		int buy_review_no = mapper.buyReviewInsertSeq();
		buyreviewdto.setBuy_review_no(buy_review_no);
		mapper.buyReviewInsert(buyreviewdto);
		return mapper.buyReviewInsertCheck(buy_review_no);
	}
}
