package com.bitcamp.controller;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.comm.DBConfigration;
import com.bitcamp.mapper.TestMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfigration.class})
public class ProductListTest {
	@Autowired
	private SqlSessionTemplate sqlsession;
	@Autowired
	private TestMapper mapper;
	
	@Test
	public void t1() {
		assertNotNull(sqlsession);
	}
}
