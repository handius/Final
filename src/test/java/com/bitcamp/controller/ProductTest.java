package com.bitcamp.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.comm.PageDTO;
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
		String searchType = "artist";
		String searchData = "";
		String list_category = "book";
		List<String> hashTag = new ArrayList<>();
		
		PageDTO dto = new PageDTO();
		dto.setStartrow(1);
		dto.setEndrow(8);
		int hasStock = 1;
		int status = 1;
		List<ListDTO> pList = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status);
		int count = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status);
		System.out.println("카운트 : " + count );
		System.out.println(pList);
		assertNotNull(pList);
		assertEquals(count, 3);
	}
	
	
}
