package com.bitcamp.mapper;

import java.util.List;
import java.util.Map;

import com.bitcamp.DTO.freeboard.FreeboardDTO;

public interface FreeboardMapper {

	public void insertData(FreeboardDTO dto);

	public List<FreeboardDTO> getList(String category);

	public FreeboardDTO getDetail(int freeboard_no);

	public void modifyData(FreeboardDTO dto);

	public void deleteData(int freeboard_no);

	public List<FreeboardDTO> getSearchList(Map<String, Object> search);
	
	public void updateHits(int freeboard_no);

}
