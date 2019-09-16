package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.mypage.OrderOrderDTO;
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

	public void updateUser_password(int member_no, String newPwd) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("member_no", member_no);
		parameters.put("newPwd", newPwd);
		mapper.updateUser_password(parameters);
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

	public int getBuyCount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getBuyCount(listMap);
	}

	public Map<String, Object> getBuyList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		List<OrderDTO> buyList = mapper.getBuyList(listMap);
		List<String> buyListImage_loc = new ArrayList<>();
		List<List<OrderOrderDTO>> orderOrderList2 = new ArrayList<>();
		for (int i = 0; i < buyList.size(); i++) {
			String list_title = mapper.findList_title(buyList.get(i).getList_no());
			buyList.get(i).setList_title(list_title);
			List<String> image_loc = mapper.findImage_loc(buyList.get(i).getList_no());
			buyListImage_loc.add(image_loc.get(0));
			Map<String, Object> results = mapper.findOption(buyList.get(i).getOrder_no());
			String order_add_option = (String) results.get("ORDER_ADD_OPTION");
			String order_amount = (String) results.get("ORDER_AMOUNT");
			String ordermade_no = (String) results.get("ORDERMADE_NO");
			List<Integer> order_add_option_list = new ArrayList<>();
			List<Integer> order_amount_list = new ArrayList<>();
			List<Integer> ordermade_no_list = new ArrayList<>();
			List<String> option_name_list = new ArrayList<>();
			List<Integer> option_price_list = new ArrayList<>();
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
				// if (ordermade_no.contains("/")) {
				String[] ordermade_no_array = ordermade_no.split("/");
				List<OrderOrderDTO> orderOrderList1 = new ArrayList<>();
				for (int j = 0; j < ordermade_no_array.length; j++) {
					int ordermade_no_int = Integer.parseInt(ordermade_no_array[j]);
					ordermade_no_list.add(ordermade_no_int);
					orderOrderList1.add(mapper.findOrderOrderDTO(ordermade_no_int));
				}
				buyList.get(i).setOrdermade_no(ordermade_no_list);
				orderOrderList2.add(orderOrderList1);
				// }
			} else {
				List<OrderOrderDTO> orderOrderList1 = new ArrayList<>();
				orderOrderList1.add(new OrderOrderDTO());
				orderOrderList2.add(orderOrderList1);
			}
			for (int j = 0; j < order_add_option_list.size(); j++) {
				String option_name = mapper.findOption_name(order_add_option_list.get(j));
				int option_price = mapper.findOption_price(order_add_option_list.get(j));
				option_name_list.add(option_name);
				option_price_list.add(option_price);
			}
			buyList.get(i).setOption_name(option_name_list);
			buyList.get(i).setOption_price(option_price_list);
		}
		parameters.put("buyList", buyList);
		parameters.put("buyListImage_loc", buyListImage_loc);
		parameters.put("orderOrderList2", orderOrderList2);
		return parameters;
	}

	public int getBuyerPQACount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getBuyerPQACount(listMap);
	}

	public Map<String, Object> getBuyerPQAList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		List<QABoardDTO> buyerPQAList = mapper.getBuyerPQAList(listMap);
		List<String> list_title_list = new ArrayList<>();
		for (int i = 0; i < buyerPQAList.size(); i++) {
			String list_title = mapper.findList_title(buyerPQAList.get(i).getList_no());
			list_title_list.add(list_title);
		}
		parameters.put("buyerPQAList", buyerPQAList);
		parameters.put("list_title_list", list_title_list);
		return parameters;
	}

	public int getBuyerReviewCount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getBuyerReviewCount(listMap);
	}

	public Map<String, Object> getBuyerReviewList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		List<BuyReviewDTO> buyerReviewList = mapper.getBuyerReviewList(listMap);
		List<String> list_title_list = new ArrayList<>();
		for (int i = 0; i < buyerReviewList.size(); i++) {
			String list_title = mapper.findList_title(buyerReviewList.get(i).getList_no());
			list_title_list.add(list_title);
		}
		parameters.put("buyerReviewList", buyerReviewList);
		parameters.put("list_title_list", list_title_list);
		return parameters;
	}

	public int getRegisterCount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getRegisterCount(listMap);
	}

	public List<ListDTO> getRegisterList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getRegisterList(listMap);
	}

	public int getSellCount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getSellCount(listMap);
	}

	public Map<String, Object> getSellList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		List<OrderDTO> sellList = mapper.getSellList(listMap);
		List<MemberDTO> buyerList = new ArrayList<>();
		List<List<OrderOrderDTO>> orderOrderList2 = new ArrayList<>();
		for (int i = 0; i < sellList.size(); i++) {
			MemberDTO buyer = mapper.findBuyer(sellList.get(i).getMember_no());
			buyerList.add(buyer);
			Map<String, Object> results = mapper.findOption(sellList.get(i).getOrder_no());
			String order_add_option = (String) results.get("ORDER_ADD_OPTION");
			String order_amount = (String) results.get("ORDER_AMOUNT");
			String ordermade_no = (String) results.get("ORDERMADE_NO");
			List<Integer> order_add_option_list = new ArrayList<>();
			List<Integer> order_amount_list = new ArrayList<>();
			List<Integer> ordermade_no_list = new ArrayList<>();
			List<String> option_name_list = new ArrayList<>();
			List<Integer> option_price_list = new ArrayList<>();
			if (order_add_option.contains("/")) {
				String[] order_add_option_array = order_add_option.split("/");
				String[] order_amount_array = order_amount.split("/");
				for (int j = 0; j < order_add_option_array.length; j++) {
					order_add_option_list.add(Integer.parseInt(order_add_option_array[j]));
					order_amount_list.add(Integer.parseInt(order_amount_array[j]));
				}
				sellList.get(i).setOrder_add_option(order_add_option_list);
				sellList.get(i).setOrder_amount(order_amount_list);
			}
			if (ordermade_no != null) {
				// if (ordermade_no.contains("/")) {
				String[] ordermade_no_array = ordermade_no.split("/");
				List<OrderOrderDTO> orderOrderList1 = new ArrayList<>();
				for (int j = 0; j < ordermade_no_array.length; j++) {
					int ordermade_no_int = Integer.parseInt(ordermade_no_array[j]);
					ordermade_no_list.add(ordermade_no_int);
					orderOrderList1.add(mapper.findOrderOrderDTO(ordermade_no_int));
				}
				sellList.get(i).setOrdermade_no(ordermade_no_list);
				orderOrderList2.add(orderOrderList1);
				// }
			} else {
				List<OrderOrderDTO> orderOrderList1 = new ArrayList<>();
				orderOrderList1.add(new OrderOrderDTO());
				orderOrderList2.add(orderOrderList1);
			}
			for (int j = 0; j < order_add_option_list.size(); j++) {
				String option_name = mapper.findOption_name(order_add_option_list.get(j));
				int option_price = mapper.findOption_price(order_add_option_list.get(j));
				option_name_list.add(option_name);
				option_price_list.add(option_price);
			}
			sellList.get(i).setOption_name(option_name_list);
			sellList.get(i).setOption_price(option_price_list);
		}
		parameters.put("sellList", sellList);
		parameters.put("buyerList", buyerList);
		parameters.put("orderOrderList2", orderOrderList2);
		return parameters;
	}

	public int getSellerPQACount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getSellerPQACount(listMap);
	}

	public Map<String, Object> getSellerPQAList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		List<QABoardDTO> sellerPQAList = mapper.getSellerPQAList(listMap);
		List<String> list_title_list = new ArrayList<>();
		for (int i = 0; i < sellerPQAList.size(); i++) {
			String list_title = mapper.findList_title(sellerPQAList.get(i).getList_no());
			list_title_list.add(list_title);
			// BuyReviewDTO 사용을 위해 user_name에 user_id를 set함
			String user_id = mapper.findBuyer(sellerPQAList.get(i).getMember_no()).getUser_id();
			sellerPQAList.get(i).setUser_name(user_id);
		}
		parameters.put("sellerPQAList", sellerPQAList);
		parameters.put("list_title_list", list_title_list);
		return parameters;
	}

	public int getSellerReviewCount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getSellerReviewCount(listMap);
	}

	public Map<String, Object> getSellerReviewList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		List<BuyReviewDTO> sellerReviewList = mapper.getSellerReviewList(listMap);
		List<String> list_title_list = new ArrayList<>();
		for (int i = 0; i < sellerReviewList.size(); i++) {
			String list_title = mapper.findList_title(sellerReviewList.get(i).getList_no());
			list_title_list.add(list_title);
			// BuyReviewDTO 사용을 위해 user_name에 user_id를 set함
			String user_id = mapper.findBuyer(sellerReviewList.get(i).getMember_no()).getUser_id();
			sellerReviewList.get(i).setUser_name(user_id);
		}
		parameters.put("sellerReviewList", sellerReviewList);
		parameters.put("list_title_list", list_title_list);
		return parameters;
	}

	public MemberDTO findBuyer(int member_no) {
		return mapper.findBuyer(member_no);
	}

	public void cor(int order_no) {
		// TODO Auto-generated method stub
		mapper.cor(order_no);
	}

	@Transactional
	public int buyReviewInsertService(BuyReviewDTO buyreviewdto) {
		int buy_review_no = mapper.buyReviewInsertSeq();
		buyreviewdto.setBuy_review_no(buy_review_no);
		mapper.buyReviewInsert(buyreviewdto);
		mapper.pc(buyreviewdto.getOrder_no());
		return mapper.buyReviewInsertCheck(buy_review_no);
	}

	public OrderDTO findOrderDTO(int order_no) {
		return mapper.findOrderDTO(order_no);
	}

	public QABoardDTO findPA(int qa_board_no) {
		// TODO Auto-generated method stub
		return mapper.findPA(qa_board_no);
	}

	public QABoardDTO findQABoardDTO(int qa_board_no) {
		// TODO Auto-generated method stub
		return mapper.findQABoardDTO(qa_board_no);
	}

	public void updateQa_board_content(int qa_board_no, String qa_board_content) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("qa_board_no", qa_board_no);
		parameters.put("qa_board_content", qa_board_content);
		mapper.updateQa_board_content(parameters);
	}

	public void updateQa_board_delete_status(int qa_board_no) {
		// TODO Auto-generated method stub
		mapper.updateQa_board_delete_status(qa_board_no);
	}

	public BuyReviewDTO findBuyReviewDTO(int buy_review_no) {
		// TODO Auto-generated method stub
		return mapper.findBuyReviewDTO(buy_review_no);
	}

	public void updateBuy_review_content(int buy_review_no, String buy_review_content) {
		// TODO Auto-generated method stub
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("buy_review_no", buy_review_no);
		parameters.put("buy_review_content", buy_review_content);
		mapper.updateBuy_review_content(parameters);
	}

	public void updateBuy_review_status(int buy_review_no) {
		// TODO Auto-generated method stub
		mapper.updateBuy_review_status(buy_review_no);
	}

	public void updateList_status(int list_no) {
		// TODO Auto-generated method stub
		mapper.updateList_status(list_no);
	}

	public void sp(int order_no) {
		// TODO Auto-generated method stub
		mapper.sp(order_no);
	}

	public void updateQa_board_statusU(int qa_board_no) {
		// TODO Auto-generated method stub
		mapper.updateQa_board_statusU(qa_board_no);
	}

	public int getCQACount(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getCQACount(listMap);
	}

	public List<CustomerQABoardDTO> getCQAList(Map<String, Object> listMap) {
		// TODO Auto-generated method stub
		return mapper.getCQAList(listMap);
	}

	@Transactional
	public void insertPQA(int list_no, int member_no, String qa_board_content, int qa_board_parent_no) {
		// TODO Auto-generated method stub
		QABoardDTO qABoardDTO = new QABoardDTO();
		qABoardDTO.setList_no(list_no);
		qABoardDTO.setMember_no(member_no);
		qABoardDTO.setQa_board_content(qa_board_content);
		qABoardDTO.setQa_board_parent_no(qa_board_parent_no);
		mapper.insertPQA(qABoardDTO);
		mapper.updateQa_board_statusA(qa_board_parent_no);
	}

}
