package com.bitcamp.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.DAO.CustomUser;
import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.comm.DBConfigration;
import com.bitcamp.mapper.MemberMapper;
import com.bitcamp.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfigration.class,ProductService.class})
public class MemberTest {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private FreeboardDTO freeboard;
	
	@Test
	public void te() {
		System.out.println(mapper.readMember("user4").getMember_no());
		System.out.println("ddd");
//		System.out.println(user.getMember());
		System.out.println(mapper.readMemberbyMemberNo(101).getUser_id());
		
	}
}
