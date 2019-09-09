package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.artist.ArtistBoardDTO;
import com.bitcamp.DTO.artist.ArtistRepDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;

public interface ArtistMapper {
	public int artistBoardExistenceCheck(int member_no);
	public int artistBoardInsertSeq();
	public void artistBoardInsert(HashMap<String, Object> map);
	//
	public MemberDTO artistBoardDetailArtistInfo(int artist_no);
	public ArtistBoardDTO artistBoardDetailGet(int artist_no);
	public void artistBoardDetailCountUpdate(int artist_no);
	//
	public int artistBoardDetailProductListMaxCount(String user_id);
	public List<Integer> artistBoardDetailProductListNo(HashMap<String, Object> hashmap);
	public List<String> artistBoardDetailProductListImg(int list_no);
	//
	public int artistBoardDetailBuyReviewListMaxCount(int artist_no);
	public List<BuyReviewDTO> artistBoardDetailBuyReviewList(HashMap<String, Object> map);
	//
	public int artistRepInsertSeq();
	public void artistRepInsert(ArtistRepDTO dto);
	public int artistRepInsertCheck(int artist_rep_no);
	//
	public void artistBoardDetailRepDelete(int artist_rep_no);
	public Integer artistBoardDetailRepDeleteCheck(int artist_rep_no);
	//
	public int artistRepListMaxCount(int artist_no);
	public List<ArtistRepDTO> artistRepList(HashMap<String, Integer> map);
	//
	public void artistBoardDetailModify(ArtistBoardDTO dto);
	//
	//작가 리스트 시작
	public int artistListMaxCount(HashMap<String, Object> hashmap);
	public List<ArtistBoardDTO> artistListGet(HashMap<String, Object> hashmap);
	public List<Integer> artistListListNoGet(String list_artist);
	//작가 별점 계산 시작
	public String artistScoreBuyReviewArtistId(int order_no);
	public List<Integer> artistScoreListNoList(String user_id);
	public List<Integer> artistScoreBuyReviewScoreList(int list_no);
	public void artistScoreUpdate(HashMap<String, Object> hashmap);
	//작가 자동 별점 계산 시작
	public List<String> artistScoreSchedulerArtistList();
	public List<Integer> artistScoreSchedulerListNoList(String user_id);
	public List<Integer> artistScoreSchedulerBuyReviewScoreList(int list_no);
	//작가 페이지 활성 토글 시작
	public void artistDetailPageActiveToggle(HashMap<String, Object> hashmap);
	public int artistDetailPageStatusCheck(int artist_no);
}
