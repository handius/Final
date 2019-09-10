package com.bitcamp.DAO;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.bitcamp.service.CustomUserDetailService;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String defaultFailureUrl;
	private String errormsg;
	private String username;
	
	@Resource
	private CustomUserDetailService userService;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		System.out.println(exception);
		String errormsg = "로그인에 실패하였습니다. 관리자에게 문의하세요.";
		
		if (exception instanceof BadCredentialsException) {
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		} else if (exception instanceof InternalAuthenticationServiceException) {
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		}		
		
		request.setAttribute("ERRORMSG", errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

}
