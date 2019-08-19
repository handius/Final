package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.VO.admin.NewMemberVO;

public interface AdminMapper {
	
	public int getMemberCount(HashMap<String, Object> search_map);
	public List<MemberDTO> getMemberList(HashMap<String, Object> map);
	public MemberDTO getMemberDetail(int memberno);
	public int updateMemberStatus(int memberno);
	public int getQuestionCount(HashMap<String, Object> search_map);
	public List<CustomerQABoardDTO> getQuestionList(HashMap<String, Object> search_map);
	public CustomerQABoardDTO getQnADetail(int questionno);
	public int deleteQuestion(int questionno);
	public int updateAnswerContent(HashMap<String, Object> update_map);
	public int modifyAnswerContent(HashMap<String, Object> update_map);
	public void deleteAllQuestion(String string);
	public List<NewMemberVO> getNewMemberList(HashMap<String, Object> search_map);
	public int getNewMemberCount(String tochar);
	public int getProductCount(String tochar);
	public List<ListDTO> getPopularProductList(HashMap<String, Object> search_map);
}
