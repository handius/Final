package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.freeboard.FreeboardRepDTO;
import com.bitcamp.mapper.FreeboardRepMapper;

@Service("freeboardRepService")
public class FreeboardRepService {

	@Autowired
	private FreeboardRepMapper mapper;
	
	public void saveReplyService(FreeboardRepDTO repDTO) {
		mapper.insertData(repDTO);
	}

	public List<FreeboardRepDTO> getReplyService(HashMap<String, Object> listMap){
		return mapper.getData(listMap);
	}
	
	public void modifyReplyService(FreeboardRepDTO dto) {
		mapper.updateData(dto);
	}
	
	public void deleteReplyService(int rep_no) {
		mapper.deleteData(rep_no);
	}

	public void updateReplyDataService(int rep_no, String rep_content) {
		FreeboardRepDTO dto =new FreeboardRepDTO();
		dto.setRep_no(rep_no);
		dto.setRep_content(rep_content);
		
		mapper.updateData(dto);
	}

	public int countReplyService(int freeboard_no) {
		return mapper.countData(freeboard_no);
	}

	public void saveReplyRepService(FreeboardRepDTO repDTO) {
		mapper.insertRepRepData(repDTO);
	}

}
