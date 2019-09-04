package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.artist.ArtistBoardDTO;
import com.bitcamp.DTO.artist.ArtistBoardProductListDTO;
import com.bitcamp.DTO.artist.ArtistListDTO;
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
		map.put("artistRepMaxCount", mapper.artistRepListMaxCount(artist_no));
		return map;
	}
	
	@Transactional
	public void artistBoardDetailCountService(HttpServletRequest request, HttpServletResponse response, int artist_no) {
		//쿠키에서 작가페이지의 출입 확인
		boolean cookieFind = false;
		Cookie[] reqCookie = request.getCookies();
		if(reqCookie != null) {
			for(Cookie cookie : reqCookie) {
				if(cookie.getName().equals("artistCount"+artist_no)) {
					cookieFind = true;							
				}
			}
		}
				
		//만약 쿠키에서 해당 접속을 확인못햇다면
		if(!cookieFind) {
			mapper.artistBoardDetailCountUpdate(artist_no); //조회수 증가
			Cookie resCookie = new Cookie("artistCount"+artist_no, Integer.toString(artist_no));
			resCookie.setMaxAge(60*60*24);
			response.addCookie(resCookie);
		}
	}
	
	//AdminController에서 사용
	@Transactional
	public void artistBoardInsertService(int member_no) {
		
		//작가페이지가 있는지를 확인
		int checkResult = mapper.artistBoardExistenceCheck(member_no);
		
		//작가페이지가 없다면
		if(checkResult == 0) {
			HashMap<String, Object> map = new HashMap<>();
			int artist_no = mapper.artistBoardInsertSeq();
			map.put("artist_no", artist_no);
			map.put("member_no", member_no);
			mapper.artistBoardInsert(map);
			System.out.println("작가 페이지 생성 완료!");
		}
	}
	
	@Transactional
	public HashMap<String, Object> artistBoardDetailProductListService(Map<String, Integer> map) {
		int artist_no = (int) map.get("artist_no");
		int currentPage = (int) map.get("currentProductInput");
		
		MemberDTO memberdto = mapper.artistBoardDetailArtistInfo(artist_no);
		String user_id = memberdto.getUser_id();
		int maxCount = mapper.artistBoardDetailProductListMaxCount(user_id);
		ScrollCalculation scroll = new ScrollCalculation(currentPage, 8, maxCount);
		
		HashMap<String, Object> productList = new HashMap<>();
		productList.put("user_id", user_id);
		productList.put("start_sql", scroll.getStartSql());
		productList.put("end_sql", scroll.getEndSql());
		productList.put("max_sql", maxCount);
		List<ArtistBoardProductListDTO> artistProductList = new ArrayList<>();
		if(scroll.isActive()) {
			List<Integer> listNum = mapper.artistBoardDetailProductListNo(productList);
			for(int i=0; i<listNum.size(); i++) {
				ArtistBoardProductListDTO listDto = new ArtistBoardProductListDTO();
				List<String> listImg = mapper.artistBoardDetailProductListImg(listNum.get(i));
				if(listImg.size() != 0) {
					listDto.setList_no(listNum.get(i));
					listDto.setList_image_loc(listImg.get(0));
					artistProductList.add(listDto);
				}
			}
		}
		
		productList.put("artistProductList", artistProductList);
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
	
	@Transactional
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
	
	@Transactional
	public List<ArtistListDTO> artistListService(Map<String, Object> map) {
		List<ArtistListDTO> artistList = new ArrayList<>();
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("user_authority", map.get("user_authority").toString());
		hashmap.put("member_no", map.get("member_no").toString());
		
		//스크롤 기능
		int currentPage = Integer.parseInt(map.get("currentArtistList").toString());
		int sizeSql = 6;
		int maxSql = mapper.artistListMaxCount(hashmap);
		ScrollCalculation scroll = new ScrollCalculation(currentPage, sizeSql, maxSql);
		int startSql = scroll.getStartSql();
		int endSql = scroll.getEndSql();
		
		//함수 작동 여부를 확인
		if(scroll.isActive()) {
			hashmap.put("searchText", map.get("searchText"));
			hashmap.put("listType", map.get("listType"));
			hashmap.put("endSql", endSql);
			hashmap.put("startSql", startSql);

			List<ArtistBoardDTO> artistBoardList = mapper.artistListGet(hashmap);
			for(int i=0; i<artistBoardList.size(); i++) {
				ArtistListDTO artistListdto = new ArtistListDTO();
				artistListdto.setArtistBoarddto(artistBoardList.get(i));
				
				List<Integer> listNo = mapper.artistListListNoGet(artistBoardList.get(i).getUser_id());
				if(listNo != null) {
					artistListdto.setListNo(listNo);
				}
				artistList.add(artistListdto);
			}
		}
		
		return artistList;
	}
	
	//작가 페이지 별점 계산
	@Transactional
	public void artistScoreCalculation(int order_no, int buy_review_score) {
		//주문번호의 상품 작가id를 가져온다.
		String user_id = mapper.artistScoreBuyReviewArtistId(order_no);
		if(user_id != null) {
			//해당 작가의 작품리스트를 가져온다.
			List<Integer> listNoList = mapper.artistScoreListNoList(user_id);
			
			int scoreSum = 0;
			int sumCount = 0;
			for(int i=0; i<listNoList.size(); i++) {
				int list_no = listNoList.get(i);
				
				//해당작품의 구매후기 점수를 가져온다.
				List<Integer> scoreList = mapper.artistScoreBuyReviewScoreList(list_no);
				for(int j=0; j<scoreList.size(); j++) {
					scoreSum += scoreList.get(j);
					sumCount++;
				}
			}
			float artist_score = (float)(scoreSum + buy_review_score)/(sumCount + 1);
			HashMap<String, Object> hashmap = new HashMap<>();
			hashmap.put("artist_score", artist_score);
			hashmap.put("user_id", user_id);
			//해당 작가 페이지에 업데이트를 한다.
			mapper.artistScoreUpdate(hashmap);
		}
	}
	
	//일정 시간마다 자동 별점 계산
	@Scheduled(cron="0 0/5 * * * ?") 
	public void artistScoreScheduler() {
		System.out.println("[작가 자동 별점 계산 시작]");
		long start = System.currentTimeMillis();
		int artistBoardCount = 0;
		
		List<String> artistBoardList = mapper.artistScoreSchedulerArtistList();		
		if(artistBoardList.size() != 0) {
			for(int i=0; i<artistBoardList.size(); i++) {
				String user_id = artistBoardList.get(i);
				List<Integer> list_noList = mapper.artistScoreSchedulerListNoList(user_id);
				
				float ScoreSum = 0;
				int ScoreCount = 0;
				if(list_noList.size() != 0) {
					for(int j=0; j<list_noList.size(); j++) {
						List<Integer> artist_board_scoreList = mapper.artistScoreSchedulerBuyReviewScoreList(list_noList.get(j));
						
						if(artist_board_scoreList.size() != 0) {
							for(int k=0; k<artist_board_scoreList.size(); k++) {
								ScoreSum += artist_board_scoreList.get(k);
								ScoreCount++;
							}
						}
					} //list_nolist for end
					
					if(ScoreCount != 0) {
						ScoreSum = ScoreSum/ScoreCount;
					}
					HashMap<String, Object> hashmap = new HashMap<>();
					hashmap.put("user_id", user_id);
					hashmap.put("artist_score", ScoreSum);
					mapper.artistScoreUpdate(hashmap);
				}
				artistBoardCount++;
			} //artistBoardList for end
		}		
		long end = System.currentTimeMillis();
		System.out.println("자동 별점 계산 소요시간 : "+(end-start)/1000.0+"초 ");
		System.out.println("갱신한 작가페이지 수 : "+artistBoardCount);
		System.out.println("[작가 자동 별점 계산 종료]");
	}
	
	@Transactional
	public String artistDetailPageActiveToggleService(Map<String, Object> map) {
		int artist_no = Integer.parseInt(map.get("artist_no").toString());
		int activeType = 0;
		String resultMessage = "실패했습니다.";
		
		if(map.get("activeType").toString().equals("페이지 활성")) {
			activeType = 1;
		}
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("artist_no", artist_no);
		hashmap.put("activeType", activeType);
		mapper.artistDetailPageActiveToggle(hashmap);
		int statusCheck = mapper.artistDetailPageStatusCheck(artist_no);
		if(statusCheck == activeType) {
			resultMessage = "성공했습니다.";
		}	
		
		return resultMessage;
		
	}
	
}
