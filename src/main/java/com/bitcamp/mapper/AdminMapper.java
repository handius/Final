package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;

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
}
