package com.bitcamp.DAO;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.bitcamp.DTO.member.MemberDTO;

import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;
	private MemberDTO member;

	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberDTO dto) {
		super(dto.getUser_id(), dto.getUser_password(), dto.getAuthorityList().stream().map(auth -> new SimpleGrantedAuthority(auth.getUser_auth())).collect(Collectors.toList()));
		this.member = dto;
	}

}
