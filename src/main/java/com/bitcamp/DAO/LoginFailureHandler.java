package com.bitcamp.DAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {

	private String defaultFailureUrl;
	String errormsg;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String error = exception.getMessage();
		String errormsg = "로그인 실패입니다.";

		System.out.println(errormsg);
		if (exception instanceof BadCredentialsException) {
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요";
		} else if (exception instanceof InternalAuthenticationServiceException) {
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요";
		} else if (exception instanceof DisabledException) {
			errormsg = "계정이 잠겨있습니다. 관리자에게 문의하세요.";
		} else if (exception instanceof CredentialsExpiredException) {
			errormsg = "비밀번호 유효기간이 만료되었습니다. 관리자에게 문의하세요.";
		}
		
		request.setAttribute("ERRORMSG", errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

}
