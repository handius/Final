package com.bitcamp.DAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

public class InterceptFailureHandler implements AuthenticationEntryPoint{

	@Override
	public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException)
			throws IOException, ServletException {
		System.out.println("오류 핸들러");
		System.out.println(authException);
		response.sendRedirect(request.getContextPath()+"/interceptFailure?error="+authException.getLocalizedMessage());
	}

}
