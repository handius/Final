package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.member.MemberDTO;

public interface AdminMapper {
	
	public int getMemberCount(HashMap<String, Object> search_map);
	public List<MemberDTO> getMemberList(HashMap<String, Object> map);
	public MemberDTO getMemberDetail(int memberno);
	public int updateMemberStatus(int memberno);
}
