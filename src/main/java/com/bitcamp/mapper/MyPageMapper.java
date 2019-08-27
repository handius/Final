package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;

public interface MyPageMapper {

	String findList_title(int list_no);

	Map<String, Object> findOption(int order_no);

	String findOption_name(int option_no);

	void withdraw(String user_id);

	void insertCQA(Map<String, Object> parameters);

	void updateUserInfo(MemberDTO memberDTO);

	void updateUserPassword(Map<String, Object> parameters);

	List<OrderDTO> buyList(int member_no);

	List<CustomerQABoardDTO> cQAList(int member_no);

	List<QABoardDTO> buyerPQList(int member_no);

	List<BuyReviewDTO> buyerReviewList(int member_no);

	List<OrderDTO> sellList(String user_id);

	List<QABoardDTO> sellerPQAList(String user_id);

	List<BuyReviewDTO> sellerReviewList(String user_id);

	MemberDTO findBuyer(int member_no);

	List<ListDTO> registerList(String user_id);

	void cor(int order_no);

}
