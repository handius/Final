package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public List<FreeboardDTO> listService(String category) {
		
		List<FreeboardDTO> dto = fbMapper.getList(category);
		
		return dto;
	}

	public List<FreeboardDTO> searchList(String search_type, String search_txt) {
		Map<String, String> search = new HashMap<>();
		search.put(search_type, search_txt);

		List<FreeboardDTO> dto = fbMapper.getSearchList(search);
		return dto;
	}

	public FreeboardDTO detailService(int freeboard_no) {
		FreeboardDTO dto = fbMapper.getDetail(freeboard_no);
		return dto;
	}

	public void modifyService(FreeboardDTO dto) {
		fbMapper.modifyData(dto);
	}

}
