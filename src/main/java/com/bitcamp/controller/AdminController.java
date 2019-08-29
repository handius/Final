package com.bitcamp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitcamp.DTO.Product.ListDTO;
import com.bitcamp.DTO.admin.MainImageDTO;
import com.bitcamp.DTO.admin.MainViewDTO;
import com.bitcamp.DTO.comm.PageDTO;
import com.bitcamp.DTO.customerqaboard.CustomerQABoardDTO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.VO.admin.DateVO;
import com.bitcamp.VO.admin.MainProductVO;
import com.bitcamp.VO.admin.NewMemberVO;
import com.bitcamp.service.AdminService;
import com.bitcamp.service.ArtistService;

@Controller
//@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
	@Autowired
	private AdminService adservice;
	
	@Autowired
	private ArtistService artistservice;
	
	@RequestMapping("/admin")
	public String adminmain(@RequestParam(required=false) String curr,
							 @RequestParam(required=false) String user_name,
							 @ModelAttribute DateVO search_date,
							 @RequestParam(required=false) String user_authority,
							 Model model) {

		// 쿼리 돌릴 값 (검색)
		HashMap<String, Object> search_map = new HashMap<>();
		search_map.put("user_name", user_name);
		search_map.put("user_authority", user_authority);
		String make_to_char = null;
		String date1 = search_date.getSearch_date_year();
		String date2 = search_date.getSearch_date_month();
		if(date1 != null || date2 != null) make_to_char = date1 + "-" + date2;
		search_map.put("search_date", make_to_char);
		
		// 페이징
		int currpage = 1;
		if(curr != null) currpage = Integer.parseInt(curr);
		int totalCount = adservice.getMemberCount(search_map);		// count(*)
		int pagepercount = 10;										// 페이지 당 표시할 게시글 갯수
		int blockSize = 5;											// 페이징 블록 사이즈
		PageDTO page = new PageDTO(currpage, totalCount, pagepercount, blockSize);
		
		// 쿼리 돌릴 값 (페이징)
		search_map.put("startrow", page.getStartrow());
		search_map.put("endrow", page.getEndrow());
		
		List<MemberDTO> memberlist = adservice.getMemberList(search_map);
		
		model.addAttribute("admin_category", "member");
		model.addAttribute("memberList", memberlist);
		model.addAttribute("paging", page);
			
		System.out.println(page.getCurrpage());
		
		// 페이징 검색 값
		HashMap<String, Object> test = new HashMap<>();
		String year = search_date.getSearch_date_year();
		String month = search_date.getSearch_date_month();
		if(user_name != null) test.put("user_name", user_name);
		if(year != null) test.put("search_date_year", year);
		if(month != null) test.put("search_date_month", month);
		if(user_authority != null) test.put("user_authority", user_authority);
		model.addAttribute("test", test);
		return "admin/memberlist.admin";
	}
	
	@RequestMapping("/admin/memberdetail/{memberno}")
	public String memberdetail(@PathVariable int memberno ,Model model) {
		
		MemberDTO memberdetail = adservice.getMemberDetail(memberno);

		HashMap<String, Object> search_map = new HashMap<>();
		search_map.put("member_no", memberno);
		int questioncount = adservice.getQuestionCount(search_map);
		
		model.addAttribute("count", questioncount);
		model.addAttribute("detail", memberdetail);
		model.addAttribute("admin_category", "member");
		return "admin/memberdetail.admin";
	}

	@RequestMapping("/admin/memberroleupdate")
	public String memberupdate(@RequestParam int member_no,
								@RequestParam String user_authority) {
		
		// 쿼리 돌릴 파라미터
		HashMap<String, Object> update_map = new HashMap<>();
		update_map.put("no", member_no);
		update_map.put("auth", user_authority);
		
		// 권한 업데이트 및 추가
		adservice.updateMemberRole(update_map);
		adservice.insertRealAuthority(update_map);
		
		//작가 페이지 생성
		artistservice.artistBoardInsertService(member_no);
		
		return "redirect:/admin/memberdetail/" + member_no;
	}
	
	@RequestMapping("/admin/deletemember/{memberno}")
	public String memberdelete(@PathVariable int memberno ,Model model) {

		int result = adservice.updateMemberStatus(memberno);
		return "redirect:/admin";
	}
	
	@RequestMapping("/admin/analnewmember")
	public String analnewmember(@RequestParam(required=false) String curr,
								 @ModelAttribute DateVO search_date,
								 Model model) {

		HashMap<String, Object> search_map = new HashMap<>();
		// 검색
		SimpleDateFormat sysdateyyyyMM = new SimpleDateFormat("yyyy-MM");
		Calendar time = Calendar.getInstance();
		String sysdate = sysdateyyyyMM.format(time.getTime());
		String tochar = sysdate;
		String date1 = search_date.getSearch_date_year();
		String date2 = search_date.getSearch_date_month();
		if(date1 != null || date2 != null) tochar = date1 + "-" + date2;
		if(tochar.equals("0-0")) tochar = sysdate;
		search_map.put("tochar", tochar);
		
		// 페이징
		int currpage = 1;
		if(curr != null) currpage = Integer.parseInt(curr);
		int totalCount = adservice.getNewMemberCount(tochar);		// count(*)
		int pagepercount = 10;										// 페이지 당 표시할 게시글 갯수
		int blockSize = 5;											// 페이징 블록 사이즈
		PageDTO page = new PageDTO(currpage, totalCount, pagepercount, blockSize);
		
		// 쿼리 돌릴 값 (페이징)
		search_map.put("startrow", page.getStartrow());
		search_map.put("endrow", page.getEndrow());
		
		List<NewMemberVO> newmember = adservice.getNewMemberList(search_map);
		
		// google chart
		List<String> test = new ArrayList<String>();
		Integer test1 = null;
		Integer test2 = null;
		String test3 = null;
		for(int i = 0; i < newmember.size(); i++) {
			test1 = (newmember.get(i).getJoin_date());
			test2 = newmember.get(i).getJoin_count();
			test3 = "[" + test1 + "," + test2 +"]";
			test.add(test3);
		}
		System.out.println(test.toString());
		
		model.addAttribute("list", newmember);
		model.addAttribute("admin_category", "anal");
		model.addAttribute("chart", test.toString());
		model.addAttribute("tochar", tochar);
		model.addAttribute("paging", page);
		return "admin/newmember.admin";
	}
	
	@RequestMapping("/admin/analproduct")
	public String analproduct(@RequestParam(required = false) String curr, 
			                   @ModelAttribute DateVO search_date, 
			                   Model model) {

		HashMap<String, Object> search_map = new HashMap<>();
		// 검색
		SimpleDateFormat sysdateyyyyMM = new SimpleDateFormat("yyyy-MM");
		Calendar time = Calendar.getInstance();
		String sysdate = sysdateyyyyMM.format(time.getTime());
		String tochar = sysdate;
		String date1 = search_date.getSearch_date_year();
		String date2 = search_date.getSearch_date_month();
		if(date1 != null || date2 != null) tochar = date1 + "-" + date2;
		if(tochar.equals("0-0")) tochar = sysdate;
		search_map.put("tochar", tochar);

		// 페이징
		int currpage = 1;
		if(curr != null) currpage = Integer.parseInt(curr);
		int totalCount = adservice.getPopularProductCount(tochar);	// count(*)
		int pagepercount = 10;										// 페이지 당 표시할 게시글 갯수
		int blockSize = 5;											// 페이징 블록 사이즈
		PageDTO page = new PageDTO(currpage, totalCount, pagepercount, blockSize);
		
		// 쿼리 돌릴 값 (페이징)
		search_map.put("startrow", page.getStartrow());
		search_map.put("endrow", page.getEndrow());
		
		List<ListDTO> list = adservice.getPopularProductList(search_map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", page);
		model.addAttribute("tochar", tochar);
		model.addAttribute("admin_category", "anal");
		return "admin/popularproducts.admin";
	}
	
	// 피씨 메인
	@RequestMapping("/admin/mainset")
	public String mainset(Model model) {
		
		List<MainViewDTO> list = adservice.getMainViewList();
		
		model.addAttribute("list", list);
		model.addAttribute("admin_category", "mainset");
		return "admin/mainset.admin";
	}

	// 모바일 메인
	@RequestMapping("/admin/mobilemainset")
	public String mobilemainset(Model model) {
		
		model.addAttribute("admin_category", "mainset");
		return "admin/mobilemainset.admin";
	}
	
	private String path = "C:\\bitcamp\\final\\finalProject\\src\\main\\webapp\\resources\\image";
	
	// 이미지 업로드
	@RequestMapping("/admin/imgtemplate")
	public String template1_Fileupload(MultipartHttpServletRequest multipartHttpServletRequest,
			 				  @RequestParam int main_view_no,
			 				  MultipartFile imagefile,
			 				  @RequestParam List<String> main_image_link,
			 				  Model model) {
		List<MultipartFile> multi = multipartHttpServletRequest.getFiles("imagefile");
		
		// 첫번째 템플릿은 다 정해져있음
		try {
			if (!multi.isEmpty()) {
				for(int i = 0; i < multi.size(); i++) {
					// 사진 업로드
					File file = new File(path, multi.get(i).getOriginalFilename());
					multi.get(i).transferTo(file);
				}
				// DB에 이미지 경로와 링크 등록
					for (int i = 0; i < main_image_link.size(); i++) {
						String imgpath = "/resources/image/" + multi.get(i).getOriginalFilename();
						System.out.println("사진" + i + 1);
						System.out.println("1. 이미지 경로 : " + imgpath);
						System.out.println("2. 이미지 링크 : " + main_image_link.get(i));

						HashMap<String, Object> upload_map = new HashMap<>();
						upload_map.put("main_image_path", imgpath);
						upload_map.put("main_image_link", main_image_link.get(i));
						if(main_view_no == 1) {
							upload_map.put("main_image_no", i + 1);
							adservice.updateMainImage(upload_map);
						}
						if(main_view_no == 3) {
							upload_map.put("main_image_no", 5);
							adservice.updateMainImage2(upload_map);
						}
						if(main_view_no == 23) {
							upload_map.put("main_image_no", i + 1 + 25);
							adservice.updateMainImage(upload_map);
						}
						if(main_view_no == 24) {
							upload_map.put("main_image_no", 30);
							adservice.updateMainImage2(upload_map);
						}
					}
			}
			return "admin/mainset.admin";
		} catch (IllegalStateException | IOException e) {
			System.out.println(e);
		}
		return "redirect:/admin/mainset";
	}
	
	@RequestMapping("/admin/productmodal")
	public String productModal(@RequestParam(required = false) String curr,
								@ModelAttribute ListDTO product,
								@RequestParam int main_view_no,
								Model model) {

		// 쿼리 돌릴 값 (검색)
		HashMap<String, Object> search_map = new HashMap<>();
		search_map.put("list_category", product.getList_category());
		search_map.put("list_product", product.getList_product());
		search_map.put("list_artist", product.getList_artist());
		
		// 페이징
		int currpage = 1;
		if(curr != null) currpage = Integer.parseInt(curr);
		int totalCount = adservice.getProductCount(search_map);		// count(*)
		int pagepercount = 5;										// 페이지 당 표시할 게시글 갯수
		int blockSize = 10;											// 페이징 블록 사이즈
		PageDTO page = new PageDTO(currpage, totalCount, pagepercount, blockSize);
		
		// 쿼리 돌릴 값 (페이징)
		search_map.put("startrow", page.getStartrow());
		search_map.put("endrow", page.getEndrow());
		
		// 리스트 가져오기
		List<ListDTO> list = adservice.getProductList(search_map);

		HashMap<String, Object> test = new HashMap<>();
		test.put("list_category", search_map.get("list_category"));
		test.put("list_product", search_map.get("list_product"));
		test.put("list_artist", search_map.get("list_artist"));
		test.put("main_view_no", main_view_no);
		
		// 페이징 검색 값
		model.addAttribute("test", test);
		model.addAttribute("list", list);
		model.addAttribute("paging", page);
		
		model.addAttribute("main_view_no", main_view_no);
		
		return "admin/productsearch";
	}
	
	@RequestMapping("/admin/producttemplate")
	public String productsubmit(@ModelAttribute MainViewDTO mainview,
								 @RequestParam(required=false) List<String> main_view_product,
								 Model model) {
		
		String product;
		if(main_view_product != null) {
			product = "";
			for(int i = 0; i < main_view_product.size(); i++) product += main_view_product.get(i) + ",";
		} else {
			product = null;
		}
		mainview.setMain_view_product(product);
		
		adservice.updateProductemplate(mainview);
		
		return "redirect:/admin/mainset";
	}
	
	@RequestMapping("/admin/qna")
	public String adminqna(@RequestParam(required=false) String curr,
			 				@ModelAttribute DateVO search_date,
			 				@ModelAttribute CustomerQABoardDTO qnadto,
			 				Model model) {

		// 쿼리 돌릴 값 (검색)
		HashMap<String, Object> search_map2 = new HashMap<>();
		search_map2.put("question_title", qnadto.getQuestion_title());
		search_map2.put("question_type", qnadto.getQuestion_type());
		String make_to_char = null;
		String date1 = search_date.getSearch_date_year();
		String date2 = search_date.getSearch_date_month();
		if(date1 != null || date2 != null) make_to_char = date1 + "-" + date2;
		search_map2.put("search_date", make_to_char);
		search_map2.put("answer_status", qnadto.getAnswer_status());
		search_map2.put("member_no", qnadto.getMember_no());
		
		// test
		System.out.println(search_map2.get("question_title"));
		System.out.println(search_map2.get("question_type"));
		System.out.println(search_map2.get("search_date"));
		System.out.println(search_map2.get("answer_status"));
		System.out.println("---------------------------");
		System.out.println(search_map2.get("member_no"));
		System.out.println("---------------------------");
		
		// 페이징
		int currpage = 1;
		if(curr != null) currpage = Integer.parseInt(curr);
		int totalCount = adservice.getQuestionCount(search_map2);	// count(*)
		int pagepercount = 10;										// 페이지 당 표시할 게시글 갯수
		int blockSize = 5;											// 페이징 블록 사이즈
		PageDTO page = new PageDTO(currpage, totalCount, pagepercount, blockSize);
		
		// 쿼리 돌릴 값 (페이징)
		search_map2.put("startrow", page.getStartrow());
		search_map2.put("endrow", page.getEndrow());
		
		// 리스트 가져오기
		List<CustomerQABoardDTO> question = adservice.getCustomerQuestion(search_map2);
		
		model.addAttribute("list", question);
		model.addAttribute("admin_category", "operate");
		
		HashMap<String, Object> test = new HashMap<>();
		test.put("question_title", search_map2.get("question_title"));
		test.put("search_date", search_date);
		test.put("search_date", search_map2.get("search_date"));
		test.put("answer_status", search_map2.get("answer_status"));
		
		// 페이징 검색 값
		model.addAttribute("test", test);
		model.addAttribute("paging", page);
		return "admin/questionlist.admin";
	}
	
	@RequestMapping("/admin/answer/{questionno}")
	public String answer(@PathVariable int questionno, Model model) {
		CustomerQABoardDTO qna = adservice.getQnADetail(questionno);
		
		model.addAttribute("dto", qna);
		model.addAttribute("admin_category", "operate");
		return "admin/answer.admin";
	}

	@RequestMapping("/admin/deletequestion/{questionno}")
	public String deletequestion(@PathVariable int questionno, Model model) {
		int result = adservice.deleteQuestion(questionno);
		
		model.addAttribute("result", result);
		model.addAttribute("admin_category", "operate");
		return "redirect:/admin/qna";
	}
	
	@RequestMapping("/admin/answercontentupdate/{questionno}")
	public String answercontent(@RequestParam(required = false) String answer_content,
								 @PathVariable int questionno,
								 Model model) {
		HashMap<String, Object> update_map = new HashMap<>();
		update_map.put("answer_content", answer_content);
		update_map.put("question_no", questionno);
		int result = adservice.updateAnswerContent(update_map);
		
		model.addAttribute("result", result);
		model.addAttribute("admin_category", "operate");
		return "redirect:/admin/answer/" + questionno;
	}
	
	@RequestMapping("/admin/updateanswercontent/{questionno}")
	public String answerupdateform(@PathVariable int questionno, Model model) {
		CustomerQABoardDTO qna = adservice.getQnADetail(questionno);
		
		model.addAttribute("dto", qna);
		return "admin/answerupdate";
	}
	
	@RequestMapping("/admin/answermodify/{questionno}")
	public String qnamodify(@RequestParam String answer_content, @PathVariable int questionno, Model model) {
		HashMap<String, Object> update_map = new HashMap<>();
		update_map.put("content", answer_content);
		update_map.put("questionno", questionno);
		int result = adservice.modifyAnswerContent(update_map);
		
		model.addAttribute("result", result);
		return "redirect:/admin/answer/" + questionno;
	}
	
	@RequestMapping("/admin/deleteallquestion")
	public String deleteallquestion(@RequestParam String deleteall, Model model) {
		String[] delete = deleteall.split(",");
		for(int i = 0; i < delete.length; i++) {
			adservice.deleteAllQuestion(delete[i]);
		}
		return "redirect:/admin/qna";
	}
	
}
