package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired
	private AdminMapper admapper;
	
	public int getMemberCount(HashMap<String, Object> search_map) {
		return admapper.getMemberCount(search_map);
	}

	public List<MemberDTO> getMemberList(HashMap<String, Object> map) {
		return admapper.getMemberList(map);
	}
}
