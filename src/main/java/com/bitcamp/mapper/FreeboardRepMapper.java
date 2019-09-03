package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.freeboard.FreeboardRepDTO;

public interface FreeboardRepMapper {

	public void insertData(FreeboardRepDTO repDTO);

//	public List<FreeboardRepDTO> getData(int freeboard_no);
	public List<FreeboardRepDTO> getData(HashMap<String, Object> listMap);

	public void updateData(FreeboardRepDTO dto);
	
	public void deleteData(int rep_no);

	public FreeboardRepDTO selectData(int rep_no);

	public int countData(int freeboard_no);

	public void insertRepRepData(FreeboardRepDTO repDTO);

}
