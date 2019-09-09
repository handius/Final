package com.bitcamp.controller;

import java.io.IOException;
import java.security.Principal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.DAO.CustomUser;
import com.bitcamp.DAO.NaverLoginVO;
import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.service.CustomUserDetailService;
import com.bitcamp.service.MemberService;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class LoginContoller {

	@Resource
	private MemberService memberService;

	@Resource
	private CustomUserDetailService userService;

	private NaverLoginVO naverLoginVO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginVO(NaverLoginVO naverLoginVO) {
		this.naverLoginVO = naverLoginVO;
	}
	
	@RequestMapping(value = "login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(HttpSession session, Model model) {
		String naverAuthUrl = naverLoginVO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		return "login/loginform";
	}

	@RequestMapping("searchID")
	public String searchID() {
		return "login/searchIDform.mall";
	}

	@RequestMapping("searchPassword")
	public String searchPassword() {
		return "login/searchPasswordform.mall";
	}

	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request, Model model) {
		String user_id = request.getParameter("id");
		model.addAttribute("id", user_id);
		return "login/changePasswordform.mall";
	}

	@RequestMapping(value = "login/loginResult", method = RequestMethod.GET)
	public String loginResult(Principal prin, HttpServletRequest request) {
		CustomUser user = (CustomUser) userService.loadUserByUsername(prin.getName());
		System.out.println(user.getMember());

		HttpSession session = request.getSession();
		session.setAttribute("member", user.getMember()); // 로그인 정보 세션 설정

		if (memberService.checkAuth(user.getMember(), "ROLE_ADMIN"))
			return "redirect:/admin";
		return "redirect:/";
	}

	@RequestMapping(value = "/searchIDResult", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String SearchIDResult(@ModelAttribute MemberDTO dto) {
		String data = memberService.searchID(dto);
		return data;
	}

	@RequestMapping(value = "/searchPasswordResult", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int searchPasswordResult(@ModelAttribute MemberDTO dto) {
		System.out.println(memberService.searchPassword(dto));
		int data = memberService.searchPassword(dto);
		return data;
	}

	@RequestMapping(value = "/changePasswordResult", method = RequestMethod.POST)
	public String changePasswordChangeResult(@ModelAttribute MemberDTO dto) {
		memberService.changePassword(dto);
		return "redirect:/";
	}

	@RequestMapping("login/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		System.out.println("로갓");

		return "redirect:/";
	}
	
	@RequestMapping("logintest")
	public String lg(Principal prin){
		return "login/logintest";
	}
	
	@RequestMapping("interceptFailure")
	public String interceptfailure(){
		System.out.println("접근거부");
		return "login/access_denied_page";
	}
	
	@RequestMapping("callback")
	public String ca(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginVO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginVO.getUserProfile(oauthToken); //String형식의 json데이터
		System.out.println("=======================");
		System.out.println(apiResult.toString());
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		System.out.println(response_obj.toString());
		System.out.println(nickname);
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("sessionId",nickname); //세션 생성
		model.addAttribute("result", apiResult);

		return "redirect:/";
	}

}
