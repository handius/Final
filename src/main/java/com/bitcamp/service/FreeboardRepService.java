package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.freeboard.FreeboardRepDTO;
import com.bitcamp.mapper.FreeboardRepMapper;

@Service("freeboardRepService")
public class FreeboardRepService {

	@Autowired
	private FreeboardRepMapper mapper;
	
	public void saveReply(FreeboardRepDTO repDTO) {
		mapper.insertData(repDTO);
	}

}
