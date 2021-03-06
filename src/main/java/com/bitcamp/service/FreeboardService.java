package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.freeboard.FreeboardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.mapper.FreeboardMapper;
import com.bitcamp.mapper.MemberMapper;

@Service("freeboardService")
public class FreeboardService {

	@Autowired
	private FreeboardMapper fbMapper;

	@Autowired
	private MemberMapper memMapper;

	public int writeService(FreeboardDTO dto) {
		String user_nick = memMapper.readMemberbyMemberNo(dto.getFreeboard_member_no()).getUser_nick();
		dto.setFreeboard_user_nick(user_nick);
		fbMapper.insertData(dto);
		
		return fbMapper.insertDataSequence();
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

	public void updateHitsService(int freeboard_no) {
		fbMapper.updateHits(freeboard_no);
	}

	public int getListCountService(HashMap<String, Object> listMap) {
		return fbMapper.getListCount(listMap);
	}

	public List<FreeboardDTO> listService(HashMap<String, Object> listMap) {
		return fbMapper.getSearchList(listMap);
	}

}
