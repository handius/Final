package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mapper.MyPageMapper;

@Service("myPageService")
public class MyPageService {
	@Autowired
	MyPageMapper mapper;
	
	public void updateUserInfo() {
		
	}
}
