package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.artist.ArtistBoardDTO;
import com.bitcamp.DTO.artist.ArtistBoardProductListDTO;
import com.bitcamp.DTO.artist.ArtistRepDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.comm.ScrollCalculation;
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
	
	@Transactional
	public Map<String, Object> artistBoardDetailProductListService(Map<String, Integer> map) {
		int artist_no = (int) map.get("artist_no");
		int currentPage = (int) map.get("currentProductInput");
		
		MemberDTO memberdto = mapper.artistBoardDetailArtistInfo(artist_no);
//		String user_name = memberdto.getUser_name();
		String user_name = "Min"; //임시 유저 이름
		int maxCount = mapper.artistBoardDetailProductListMaxCount(user_name);
		ScrollCalculation scroll = new ScrollCalculation(currentPage, 8, maxCount);
		
		HashMap<String, Object> productList = new HashMap<>();
		productList.put("user_name", user_name);
		productList.put("start_sql", scroll.getStartSql());
		productList.put("end_sql", scroll.getEndSql());
		productList.put("max_sql", maxCount);
		List<ArtistBoardProductListDTO> artistProductList = new ArrayList<>();
		
		if(scroll.isActive()) {
			List<Integer> listNum = mapper.artistBoardDetailProductListNo(productList);
			for(int i=0; i<listNum.size(); i++) {
				ArtistBoardProductListDTO listDto = new ArtistBoardProductListDTO();
				List<String> listImg = mapper.artistBoardDetailProductListImg(listNum.get(i));
				listDto.setList_no(listNum.get(i));
				listDto.setList_image_loc(listImg.get(0));
				artistProductList.add(listDto);
			}
		}
		
		productList.put("productList", artistProductList);
		
		return productList;
	}
	
	@Transactional
	public Map<String, Object> artistBoardDetailBuyReviewListService(Map<String, Integer> map) {
		int artist_no = map.get("artist_no");
		int maxCount = mapper.artistBoardDetailBuyReviewListMaxCount(artist_no);
		int currentPage = map.get("currentBuyReviewInput");
		
		ScrollCalculation scroll = new ScrollCalculation(currentPage, 5, maxCount);	
		List<BuyReviewDTO> list = new ArrayList<>();
		if(scroll.isActive()) {
			HashMap<String, Object> hashmap = new HashMap<>();
			hashmap.put("artist_no", map.get("artist_no"));
			hashmap.put("start_sql", scroll.startSql);
			hashmap.put("end_sql", scroll.endSql);
			list = mapper.artistBoardDetailBuyReviewList(hashmap);
		}
		
		Map<String, Object> hashmap = new HashMap<>();
		hashmap.put("end_sql", scroll.endSql);
		hashmap.put("max_sql", maxCount);
		hashmap.put("list", list);
		return hashmap;
	}
	
	@Transactional
	public int artistBoardDetailRepInsertService(ArtistRepDTO dto) {
		int artist_rep_no = mapper.artistRepInsertSeq();
		dto.setArtist_rep_no(artist_rep_no);
		mapper.artistRepInsert(dto);
		return mapper.artistRepInsertCheck(artist_rep_no); 
	}
	
	public Map<String, Object> artistBoardDetailRepListService(Map<String, Integer> map) {
		int artist_no = map.get("artist_no");
		int currentPage = map.get("currentRepInput");
		int maxSql = mapper.artistRepListMaxCount(artist_no);
		ScrollCalculation scroll = new ScrollCalculation(currentPage, 15, maxSql);
		
		List<ArtistRepDTO> replist = new ArrayList<>();
		if(scroll.isActive()) {
			HashMap<String, Integer> hashmap = new HashMap<>();
			hashmap.put("artist_no", artist_no);
			hashmap.put("start_sql", scroll.startSql);
			hashmap.put("end_sql", scroll.endSql);
			replist = mapper.artistRepList(hashmap);
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("replist", replist);
		resultMap.put("end_sql", scroll.endSql);
		resultMap.put("max_sql", maxSql);

		return resultMap;
	}
	
	public void artistBoardDetailModifyService(ArtistBoardDTO dto) {
		mapper.artistBoardDetailModify(dto);
	}
	
	public List<Object> artistList(Map<String, Object> map) {
		List<Object> artistList = new ArrayList<>();
		
		//스크롤 기능
		int currentPage = Integer.parseInt(map.get("currentArtistList").toString());
		int sizeSql = 5;
		int maxSql = mapper.artistListMaxCount(map.get("user_authority").toString());
		ScrollCalculation scroll = new ScrollCalculation(currentPage, sizeSql, maxSql);
		int startSql = scroll.getStartSql();
		int endSql = scroll.getEndSql();
		
		//함수 작동 여부를 확인
		if(scroll.isActive()) {
			HashMap<String, Object> hashmap = new HashMap<>();
			hashmap.put("user_authority", map.get("user_authority").toString());
			hashmap.put("listType", map.get("listType"));
			hashmap.put("endSql", endSql);
			hashmap.put("startSql", startSql);

			List<ArtistBoardDTO> artistBoardList = mapper.artistListGet(hashmap);
			for(int i=0; i<artistBoardList.size(); i++) {
				HashMap<String, Object> tmpHashmap = new HashMap<>();
				List<String> imgLocList = mapper.artistListImgGet(artistBoardList.get(i).getUser_id());
				tmpHashmap.put("productImgList", imgLocList);
				tmpHashmap.put("artistBoardInfo", artistBoardList.get(i));
				artistList.add(tmpHashmap);
			}
		}
		
		return artistList;
	}
	
}
