package com.bitcamp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.mapper.ProductListMapper;

@Service("pservice")
public class ProductService {
	@Autowired
	private ProductListMapper mapper;
	
	public List<ListDTO> getListService(String searchType, String searchData, PageDTO dto, String list_category, List<String> hashTag, int hasStock, int status){
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("searchType", searchType);
		hashMap.put("searchData", searchData);
		hashMap.put("PageDTO", dto);
		if(list_category != null)
			hashMap.put("list_category", list_category);
		if(hashTag == null || hashTag.size() == 0) {
			hashTag = null;
		}
		hashMap.put("hashTag", hashTag);
		hashMap.put("hasStock", hasStock);
		hashMap.put("status", status);
		List<ListDTO> pList = mapper.getList(hashMap);
		for(int i=0; i<pList.size(); i++) {
			List<String> images = mapper.getImages(pList.get(i).getList_no());
			String firstImage = images.get(0);
			List<String> MainImage = new ArrayList<>();
			MainImage.add(firstImage);
			pList.get(i).setList_image_loc(MainImage);
		}
		return pList;
	}
	
	public int getCountService(String searchType, String searchData, String list_category, List<String> hashTag, int hasStock, int status) {
		HashMap<String, Object> hashMap = new HashMap<>();
		hashMap.put("searchType", searchType);
		hashMap.put("searchData", searchData);
		hashMap.put("list_category", list_category);
		System.out.println(hashTag);
		if(hashTag == null || hashTag.size() == 0) {
			System.out.println("널 입력");
			hashTag = null;
		}
		hashMap.put("hashTag", hashTag);
		hashMap.put("hasStock", hasStock);
		hashMap.put("status", status);
		int productCount = mapper.getCount(hashMap);
		return productCount;
	}
	
	public List<String> getHashService(int hashPage){
		return mapper.getHash(hashPage);
	}
	
	/*public int insertPerfectOrderDataService(ListDTO dto) {
		return 0;
	}
	
	public int insertOrderMadeDataService(ListDTO dto) {
		return 0;
	}
	
	public int insertOrderOptionService(List<Integer> list_order_no, List<String> order_value) {
		return 0;
	}*/
}
