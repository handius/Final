package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

import com.bitcamp.DTO.freeboard.FreeboardDTO;

public interface FreeboardMapper {

	public void insertData(FreeboardDTO dto);

	public List<FreeboardDTO> getList(String category);

	public List<FreeboardDTO> getSearchList(Map<String, String> search);

	public FreeboardDTO getDetail(int freeboard_no);

}
