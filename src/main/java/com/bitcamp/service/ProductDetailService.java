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
import com.bitcamp.DTO.productdetail.ProductDetailOptionListDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.comm.ScrollCalculation;
import com.bitcamp.mapper.ProductDetailMapper;

@Service("productDetailService")
public class ProductDetailService {

	@Autowired
	private ProductDetailMapper mapper;

	@Transactional
	public Map<String, Object> productDetailService(int list_no) {
		Map<String, Object> map = new HashMap<>();
		ListDTO listdto = mapper.productDetailGet(list_no);
		List<ProductDetailOptionListDTO> optionList = mapper.productDetailOptionGet(list_no);

		// 옵션의 재고가 0일때 해당 재고 이름을 재고 없음으로 표시
		for (int i = 0; i < optionList.size(); i++) {
			ProductDetailOptionListDTO option = optionList.get(i);
			if (option.getOption_stock() <= 0) {
				option.setOption_name("재고가 없습니다");
				optionList.set(i, option);
			}
		}

		// 작가정보에서 없는값을 매꿈
		MemberDTO memberdto = mapper.productDetailArtistGet(listdto.getList_artist());
		//작가 페이지 번호 기본값
		int artist_no = 0;
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
			
			Object objArtistNo = mapper.productDetailArtistBoardGet(memberdto.getMember_no());
			if(objArtistNo != null) {
				artist_no = (int)objArtistNo;
			}
		}
		map.put("productDetail", listdto);
		map.put("productDetailImg", mapper.productDetailImgGet(list_no));
		map.put("productDetailOption", optionList);
		map.put("productDetailArtistInfo", memberdto);
		map.put("productDetailArtistBoardNo", artist_no);
		return map;
	}
	
	public String productDelete(HashMap<String, Object> hashmap) {
		String resultMessage = "삭제 실패";
		mapper.productDelete(hashmap);
		int list_no = Integer.parseInt(hashmap.get("list_no").toString());
		int deleteResult = mapper.productDeleteCheck(list_no);
		
		if(deleteResult == 0) {
			resultMessage = "삭제 성공";
		}
		return resultMessage;
	}

	@Transactional
	public int productDetailQandAInsertService(QABoardDTO qaboarddto) {
		int qa_board_no = mapper.productDetailQandAInsertSeq();
		qaboarddto.setQa_board_no(qa_board_no);
		mapper.productDetailQandAInsert(qaboarddto);
		return mapper.productDetailQandAInsertCheck(qa_board_no);
	}

	public Map<String, Object> productDetailQandAListService(Map<String, Object> map) {
		int list_no = Integer.parseInt(map.get("list_no").toString());
		int currentPage = Integer.parseInt(map.get("currentpage").toString());
		int sizeSql = 5;
		int maxSql = mapper.productDetailQandAListMaxCount(list_no);
		
		ScrollCalculation scroll = new ScrollCalculation(currentPage, sizeSql, maxSql);
		
		QABoardDTO dto = new QABoardDTO();
		dto.setList_no(list_no);
		dto.setStart_sql(scroll.startSql);
		dto.setEnd_sql(scroll.endSql);
		map.put("QABoardDTO", dto);
		
		List<QABoardDTO> qalist = mapper.productDetailQandAList(dto);
		
		Object objMemberNo = map.get("member_no");
		int member_no = -1;
		if(objMemberNo != null) {
			member_no = Integer.parseInt(objMemberNo.toString());
		}

		// 비밀글 항목이1 일때 내용만 비밀글 처리
		for (int i = 0; i < qalist.size(); i++) {
			
			//비밀글이지만 로그인한 회원이 쓴글은 비밀글 처리를 하지 않음
			if (qalist.get(i).getQa_board_secret() == 1 && qalist.get(i).getMember_no() != member_no) {
				qalist.get(i).setQa_board_content("비밀글 입니다.");
			}
		}
		
		map.put("qalist", qalist);
		map.put("maxSql", maxSql);
		map.put("endSql", scroll.endSql);

		return map;
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
	
	public Map<String, Object> productDetailBuyReviewListService(Map<String, Object> map) {
		int list_no = Integer.parseInt(map.get("list_no").toString());
		int currentPage = Integer.parseInt(map.get("currentpage").toString());
		int sqlSize = 3;
		int maxSql = mapper.productDetailBuyReviewListMaxCount(list_no);
		
		ScrollCalculation scroll = new ScrollCalculation(currentPage, sqlSize, maxSql);
		
		BuyReviewDTO dto = new BuyReviewDTO();
		dto.setList_no(list_no);
		dto.setStart_sql(scroll.getStartSql());
		dto.setEnd_sql(scroll.getEndSql());		
		List<BuyReviewDTO> listBuyReview = mapper.productDetailBuyReviewList(dto);
		
		map.put("listBuyReview", listBuyReview);
		map.put("endSql", scroll.endSql);
		map.put("maxSql", maxSql);
		
		return map;
	}
}
