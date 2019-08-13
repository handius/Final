package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.mapper.FreeboardMapper;

@Service("freeboardService")
public class FreeboardService {
	
	@Autowired
	private FreeboardMapper fbMapper;

	public void writeService(FreeboardDTO dto) {
		fbMapper.insertData(dto);
	}
	
}
