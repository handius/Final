package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mapper.JoinMapper;

@Service("joinService")
public class JoinService {

	@Autowired
	JoinMapper joinMapper;
	
	public int userIdCheck(String user_id) {
		return 1;
	}

}
