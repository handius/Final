package com.bitcamp.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bitcamp.DTO.member.MemberDTO;
import com.bitcamp.comm.DBConfigration;
import com.bitcamp.mapper.MemberMapper;
import com.bitcamp.service.ProductService;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { DBConfigration.class, ProductService.class })
public class MemberTest {


}
