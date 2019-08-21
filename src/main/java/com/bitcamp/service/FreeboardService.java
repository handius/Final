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

	public FreeboardDTO detailService(int freeboard_no) {
		FreeboardDTO dto = fbMapper.getDetail(freeboard_no);
		return dto;
	}

	public void modifyService(FreeboardDTO dto) {
		fbMapper.modifyData(dto);
	}

	public void deleteService(int freeboard_no) {
		fbMapper.deleteData(freeboard_no);
	}

	public List<FreeboardDTO> listService(String freeboard_category, String searchType, String searchKeyword) {
		if (!(freeboard_category.equals("전체"))) {
			return fbMapper.getList(freeboard_category);
		} else {
			Map<String, Object> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchKeyword", searchKeyword);

			return fbMapper.getSearchList(map);
		}
	}
	
	public void updateHitsService(int freeboard_no) {
		fbMapper.updateHits(freeboard_no);
	}

}
