package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.mapper.ArtistMapper;

@Service
public class ArtistService {
	
	@Autowired
	private ArtistMapper mapper;
	
	@Transactional
	public Map<String, Object> artistBoardDetailService(int artist_no) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("artistInfo", mapper.artistBoardDetailArtistInfo(artist_no));
		map.put("artistBoardDetail", mapper.artistBoardDetailGet(artist_no));
		
		mapper.artistBoardDetailCountUpdate(artist_no); //조회수 처리 생각해볼것
		return map;
	}
	
	@Transactional
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
	
	public List<Map<String, Object>> artistBoardDetailProductListService(HashMap<String, Object> map) {
		int artist_no = (int) map.get("artist_no");
		MemberDTO memberdto = mapper.artistBoardDetailArtistInfo(artist_no);
//		map.put("user_name", memberdto.getUser_name());
		map.put("user_name", "Min"); //임시 User_name 
		
		List<Map<String, Object>> listinput = new ArrayList<>();
		List<Integer> listNum = mapper.artistBoardDetailProductListNo(map);
		for(int i=0; i<listNum.size(); i++) {
			Map<String, Object> listMap = new HashMap<>();
			List<String> listImg = mapper.artistBoardDetailProductListImg(listNum.get(i));
			listMap.put("list_no", listNum.get(i));
			listMap.put("list_image_loc", listImg.get(0));
			listinput.add(listMap);
		}
		return listinput;
	}
	
	public List<BuyReviewDTO> artistBoardDetailBuyReviewList(HashMap<String, Object> map) {
		return mapper.artistBoardDetailBuyReviewList(map);
	}
	
}
