package com.bitcamp.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
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

import com.bitcamp.DTO.Product.OrderOptionDTO;
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
		HashMap<String, Object> orderData = new HashMap<String, Object>();
		List<OrderOptionDTO> ordto = new ArrayList<>();
		OrderOptionDTO temp = new OrderOptionDTO();
			temp.setOrder_name("testor");
			temp.setOrder_option("picture");
			ordto.add(temp);
			orderData.put("list_order", ordto);
			int ordresult = mapper.insertOrderData(orderData);
			
		assertNotEquals(ordresult, 0);
	}
	
	
}
