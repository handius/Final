package com.bitcamp.mapper;

import java.util.List;

import com.bitcamp.DTO.admin.MainViewDTO;

public interface TestMapper {
	public int insertTest(MainViewDTO mainview);
	public List<MainViewDTO> selectTest();
}
