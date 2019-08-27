package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.member.AuthorityDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.mapper.MemberMapper;

import lombok.Setter;

@Service("memberService")
public class MemberService {

	private MemberMapper mem;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwdEncoder;

	public MemberDTO getMemberDTO(int member_no) {
		return mem.readMemberbyMemberNo(member_no);
	}

	public String searchID(MemberDTO dto) {
		String id = mem.searchID(dto);

		if (id == null) {
			id = "일치하는 정보가 없습니다.";
			System.out.println(id);
			return id;
		} else {
			StringBuilder newID = new StringBuilder(id);
			newID.setCharAt(4, '*');
			id = "회원님의 아이디는 " + newID.toString() + " 입니다.";
		}
		System.out.println(id);
		return id;
	}

	public int searchPassword(MemberDTO dto) {
		return mem.searchPwd(dto);
	}

	public void changePassword(MemberDTO dto) {
		String newPwd = pwdEncoder.encode(dto.getUser_password());
		dto.setUser_password(newPwd);
		System.out.println("새로운 패스워드");
		System.out.println(newPwd);
		mem.updatePassword(dto);
	}

	public void authInsertService(AuthorityDTO dto) {
		// dto에 member_no, user_auth set
		mem.insertAuth(dto);
	}

	public void authDeleteService(AuthorityDTO dto) {
		// dto에 member_no, user_auth set
		mem.deleteAuth(dto);
	}

	public boolean checkAuth(MemberDTO dto, String auth) {
		for (AuthorityDTO data : dto.getAuthorityList()) {
			if (data.getUser_auth().equals("ROLE_ADMIN"))
				return true;
		}
		return false;
	}
}
