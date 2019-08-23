package com.bitcamp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.admin.MainImageDTO;
import com.bitcamp.DTO.admin.MainViewDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.VO.admin.MainProductVO;
import com.bitcamp.VO.admin.NewMemberVO;
import com.bitcamp.mapper.AdminMapper;

@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
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

	public MemberDTO getMemberDetail(int memberno) {
		return admapper.getMemberDetail(memberno);
	}

	public int updateMemberStatus(int memberno) {
		return admapper.updateMemberStatus(memberno);
	}

	public int getQuestionCount(HashMap<String, Object> search_map) {
		return admapper.getQuestionCount(search_map);
	}

	public List<CustomerQABoardDTO> getCustomerQuestion(HashMap<String, Object> search_map) {
		return admapper.getQuestionList(search_map);
	}

	public CustomerQABoardDTO getQnADetail(int questionno) {
		return admapper.getQnADetail(questionno);
	}

	public int deleteQuestion(int questionno) {
		return admapper.deleteQuestion(questionno);
	}

	public int updateAnswerContent(HashMap<String, Object> update_map) {
		return admapper.updateAnswerContent(update_map);
	}

	public int modifyAnswerContent(HashMap<String, Object> update_map) {
		return admapper.modifyAnswerContent(update_map);
	}

	public void deleteAllQuestion(String string) {
		admapper.deleteAllQuestion(string);
	}

	public int getNewMemberCount(String tochar) {
		return admapper.getNewMemberCount(tochar);
	}
	
	public List<NewMemberVO> getNewMemberList(HashMap<String, Object> search_map) {
		return admapper.getNewMemberList(search_map);
	}

	public int getProductCount(String tochar) {
		return admapper.getPopularProductCount(tochar);
	}

	public List<ListDTO> getPopularProductList(HashMap<String, Object> search_map) {
		return admapper.getPopularProductList(search_map);
	}

	public void updateMainImage(HashMap<String, Object> upload_map) {
		admapper.updateMainImage(upload_map);
	}

	public void updateMainImage2(HashMap<String, Object> upload_map) {
		admapper.updateMainImage2(upload_map);
		
	}

	public int getProductCount(HashMap<String, Object> search_map) {
		return admapper.getProductCount(search_map);
	}

	public List<ListDTO> getProductList(HashMap<String, Object> search_map) {
		return admapper.getProductList(search_map);
	}

	public void updateProductemplate(MainViewDTO mainview) {
		admapper.updateProductemplate(mainview);
	}

	public List<MainViewDTO> getMainViewList() {
		return admapper.getMainViewList();
	}

	public List<MainImageDTO> getMainImageList() {
		return admapper.getMainImageList();
	}

	public MainProductVO getMainProduct(String string) {
		return admapper.getMainProduct(string);
	}
}
