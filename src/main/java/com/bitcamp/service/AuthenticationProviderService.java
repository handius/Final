package com.bitcamp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.bitcamp.DAO.CustomUser;

public class AuthenticationProviderService implements org.springframework.security.authentication.AuthenticationProvider{

	@Autowired
	private UserDetailsService service;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String username= (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		CustomUser user= (CustomUser) service.loadUserByUsername(username);
		
        if(!matchPassword(password, user.getPassword())) {
            throw new BadCredentialsException(username);
        }
 
        if(!user.isEnabled()) {
            throw new BadCredentialsException(username);
        }
        
        return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

	private boolean matchPassword(String password, String password2) {
		return password.equals(password2);
	}
}
