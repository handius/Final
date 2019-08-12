package com.bitcamp.mapper;

import com.bitcamp.DTO.member.MemberDTO;

public interface MemberMapper {
	public MemberDTO readMember(String user_id);
}
