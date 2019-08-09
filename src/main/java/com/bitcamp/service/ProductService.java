package com.bitcamp.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.OptionDTO;
import com.bitcamp.DTO.Product.OrderOptionDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.mapper.ProductListMapper;

@Transactional(rollbackFor= {Exception.class}, propagation=Propagation.REQUIRED, isolation=Isolation.DEFAULT)
@Service("pservice")
public class ProductService {
	@Autowired
	private ProductListMapper mapper;
	
	public List<ListDTO> getListService(String searchType, String searchData, PageDTO dto, String list_category, List<String> hashTag, int hasStock, int status, int order){
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
		hashMap.put("isordered", order);
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
	
	public List<String> getHashSearchService(String searchData){
		return mapper.getHashSearch(searchData);
	}
	
	public int insertPerfectOrderDataService(ListDTO dto) {
		
		//임시로 작가명 설정
		dto.setList_artist("tempArtist");
		
		HashMap<String, Object> optionData = new HashMap<String, Object>();
		HashMap<String, Object> imageData = new HashMap<String, Object>();
 		HashMap<String, Object> hashData = new HashMap<String, Object>();
 		int list_no = mapper.insertPerfectOrderData(dto);
		
 		if(list_no == 0) {
 			System.out.println("리스트 넘버 값이 0");
 			return 0;
 		}
 		
 		System.out.println("ListNo :: " + list_no);
 		
 		List<OptionDTO> odto = new ArrayList<>();
 		for(int i=0; i<dto.getOption_name().size(); i++) {
 			OptionDTO temp = new OptionDTO();
 			temp.setOption_name(dto.getOption_name().get(i));
 			temp.setOption_price(dto.getOption_price().get(i));
 			temp.setOption_stock(dto.getOption_stock().get(i));
 			odto.add(temp);
 		}
		
		optionData.put("list_option", odto);
		imageData.put("list_image_loc", dto.getList_image_loc());
		hashData.put("list_hash", dto.getList_hash());
		
		int obresult = mapper.insertListOptionData(optionData);
		int imgresult = mapper.insertListMainImages(imageData);
		int hshresult = mapper.insertListHashTag(hashData);
		
		if(obresult != 0 && imgresult != 0 && hshresult !=0) {
			return 1;
		}else {
			System.out.println("데이터베이스에 저장하지 못했습니다.");
			return 0;
		}
	}
	
	public int insertOrderMadeDataService(ListDTO dto) {
		//임시로 작가명 설정
				dto.setList_artist("tempArtist");
				
				HashMap<String, Object> optionData = new HashMap<String, Object>();
				HashMap<String, Object> imageData = new HashMap<String, Object>();
		 		HashMap<String, Object> hashData = new HashMap<String, Object>();
		 		HashMap<String, Object> orderData = new HashMap<String, Object>();
		 		
		 		int list_no = mapper.insertOrderMadeData(dto);
				
		 		if(list_no == 0) {
		 			System.out.println("리스트 넘버 값이 0");
		 			return 0;
		 		}
		 		
		 		System.out.println("ListNo :: " + list_no);
		 		
		 		List<OptionDTO> odto = new ArrayList<>();
		 		for(int i=0; i<dto.getOption_name().size(); i++) {
		 			OptionDTO temp = new OptionDTO();
		 			temp.setOption_name(dto.getOption_name().get(i));
		 			temp.setOption_price(dto.getOption_price().get(i));
		 			temp.setOption_stock(dto.getOption_stock().get(i));
		 			odto.add(temp);
		 		}
		 		
		 		List<OrderOptionDTO> ordto = new ArrayList<>();
		 		for(int i=0; i<dto.getOrder_name().size(); i++) {
		 			OrderOptionDTO temp = new OrderOptionDTO();
		 			System.out.println("ordto" + ordto);
		 			temp.setOrder_name(dto.getOrder_name().get(i));
		 			temp.setOrder_option(dto.getOrder_option().get(i));
		 			ordto.add(temp);
		 		}
				
				optionData.put("list_option", odto);
				imageData.put("list_image_loc", dto.getList_image_loc());
				hashData.put("list_hash", dto.getList_hash());
				orderData.put("list_order", ordto);
				
				int obresult = mapper.insertListOptionData(optionData);
				int imgresult = mapper.insertListMainImages(imageData);
				int hshresult = mapper.insertListHashTag(hashData);
				int ordresult = mapper.insertOrderData(orderData);
				
				if(obresult != 0 && imgresult != 0 && hshresult !=0 && ordresult !=0) {
					return 1;
				}else {
					System.out.println("데이터베이스에 저장하지 못했습니다.");
					return 0;
				}
	}
	
	public int checkImageValidateService(String path) {
		List<String> dbImages = mapper.getAllImages();
		List<String> shdbImages = new ArrayList<>();
		List<String> svImages = new ArrayList<>();
		
		for(int i=0; i<dbImages.size(); i++) {
			int pos = dbImages.get(i).lastIndexOf("/");
			shdbImages.add(dbImages.get(i).substring(pos+1));
		}
		
		File root = new File(path); 
		File[] list = root.listFiles();
		if(list!=null) {
			for(File f : list) {
				svImages.add(f.getName());
			}
		}
		
		
		List<String> noImages = svImages.stream().filter(x->!shdbImages.contains(x)).collect(Collectors.toList());
		System.out.println(noImages);
		List<String> noImagesPath = new ArrayList<>();
		for(int i=0; i<noImages.size(); i++) {
			String nopath = path + "/" + noImages.get(i);
			noImagesPath.add(nopath);
		}
		
		for(int i=0; i<noImagesPath.size(); i++) {
			
			File f = new File(noImagesPath.get(i));
			if(f.delete()) {
				System.out.println("임시 파일 삭제");
			}else {
				System.out.println("파일 삭제 실패");
			}
		}
		
		return 0;
		
	}

	public ListDTO getNoListService(int no) {
		// TODO Auto-generated method stub
		return mapper.getNoList(no);
	}

	public List<OrderOptionDTO> getOrderListService(ListDTO dto) {
		// TODO Auto-generated method stub
		List<OrderOptionDTO> orderOptionList = mapper.getOrderOptionList(dto.getList_no());
		List<String> images = mapper.getImages(dto.getList_no());
		dto.setList_image_loc(images);
		return orderOptionList;
	}
	
	/*
	public int insertOrderOptionService(List<Integer> list_order_no, List<String> order_value) {
		return 0;
	}*/
}
