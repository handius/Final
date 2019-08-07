package com.bitcamp.mapper;

import com.bitcamp.DTO.member.MemberDTO;

public interface JoinMapper {
	
	public int userIdCheck(String user_id);
	
	public void userRegister(MemberDTO dto);

	public int compareCertKey(MemberDTO dto);

	public int updateCertStatus(String user_id);
	
}
