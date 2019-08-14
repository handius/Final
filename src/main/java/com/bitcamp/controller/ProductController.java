package com.bitcamp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.VO.file.FileVO;
import com.bitcamp.service.ProductService;

@Controller
public class ProductController {
	@Resource(name="pservice")
	private ProductService service;
	
	@RequestMapping(value="/orderList", method= {RequestMethod.POST, RequestMethod.GET})
	public String listProduct(HttpSession session, @RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, @RequestParam(defaultValue="")String order, Model model) {
		//임시 파일 삭제
		String path = session.getServletContext().getRealPath("/resources/image/dimage");
		service.checkImageValidateService(path);
		//리스트 띄우기
		int orders = 3;
		if(order != null && order != "" && order.length() > 0) {
			orders = Integer.parseInt(order);
		}
		String list_category = "";
		int pagePerCount = 16;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status, orders);
		System.out.println("hashList : " + hashTag);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status, orders);
		List<String> hashList = service.getHashService(20);
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/orderList.mall";
	}
	
	@RequestMapping(value="/orderList/{category}", method= {RequestMethod.POST, RequestMethod.GET})
	public String listProduct(@RequestParam(defaultValue="")String searchType, @RequestParam(defaultValue="")String searchData, @RequestParam(defaultValue="1")int currpage, @PathVariable(required=false, name="category")String list_category, @RequestParam(defaultValue="")List<String> hashTag, @RequestParam(defaultValue="0")int hasStock, @RequestParam(defaultValue="1")int status, @RequestParam(defaultValue="")String order, Model model) {
		int orders = 3;
		if(order != null && order != "" && order.length() > 0) {
			orders = Integer.parseInt(order);
		}
		int pagePerCount = 16;
		int blockSize = 5;
		int totalCount = service.getCountService(searchType, searchData, list_category, hashTag, hasStock, status ,orders);
		PageDTO dto = new PageDTO(currpage, totalCount, pagePerCount, blockSize);
		List<ListDTO> list = service.getListService(searchType, searchData, dto, list_category, hashTag, hasStock, status, orders);
		List<String> hashList = service.getHashService(20);
		model.addAttribute("list", list);
		model.addAttribute("PageDTO", dto);
		model.addAttribute("hashList", hashList);
		return "sell/orderList.mall";
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxHashPager", method={RequestMethod.POST, RequestMethod.GET})
	public List<String> ajaxHashPager(@RequestParam int hashPage) {
		int endrow = hashPage * 12;
		return service.getHashService(endrow);
	}
	
	@ResponseBody
	@RequestMapping(value="/ajaxHashSearcher", method={RequestMethod.POST, RequestMethod.GET})
	public List<String> ajaxHashPager(@RequestParam String searchData) {
		return service.getHashSearchService(searchData);
	}
	
	@RequestMapping(value="/sell", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellProduct() {
		return "sell/sell.mall";
	}
	
	@RequestMapping(value="/sell/insertPerfectOrder", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellPerfectOrder(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		if(dto!=null) {
			return "sell/insertPerfectOrder.mall";
		}else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/sell/insertOrderMade", method= {RequestMethod.POST, RequestMethod.GET})
	public String sellOrderMade(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("member");
		if(dto!=null) {
			return "sell/insertOrderMade.mall";
		}else {
			return "redirect:/login";
		}
	}
	
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
	
	@RequestMapping(value="*/insertPerfectOrderForm", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertPerfectOrder(ListDTO dto,HttpSession session){
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		if(mdto!=null) {
			System.out.println(dto);
			int result = service.insertPerfectOrderDataService(dto, mdto.getUser_id());
			System.out.println("결과 : " + result);
			return "redirect:/orderList";
		}else {
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping(value="*/insertOrderMadeForm", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertOrderMade(ListDTO dto, HttpSession session){
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		if(mdto!=null) {
			System.out.println(dto);
			int result = service.insertOrderMadeDataService(dto, mdto.getUser_id());
			System.out.println("결과 : " + result);
			return "redirect:/orderList";
		}else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value="/checkIsOrdered", method= {RequestMethod.POST, RequestMethod.GET})
	public String checkOrder(HttpSession session, @RequestParam() int no, Model model) {
		
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		ListDTO dto = service.getNoListService(no);			
		if(dto.getIsordered() == 0) {
			return "redirect:/productDetail/"+no;
		}else if(mdto!=null){
			int member_no = mdto.getMember_no();
			List<OrderOptionDTO> odto = service.getOrderListService(dto);
			System.out.println("odto" + odto);
			model.addAttribute("ListDTO",dto);
			model.addAttribute("orders", odto);
			model.addAttribute("member_no", member_no);
			return "sell/insertOrderOption.mall";
		}else {
			return "redirect:/login";
		}
	}
	@RequestMapping(value="/checking", method= {RequestMethod.POST, RequestMethod.GET})
	public String check(HttpSession session,@RequestParam(required=false)List<MultipartFile> order_picture, @RequestParam(required=false)List<String> order_color, @RequestParam(required=false)List<String> order_text, @RequestParam(required=false)List<String> order_count, @RequestParam(required=true)int member_no, @RequestParam(required=true)int list_no) {
		Queue<String> queue = new LinkedList<String>();
		Queue<String> cqueue = new LinkedList<String>();
		Queue<String> tqueue = new LinkedList<String>();
		String uploadFileName = null;
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
		if(order_color != null) {
			for(int i=0; i<order_color.size(); i++) {
				cqueue.offer(order_color.get(i));
			}
		}
		if(order_text != null) {
			for(int i=0; i<order_text.size(); i++) {
				tqueue.offer(order_text.get(i));
			}
		}
		List<OrderValueDTO> ovlist = new ArrayList<>();  
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
		List<Integer> list_order_member_no = service.insertOrderOptionService(ovlist);
		
		System.out.println(order_count);
		System.out.println(list_order_member_no);
		session.setAttribute("list_order_member_no", list_order_member_no);
		return "redirect:/productDetail/"+list_no;
	}
	
	@RequestMapping(value="/admin/searchText", method= {RequestMethod.POST, RequestMethod.GET})
	public String searchText(Model model) {
		model.addAttribute("admin_category", "anal");
		return "admin/dataanalysis.admin";
	}
	
	@ResponseBody
	@RequestMapping(value="getsearchTextData", method= {RequestMethod.POST, RequestMethod.GET})
	public List<searchTextDTO> searchData() {
		List<searchTextDTO> datas = service.getSearchTextService();
		return datas;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertSearcher" ,method={RequestMethod.POST, RequestMethod.GET})
	public int insertSearcher(@RequestParam(required=false)String searchData) {
		System.out.println("data ::" + searchData);
		return service.insertSearcherService(searchData);
	}
}
