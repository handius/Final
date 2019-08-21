package com.bitcamp.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.mapper.ArtistMapper;

@Service
public class ArtistService {
	
	@Autowired
	private ArtistMapper mapper;
	
	public Map<String, Object> artistBoardDetailService(int artist_no) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("artistInfo", mapper.artistBoardDetailArtistInfo(artist_no));
		map.put("artistBoardDetail", mapper.artistBoardDetailGet(artist_no));
		
		mapper.artistBoardDetailCountUpdate(artist_no); //조회수 처리 생각해볼것
		return map;
	}
	
	public String artistBoardInsertService(int member_no) {
		//작가페이지가 있는지를 확인
		String insertResultMessage = "이미 작가 페이지가 있습니다.";
		int checkResult = mapper.artistBoardExistenceCheck(member_no);
		
		//작가페이지가 없다면
		if(checkResult == 0) {
			HashMap<String, Object> map = new HashMap<>();
			int artist_no = mapper.artistBoardInsertSeq();
			map.put("artist_no", artist_no);
			map.put("member_no", member_no);
			mapper.artistBoardInsert(map);
			
			//작가 페이지가 정상적으로 등록이 되었는지를 확인
		    checkResult = mapper.artistBoardExistenceCheck(member_no);
			if(checkResult == 0) {
				insertResultMessage = "작가 페이지 등록에 오류가 발생햇습니다.";
			}
			else {
				insertResultMessage = "작가 페이지를 정상적으로 등록했습니다.";
			}
		}
		return insertResultMessage;
	}
	
}
