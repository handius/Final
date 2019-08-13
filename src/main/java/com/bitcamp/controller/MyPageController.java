package com.bitcamp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;

	@RequestMapping("mypage")
	public String myPage() {
		return "mypage/myPage";
	}
}
