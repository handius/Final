package com.bitcamp.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.comm.DBConfigration;
import com.bitcamp.mapper.OrderMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { DBConfigration.class })
public class OrderTest {

	@Autowired
	private OrderMapper mapper;

	@Test
	public void p1() {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("list_no", 1);
		parameters.put("member_no", 1);
		parameters.put("order_price", 100);
		parameters.put("order_add_option", "1/2/3");
		parameters.put("order_amount", "1/2/3");
		parameters.put("ordermade_no", "1/2/3");
		assertEquals(0, mapper.insertOrder(parameters));
	}

}
