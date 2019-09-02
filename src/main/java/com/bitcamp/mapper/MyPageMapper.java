package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.order.OrderDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;

public interface MyPageMapper {

	String findList_title(int list_no);

	Map<String, Object> findOption(int order_no);

	String findOption_name(int option_no);

	int findOption_price(int option_no);

	void withdraw(String user_id);

	void insertCQA(Map<String, Object> parameters);

	void updateUserInfo(MemberDTO memberDTO);

	void updateUser_password(Map<String, Object> parameters);

	List<QABoardDTO> buyerPQList(int member_no);

	List<BuyReviewDTO> buyerReviewList(int member_no);

	List<OrderDTO> sellList(String user_id);

	List<QABoardDTO> sellerPQAList(MemberDTO memberDTO);

	List<BuyReviewDTO> sellerReviewList(String user_id);

	MemberDTO findBuyer(int member_no);

	List<ListDTO> registerList(String user_id);

	void cor(int order_no);

	public int buyReviewInsertSeq();

	public void buyReviewInsert(BuyReviewDTO buyreviewdto);

	public int buyReviewInsertCheck(int buy_review_no);

	void pc(int order_no);

	OrderDTO findOrderDTO(int order_no);

	QABoardDTO findPA(int qa_board_no);

	QABoardDTO findQABoardDTO(int qa_board_no);

	void updateQa_board_content(Map<String, Object> parameters);

	void updateQa_board_delete_status(int qa_board_no);

	BuyReviewDTO findBuyReviewDTO(int buy_review_no);

	void updateBuy_review_content(Map<String, Object> parameters);

	void updateBuy_review_status(int buy_review_no);

	void updateList_status(int list_no);

	void sp(int order_no);

	int getBuyCount(Map<String, Object> listMap);

	List<OrderDTO> getBuyList(Map<String, Object> listMap);

	int getCQACount(Map<String, Object> listMap);

	List<CustomerQABoardDTO> getCQAList(Map<String, Object> listMap);

	void insertPQA(QABoardDTO qABoardDTO);

	void updateQa_board_statusU(int qa_board_no);

	void updateQa_board_statusA(int qa_board_no);
}
