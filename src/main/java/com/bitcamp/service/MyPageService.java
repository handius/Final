package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.mapper.MyPageMapper;

@Service("myPageService")
public class MyPageService {
	@Autowired
	MyPageMapper mapper;

	public void updateUserInfo(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		mapper.updateUserInfo(memberDTO);
	}

	public void updateUserPassword(int member_no, String newPwd) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("member_no", member_no);
		parameters.put("newPwd", newPwd);
		mapper.updateUserPassword(parameters);
	}

	public void insertCQA(int member_no, String question_type, String question_title, String question_content) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("member_no", member_no);
		parameters.put("question_type", question_type);
		parameters.put("question_title", question_title);
		parameters.put("question_content", question_content);
		mapper.insertCQA(parameters);
	}

	public void withdraw(String user_id) {
		// TODO Auto-generated method stub
		mapper.withdraw(user_id);
	}

	public List<OrderDTO> buyList(int member_no) {
		// TODO Auto-generated method stub
		return mapper.buyList(member_no);
	}

	public List<CustomerQABoardDTO> cQAList(int member_no) {
		// TODO Auto-generated method stub
		return mapper.cQAList(member_no);
	}

	public List<QABoardDTO> buyerPQAList(int member_no) {
		// TODO Auto-generated method stub
		return mapper.buyerPQAList(member_no);
	}

	public List<BuyReviewDTO> buyerReviewList(int member_no) {
		// TODO Auto-generated method stub
		return mapper.buyerReviewList(member_no);
	}

	public List<OrderDTO> sellList(String user_id) {
		// TODO Auto-generated method stub
		return mapper.sellList(user_id);
	}

	public List<QABoardDTO> sellerPQAList(String user_id) {
		// TODO Auto-generated method stub
		return mapper.sellerPQAList(user_id);
	}

	public List<BuyReviewDTO> sellerReviewList(String user_id) {
		// TODO Auto-generated method stub
		return mapper.sellerReviewList(user_id);
	}

}
