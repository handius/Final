package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

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
	public int artistBoardDetailProductListMaxCount(String user_name);
	public List<Integer> artistBoardDetailProductListNo(HashMap<String, Object> map);
	public List<String> artistBoardDetailProductListImg(int list_no);
	//
	public int artistBoardDetailBuyReviewListMaxCount(int artist_no);
	public List<BuyReviewDTO> artistBoardDetailBuyReviewList(HashMap<String, Object> map);
	//
	public int artistRepInsertSeq();
	public void artistRepInsert(ArtistRepDTO dto);
	public int artistRepInsertCheck(int artist_rep_no);
	//
	public int artistRepListMaxCount(int artist_no);
	public List<ArtistRepDTO> artistRepList(HashMap<String, Integer> map);
	//
	public void artistBoardDetailModify(ArtistBoardDTO dto);
}
