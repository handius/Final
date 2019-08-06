package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mapper.JoinMapper;

@Service("joinService")
public class JoinService {

	@Autowired
	JoinMapper joinMapper;
	
	public int userIdCheck(String user_id) {	//중복 ID 체크
		return joinMapper.userIdCheck(user_id);
	}

	public void userJoin(String id, String password, String name, String email, String address) {
		// TODO Auto-generated method stub
		
	}

}
