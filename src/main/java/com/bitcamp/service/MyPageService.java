package com.bitcamp.service;

import java.util.ArrayList;
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
		List<OrderDTO> buyList = mapper.buyList(member_no);
		for (int i = 0; i < buyList.size(); i++) {
			String list_title = mapper.findList_title(buyList.get(i).getList_no());
			buyList.get(i).setList_title(list_title);
			Map<String, Object> results = mapper.buyListOption(buyList.get(i).getOrder_no());
			String order_add_option = (String) results.get("ORDER_ADD_OPTION");
			String order_amount = (String) results.get("ORDER_AMOUNT");
			String ordermade_no = (String) results.get("ORDERMADE_NO");
			List<Integer> order_add_option_list = new ArrayList<>();
			List<Integer> order_amount_list = new ArrayList<>();
			List<Integer> ordermade_no_list = new ArrayList<>();
			List<String> option_name_list = new ArrayList<>();
			if (order_add_option.contains("/")) {
				String[] order_add_option_array = order_add_option.split("/");
				String[] order_amount_array = order_amount.split("/");
				for (int j = 0; j < order_add_option_array.length; j++) {
					order_add_option_list.add(Integer.parseInt(order_add_option_array[j]));
					order_amount_list.add(Integer.parseInt(order_amount_array[j]));
				}
				buyList.get(i).setOrder_add_option(order_add_option_list);
				buyList.get(i).setOrder_amount(order_amount_list);
			}
			if (ordermade_no != null) {
				if (ordermade_no.contains("/")) {
					String[] ordermade_no_array = ordermade_no.split("/");
					for (int j = 0; j < ordermade_no_array.length; j++) {
						ordermade_no_list.add(Integer.parseInt(ordermade_no_array[j]));
					}
					buyList.get(i).setOrdermade_no(ordermade_no_list);
				}
			}
			for (int j = 0; j < order_add_option_list.size(); j++) {
				String option_name = mapper.buyListOption_name(order_add_option_list.get(j));
				option_name_list.add(option_name);
			}
			buyList.get(i).setOption_name(option_name_list);
		}
		return buyList;
	}

	public List<CustomerQABoardDTO> cQAList(int member_no) {
		// TODO Auto-generated method stub
		return mapper.cQAList(member_no);
	}

	public Map<String, Object> buyerPQList(int member_no) {
		// TODO Auto-generated method stub
		List<QABoardDTO> buyerPQList = mapper.buyerPQList(member_no);
		List<String> list_title_list = new ArrayList<>();
		Map<String, Object> parameters = new HashMap<>();
		for (int i = 0; i < buyerPQList.size(); i++) {
			String list_title = mapper.findList_title(buyerPQList.get(i).getList_no());
			list_title_list.add(list_title);
		}
		parameters.put("buyerPQList", buyerPQList);
		parameters.put("list_title_list", list_title_list);
		return parameters;
	}

	// public List<QABoardDTO> buyerPAList(List<QABoardDTO> buyerPQList) {
	// // TODO Auto-generated method stub
	// List<QABoardDTO> buyerPALists = new ArrayList<>();
	// for (int i = 0; i < buyerPQList.size(); i++) {
	// List<QABoardDTO> buyerPAList =
	// mapper.buyerPAList(buyerPQList.get(i).getQa_board_no());
	// for (int j = 0; j < buyerPAList.size(); j++) {
	// buyerPALists.add(buyerPAList.get(j));
	// }
	// }
	// return buyerPALists;
	// }

	public Map<String, Object> buyerReviewList(int member_no) {
		// TODO Auto-generated method stub
		List<BuyReviewDTO> buyerReviewList = mapper.buyerReviewList(member_no);
		List<String> list_title_list = new ArrayList<>();
		Map<String, Object> parameters = new HashMap<>();
		for (int i = 0; i < buyerReviewList.size(); i++) {
			String list_title = mapper.findList_title(buyerReviewList.get(i).getList_no());
			list_title_list.add(list_title);
		}
		parameters.put("buyerReviewList", buyerReviewList);
		parameters.put("list_title_list", list_title_list);
		return parameters;
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
