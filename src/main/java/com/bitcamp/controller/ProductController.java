package com.bitcamp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.Product.OrderOptionDTO;
import com.bitcamp.DTO.Product.OrderValueDTO;
import com.bitcamp.DTO.Product.searchTextDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.member.AuthorityDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.VO.file.FileVO;
import com.bitcamp.service.ProductService;
/*
 * 작성자 : 윤건일
 * 프로그램 이름 : ProductController
 * 내용 : 제품 리스트 작성 및 리스트 표시에 관련된 컨트롤러, ajax 포함
 * 
 */
@Controller
public class ProductController {
	@Resource(name="pservice")
	private ProductService service;
	
	//orderList로 가장 처음 리스트를 표시할 때 들어오는 컨트롤러
	@RequestMapping(value="/orderList", method= {RequestMethod.POST, RequestMethod.GET})
	public String listProduct(HttpSession session, @RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, @RequestParam(defaultValue="")String order, Model model) {
		//로그인 멤버 관리자 체크
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		if(mdto!=null) {
			List<AuthorityDTO> authList = mdto.getAuthorityList();
			//임시 관리자 권한 부여
			AuthorityDTO tempauth = new AuthorityDTO();
			tempauth.setUser_auth("ROLE_ADMIN");
			authList.add(tempauth);
			for(AuthorityDTO auth : authList) {
				if(auth.getUser_auth().equals("ROLE_ADMIN")) {
					System.out.println("관리자 권한 설정");
					model.addAttribute("isAdmin", true);
					status = 0;
					break;
				}
			}
		}
		//임시 파일 삭제
		String path = session.getServletContext().getRealPath("/resources/image/dimage");
		service.checkImageValidateService(path);
		//리스트 띄우기
		int orders = 3;
		if(order != null && order != "" && order.length() > 0) {
			orders = Integer.parseInt(order);
		}
		//페이징 처리
		String list_category = "";
		int pagePerCount = 16;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status, orders);
		System.out.println("hashList : " + hashTag);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		//리스트와 해쉬 리스트 가져오기
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status, orders);
		List<String> hashList = service.getHashService(20);
		//게시글, 해쉬 리스트 model 속성으로 전달
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/orderList.mall";
	}
	
	//카테고리 선택시 가져오는 리스트
	@RequestMapping(value="/orderList/{category}", method= {RequestMethod.POST, RequestMethod.GET})
	public String listProduct(HttpSession session, @RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @PathVariable(required=false, name="category")String list_category, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, @RequestParam(defaultValue="")String order, Model model) {
		//관리자 여부 확인
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		if(mdto!=null) {
			List<AuthorityDTO> authList = mdto.getAuthorityList();
			for(AuthorityDTO auth : authList) {
				if(auth.getUser_auth().equals("ROLE_MEMBER")) {
					//관리자일시 임시 삭제된 파일도 모두 보여줌
					status = 0;
					break;
				}
			}
		}
		//주문제작 품 여부 체크
		int orders = 3;
		if(order != null && order != "" && order.length() > 0) {
			orders = Integer.parseInt(order);
		}
		//페이징 처리
		int pagePerCount = 16;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status ,orders);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		//카테고리 포함해서 리스트와 해쉬 리스트 선택
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status, orders);
		List<String> hashList = service.getHashService(20);
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/orderList.mall";
	}
	
	//HashTag 추가 버튼 클릭시 다음 해쉬 태그를 가져옴
	@ResponseBody
	@RequestMapping(value="/ajaxHashPager", method={RequestMethod.POST, RequestMethod.GET})
	public List<String> ajaxHashPager(@RequestParam int hashPage) {
		int endrow = hashPage * 12;
		return service.getHashService(endrow);
	}
	
	//해당하는 단어를 포함하는 HashTag를 검색
	@ResponseBody
	@RequestMapping(value="/ajaxHashSearcher", method={RequestMethod.POST, RequestMethod.GET})
	public List<String> ajaxHashPager(@RequestParam String searchData) {
		return service.getHashSearchService(searchData);
	}
	
	//sell 페이지로 이동
	@RequestMapping(value="/sell", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellProduct() {
		return "sell/sell.mall";
	}
	
	//login 확인 후 완제품 페이지로 이동
	@RequestMapping(value="/sell/insertPerfectOrder", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellPerfectOrder(HttpSession session) {
		//유저가 인증된 유저인지 확인
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		if(dto!=null) {
			List<AuthorityDTO> authList = dto.getAuthorityList();
			for(AuthorityDTO auth : authList) {
				if(auth.getUser_auth().equals("ROLE_MEMBER")) {
					return "sell/insertPerfectOrder.mall";
				}
			}	
			return "redirect:/login";
		}else {
			return "redirect:/login";
		}
	}
	
	//login 확인 후 주문 제작 페이지로 이동
	@RequestMapping(value="/sell/insertOrderMade", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellOrderMade(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		if(dto!=null) {
			List<AuthorityDTO> authList = dto.getAuthorityList();
			for(AuthorityDTO auth : authList) {
				if(auth.getUser_auth().equals("ROLE_MEMBER")) {
					return "sell/insertOrderMade.mall";
				}
			}	
			return "redirect:/login";
		}else {
			return "redirect:/login";
		}
	}
	
	//ajax를 통해 이미지를 업로드 해주는 메서드
	@RequestMapping(value="*/uploadAjaxAction", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ResponseEntity<List<FileVO>> uploadAjaxPost(HttpSession session, MultipartFile[] uploadFile) {
		List<FileVO> list = new ArrayList<>();
		//ajax
		System.out.println("ajax controller 입장");
		String path = session.getServletContext().getRealPath("/resources/image/dimage");
		System.out.println(path);
		String uploadFolder = path;
		for(MultipartFile multipartFile : uploadFile) {
			FileVO filevo = new FileVO();
			String uploadFileName = multipartFile.getOriginalFilename();
			filevo.setFileName(uploadFileName);
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);	
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "-" + uploadFileName;
			try {
				File saveFile = new File(uploadFolder, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				filevo.setUploadPath(uploadFolder);
				filevo.setUuid(uuid.toString());
				list.add(filevo);
				
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	//완제품 주문 제작 폼에서 데이터를 받아 데이터 베이스에 저장해줌
	@RequestMapping(value="*/insertPerfectOrderForm", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertPerfectOrder(ListDTO dto,HttpSession session){
		//유저가 인증된 유저인지 확인
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		if(mdto!=null) {
			List<AuthorityDTO> authList = mdto.getAuthorityList();
			for(AuthorityDTO auth : authList) {
				if(auth.getUser_auth().equals("ROLE_MEMBER")) {
					System.out.println("완제품 제출");
					int result = service.insertPerfectOrderDataService(dto, mdto.getUser_id());
					System.out.println("결과 : " + result);
					return "redirect:/orderList";
				}
			}	
			return "redirect:/login";
		}else {
			return "redirect:/login";
		}
		
	}
	
	//주문제작 폼에서 데이터를 받아 데이터 베이스에 저장해줌
	@RequestMapping(value="*/insertOrderMadeForm", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertOrderMade(ListDTO dto, HttpSession session){
		//유저가 인증된 유저인지 확인
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		if(mdto!=null) {
			List<AuthorityDTO> authList = mdto.getAuthorityList();
			for(AuthorityDTO auth : authList) {
				if(auth.getUser_auth().equals("ROLE_MEMBER")) {
					System.out.println("주문제작 폼 제출");
					int result = service.insertOrderMadeDataService(dto, mdto.getUser_id());
					System.out.println("결과 : " + result);
					return "redirect:/orderList";
				}
			}	
			return "redirect:/login";
		}else {
			return "redirect:/login";
		}
	}
	
	//orderList 페이지에서 게시글 클릭시 대상이 주문 제작품이면 사용자 주문 제작 옵션 추가 페이지로, 그렇지 않으면 완제품 페이지 디테일 페이지로 이동
	@RequestMapping(value="/checkIsOrdered", method= {RequestMethod.POST, RequestMethod.GET})
	public String checkOrder(HttpSession session, @RequestParam() int no, Model model) {
		//유저가 인증된 유저인지 확인
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		ListDTO dto = service.getNoListService(no);			
		if(dto.getIsordered() == 0) {
			return "redirect:/productDetail/"+no;
		}else if(mdto!=null){
			List<AuthorityDTO> authList = mdto.getAuthorityList();
			System.out.println(authList);
			for(AuthorityDTO auth : authList) {
				if(auth.getUser_auth().equals("ROLE_MEMBER")) {
					int member_no = mdto.getMember_no();
					List<OrderOptionDTO> odto = service.getOrderListService(dto);
					System.out.println("odto" + odto);
					model.addAttribute("ListDTO",dto);
					model.addAttribute("orders", odto);
					model.addAttribute("member_no", member_no);
					return "sell/insertOrderOption.mall";
				}
			}	
			return "redirect:/login";
		}else {
			return "redirect:/login";
		}
	}
	//주문 제작 폼에서 입력받은 사용자 요구 사항을 체크해서 화면에 뿌려준다.
	@RequestMapping(value="/checking", method= {RequestMethod.POST, RequestMethod.GET})
	public String check(HttpSession session,@RequestParam(required=false)List<MultipartFile> order_picture, @RequestParam(required=false)List<String> order_color, @RequestParam(required=false)List<String> order_text, @RequestParam(required=false)List<String> order_count, @RequestParam(required=true)int member_no, @RequestParam(required=true)int list_no) {
		//데이터들을 저장해줄 큐 선언
		Queue<String> queue = new LinkedList<String>();
		Queue<String> cqueue = new LinkedList<String>();
		Queue<String> tqueue = new LinkedList<String>();
		String uploadFileName = null;
		//사진객체가 있을 경우
		if(order_picture != null) {
			String path = session.getServletContext().getRealPath("/resources/image/fimage");
			for(MultipartFile multipartFile:order_picture) {
				uploadFileName = multipartFile.getOriginalFilename();
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);	
				UUID uuid = UUID.randomUUID();
				uploadFileName = uuid.toString() + "-" + uploadFileName;
				try {
				File file = new File(path, uploadFileName);
				multipartFile.transferTo(file);
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
				String image = "/resources/image/fimage/" + uuid.toString() + "-" + multipartFile.getOriginalFilename();
				queue.offer(image);
			}
		}
		//색상 객체가 있을 경우
		if(order_color != null) {
			for(int i=0; i<order_color.size(); i++) {
				cqueue.offer(order_color.get(i));
			}
		}
		//글 객체가 있을 경우
		if(order_text != null) {
			for(int i=0; i<order_text.size(); i++) {
				tqueue.offer(order_text.get(i));
			}
		}
		//각각의 요구사항을 저장할 리스트 선언
		List<OrderValueDTO> ovlist = new ArrayList<>();  
		//dto에 데이터를 담아 리스트에 담는다.
		for(int i=0; i<order_count.size(); i++) {
			OrderValueDTO dto = new OrderValueDTO();
			if(order_count.get(i).contains("p")) {
				int pos = order_count.get(i).indexOf("o");
				int order_no = Integer.parseInt(order_count.get(i).substring(pos+1));
				dto.setList_order_no(order_no);
				dto.setOrder_value(queue.poll());
				dto.setMember_no(member_no);
			}else if(order_count.get(i).contains("c")) {
				int pos = order_count.get(i).indexOf("o");
				int order_no = Integer.parseInt(order_count.get(i).substring(pos+1));
				dto.setList_order_no(order_no);
				dto.setOrder_value(cqueue.poll());
				dto.setMember_no(member_no);
			}else if(order_count.get(i).contains("t")) {
				int pos = order_count.get(i).indexOf("o");
				int order_no = Integer.parseInt(order_count.get(i).substring(pos+1));
				dto.setList_order_no(order_no);
				dto.setOrder_value(tqueue.poll());
				dto.setMember_no(member_no);
			}
			ovlist.add(dto);
		}
		//데이터 베이스에 저장
		List<Integer> list_order_member_no = service.insertOrderOptionService(ovlist);
		
		System.out.println(order_count);
		System.out.println(list_order_member_no);
		//세션에 주문 제작 옵션 값을 저장한다.
		session.setAttribute("list_order_member_no", list_order_member_no);
		return "redirect:/productDetail/"+list_no;
	}
	
	//관리자 페이지 검색어 분석으로 이동
	@RequestMapping(value="/admin/searchText", method= {RequestMethod.POST, RequestMethod.GET})
	public String searchText(Model model) {
		model.addAttribute("admin_category", "anal");
		return "admin/dataanalysis.admin";
	}
	
	//데이터 베이스에 저장된 찾을 문자 값을 가져옴
	@ResponseBody
	@RequestMapping(value="getsearchTextData", method= {RequestMethod.POST, RequestMethod.GET})
	public List<searchTextDTO> searchData() {
		List<searchTextDTO> datas = service.getSearchTextService();
		return datas;
	}
	
	//파이썬으로 검색할 데이터 문자열값을 데이터 베이스에 저장
	@ResponseBody
	@RequestMapping(value="/insertSearcher" ,method={RequestMethod.POST, RequestMethod.GET})
	public int insertSearcher(@RequestParam(required=false)String searchData) {
		System.out.println("data ::" + searchData);
		return service.insertSearcherService(searchData);
	}
	
	//게시글 삭제 ajax 기능
	@ResponseBody
	@RequestMapping(value="/deleteProduct" ,method={RequestMethod.POST, RequestMethod.GET})
	public int deletePro(@RequestParam(required=true)String obj) {
		JSONParser parser = new JSONParser();
		List<Integer> number = new ArrayList<>();
		try {
			JSONArray jarray = (JSONArray)parser.parse(obj);
			for(int i=0; i<jarray.size(); i++) {
				JSONObject temp = (JSONObject)jarray.get(i);
				number.add(Integer.parseInt((String)temp.get("number")));
			}
			System.out.println(number);
			return service.deleteProductService(number);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
}
