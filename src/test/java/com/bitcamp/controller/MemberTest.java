package com.bitcamp.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.comm.DBConfigration;
import com.bitcamp.mapper.MemberMapper;
import com.bitcamp.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfigration.class,ProductService.class})
public class MemberTest {

	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void te() {
		System.out.println(mapper.readMember("aaaa4"));
	}
}
