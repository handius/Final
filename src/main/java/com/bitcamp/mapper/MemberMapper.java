package com.bitcamp.mapper;

import com.bitcamp.DTO.member.AuthorityDTO;
import com.bitcamp.DTO.member.MemberDTO;

public interface MemberMapper {
	public MemberDTO readMember(String user_id);
	
	public MemberDTO readMemberbyMemberNo(int member_no);

	public String searchID(MemberDTO dto);

	public int searchPwd(MemberDTO dto);

	public void updatePassword(MemberDTO dto);
	
	public void insertAuth(AuthorityDTO dto);
	
	public void deleteAuth(AuthorityDTO dto);
}
