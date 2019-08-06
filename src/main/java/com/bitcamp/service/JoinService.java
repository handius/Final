package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DAO.MailCertDAO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.mapper.JoinMapper;

@Service("joinService")
public class JoinService {

	@Autowired
	JoinMapper joinMapper;
	
	@Autowired
	private MailCertDAO mailCertDAO;

	public int userIdCheckService(String user_id) {	//중복 ID 체크
		return joinMapper.userIdCheck(user_id);
	}

	public void userRegisterService(String user_id, String user_password, String user_name, String user_email, String user_address) {
		
		System.out.println("ddddddddd");
		System.out.println(user_id+ user_password+ user_name+user_email+user_address);
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(user_id);
		dto.setUser_password(user_password);	//암호화 해야됨
		dto.setUser_name(user_name);
		dto.setUser_email(user_email);
		dto.setUser_address(user_address);
		dto.setUser_certStatus(0);
		dto.setUser_certKey(mailCertDAO.createKey());
		
	}
	

}
