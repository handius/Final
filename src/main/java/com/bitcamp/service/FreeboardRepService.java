package com.bitcamp.service;

import java.util.List;

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
	
	public List<FreeboardRepDTO> getReply(int freeboard_no){
		return mapper.getData(freeboard_no);
	}
	
	public void modifyReply(FreeboardRepDTO dto) {
		mapper.updateData(dto);
	}
	
	public void deleteReply(int rep_no) {
		mapper.deleteData(rep_no);
	}

	public void updateReplyData(int rep_no, String rep_content) {
		FreeboardRepDTO dto =new FreeboardRepDTO();
		dto.setRep_no(rep_no);
		dto.setRep_content(rep_content);
		
		mapper.updateData(dto);
	}

}
