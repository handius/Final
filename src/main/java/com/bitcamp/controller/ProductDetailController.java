package com.bitcamp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.DTO.productdetail.BuyReviewDTO;
import com.bitcamp.DTO.productdetail.QABoardDTO;
import com.bitcamp.VO.file.FileVO;
import com.bitcamp.service.ProductDetailService;

@Controller
public class ProductDetailController {
	
	@Autowired
	private ProductDetailService service;

	@RequestMapping("/productDetail/{list_no}")
	public String productDetail(@PathVariable int list_no ,HttpSession session ,Model model) {
		System.out.println(list_no); //테스트
		Map<String, Object> map = service.productDetailService(list_no);
		
		Object tmp_list_order_member_no = session.getAttribute("list_order_member_no");
		
		//고객 주문리스트가 있다면
		if(tmp_list_order_member_no != null) {
			List<Integer> list_order_member_no = (List<Integer>)tmp_list_order_member_no;
			model.addAttribute("orderList", service.productDetailOrderService(list_order_member_no));
		}
		
		model.addAttribute("listDTO", map.get("productDetail"));
		model.addAttribute("imgList", map.get("productDetailImg"));
		model.addAttribute("optionList", map.get("productDetailOption"));
		model.addAttribute("artistInfo", map.get("productDetailArtistInfo"));
		model.addAttribute("qaBoardList", map.get("productDetailQABoardList"));
		model.addAttribute("QACurrentPage", 1);
		return "productdetail/productdetail.mall";
	}
	
	
	@RequestMapping("/ajaxqaboardinsert")
	public @ResponseBody String ajaxqaboardinsert(@RequestBody Map<String, Object> map, HttpSession session) {
		String insertResult = "-1";
		Object objmember = session.getAttribute("member");
		if(objmember != null) {
			MemberDTO memberdto = (MemberDTO)session.getAttribute("member");	
			System.out.println("디티오 정보 : "+memberdto);
			
			int list_no = Integer.parseInt((String)map.get("list_no"));
			int member_no = memberdto.getMember_no();
			String qa_board_content =  (String) map.get("qa_content");
			int qa_board_secret = 0;
			if(map.get("qa_secret").equals(true)) {
				qa_board_secret = 1;
			}
			
			QABoardDTO dto = new QABoardDTO();
			dto.setList_no(list_no);
			dto.setMember_no(member_no);
			dto.setQa_board_content(qa_board_content);
			dto.setQa_board_secret(qa_board_secret);
			
			insertResult = Integer.toString(service.productDetailQandAInsertService(dto));
		}
		
		return insertResult;
	}
	
	@RequestMapping(value="/ajaxqaboardList", method= {RequestMethod.POST})
	public @ResponseBody List<QABoardDTO> ajaxqaboardList(@RequestBody Map<String, String> map) {
		
		int list_no = Integer.parseInt(map.get("list_no"));
		int qaCurrentPage = Integer.parseInt(map.get("currentpage"));
		int sqlSize = 5;
		int start_sql = (qaCurrentPage-1) * sqlSize + 1;
		int end_sql = start_sql + sqlSize -1;
		
		QABoardDTO dto = new QABoardDTO();
		dto.setList_no(list_no);
		dto.setStart_sql(start_sql);
		dto.setEnd_sql(end_sql);
		
		return service.productDetailQandAList(dto);
	}
	
	@RequestMapping("/tmpReview")
	public String BuyReviewInsertForm() {
		return "productdetail/TmpInsertBuyReview";
	}
	
	@RequestMapping(value="/ajaxBuyReviewImgUpload", method= {RequestMethod.POST})
	@ResponseBody
	public FileVO ajaxBuyReviewImgUpload(HttpSession session, MultipartFile[] uploadFile) {
		FileVO filevo = new FileVO();
		
		if(uploadFile.length != 0) {
			String buyReviewImgFolder = session.getServletContext().getRealPath("/resources/image/buyReviewImg");
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString() + "-" + uploadFile[0].getOriginalFilename();
			filevo.setFileName(fileName);
			filevo.setUploadPath(buyReviewImgFolder);
			filevo.setUuid(uuid.toString());
			try {
				File file = new File(buyReviewImgFolder, fileName);
				uploadFile[0].transferTo(file);
			}
			catch(IOException e) {
				System.out.println(e);
			}
		}
		return filevo;
	}
	
	@RequestMapping("/buyReviewResult")
	public String buyReviewResult(@RequestParam int BuyReviewScore, @RequestParam String BuyReviewContent
			, @RequestParam String BuyReviewImg ) {
		BuyReviewDTO buyreviewdto = new BuyReviewDTO();
		buyreviewdto.setOrder_no(41); //임의  주문번호
		buyreviewdto.setBuy_review_content(BuyReviewContent);
		buyreviewdto.setBuy_review_score(BuyReviewScore);
		if(BuyReviewImg != null) {
			buyreviewdto.setBuy_review_image_loc(BuyReviewImg);
		}
		int insertResult = service.buyReviewInsertService(buyreviewdto);
		if(insertResult == 1) {
			System.out.println("등록에 성공했습니다.");
		}
		else {
			System.out.println("등록에 실패했습니다.");
		}
		return "redirect:/login";
	}
}
