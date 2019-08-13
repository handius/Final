package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.mapper.MemberMapper;

@Service("memberService")
public class MemberService {

	@Autowired
	private MemberMapper mem;
	
	public MemberDTO getMemberDTO(int member_no) {
		return mem.readMemberbyMemberNo(member_no);
	}
	
}
