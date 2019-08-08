package com.bitcamp.mapper;

import java.util.Map;

import com.bitcamp.DTO.member.AuthorityDTO;
import com.bitcamp.DTO.member.MemberDTO;

public interface JoinMapper {
	
	public int userIdCheck(String user_id);
	
	public void userRegister(MemberDTO dto);
	public void userAuthRegister(int member_no);

	public int userSelect(String user_id);
	
	public int compareCertKey(MemberDTO dto);

	public int updateCertStatus(String user_id);
	public void updateMemberAuth(int member_no);





	
}
