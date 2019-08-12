package com.bitcamp.controller;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.DTO.Product.searchTextDTO;
import com.bitcamp.comm.DBConfigration;
import com.bitcamp.mapper.ProductListMapper;
import com.bitcamp.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfigration.class,ProductService.class})
public class ProductTest {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	@Autowired
	private ProductListMapper mapper;
	@Autowired
	private ProductService service;
	@Test
	public void test() {
		
		assertNotNull(mapper);
		List<searchTextDTO> dtos = mapper.getSearchText();
		System.out.println(dtos);
			
		
	}
	
	
}
