package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bitcamp.DTO.freeboard.FreeboardDTO;

public interface FreeboardMapper {

	public void insertData(FreeboardDTO dto);
	
	public int insertDataSequence();

	public FreeboardDTO getDetail(int freeboard_no);

	public void modifyData(FreeboardDTO dto);

	public void deleteData(int freeboard_no);

	public List<FreeboardDTO> getSearchList(HashMap<String, Object> listMap);
	
	public void updateHits(int freeboard_no);

	public int getListCount(HashMap<String, Object> listMap);

}
