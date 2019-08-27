package com.bitcamp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.admin.MainImageDTO;
import com.bitcamp.DTO.admin.MainViewDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.VO.admin.MainProductVO;
import com.bitcamp.VO.admin.NewMemberVO;

public interface AdminMapper {
	
	public int getMemberCount(HashMap<String, Object> search_map);
	public List<MemberDTO> getMemberList(HashMap<String, Object> map);
	public MemberDTO getMemberDetail(int memberno);
	public int updateMemberStatus(int memberno);
	public int getQuestionCount(HashMap<String, Object> search_map);
	public List<CustomerQABoardDTO> getQuestionList(HashMap<String, Object> search_map);
	public CustomerQABoardDTO getQnADetail(int questionno);
	public int deleteQuestion(int questionno);
	public int updateAnswerContent(HashMap<String, Object> update_map);
	public int modifyAnswerContent(HashMap<String, Object> update_map);
	public void deleteAllQuestion(String string);
	public List<NewMemberVO> getNewMemberList(HashMap<String, Object> search_map);
	public int getNewMemberCount(String tochar);
	public int getPopularProductCount(String tochar);
	public List<ListDTO> getPopularProductList(HashMap<String, Object> search_map);
	public void updateMainImage(HashMap<String, Object> upload_map);
	public void updateMainImage2(HashMap<String, Object> upload_map);
	public int getProductCount(HashMap<String, Object> search_map);
	public List<ListDTO> getProductList(HashMap<String, Object> search_map);
	public void updateProductemplate(MainViewDTO mainview);
	public List<MainViewDTO> getMainViewList();
	public List<MainImageDTO> getMainImageList();
	public MainProductVO getMainProduct(String string);
	public void updateMemberRole(HashMap<String, Object> update_map);
	public void insertRealAuthority(HashMap<String, Object> update_map);
}
