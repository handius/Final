package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.bitcamp.DAO.CustomUser;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.mapper.MemberMapper;

import lombok.Setter;

public class CustomUserDetailService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

		// userName means user_id
		MemberDTO dto = mapper.readMember(userName);
		System.out.println("service입니다");

		return dto == null ? null : new CustomUser(dto);
	}

}
