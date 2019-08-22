package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.DTO.artist.ArtistBoardDTO;
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
	public List<Integer> artistBoardDetailProductListNo(HashMap<String, Object> map);
	public List<String> artistBoardDetailProductListImg(int list_no);
	//
	public List<BuyReviewDTO> artistBoardDetailBuyReviewList(HashMap<String, Object> map);
}
