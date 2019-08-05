package com.bitcamp.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.DTO.admin.MainViewDTO;
import com.bitcamp.comm.DBConfigration;
import com.bitcamp.mapper.TestMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DBConfigration.class})
public class JunitTest {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	@Autowired
	private TestMapper mapper;
	
	@Test
	public void test() {
/*		
 		MainViewDTO mainview = new MainViewDTO();
		mainview.setMain_view_no(2);
		mainview.setMain_view_name("test");
		mainview.setMain_view_use(1);
		mainview.setMain_view_product("products");
		int result = mapper.insertTest(mainview);
		assertEquals(1, result);
*/
		List<MainViewDTO> list = mapper.selectTest();
		assertEquals("products", list.get(0).getMain_view_product());
	}
	@Test
	public void sqlTest() {
		assertNotNull(sqlsession);
	}
}
