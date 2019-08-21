package com.bitcamp.DTO.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * 작성자 : 윤건일
 * 프로그램 이름 : OrderValueDTO
 * 내용 : 사용자가 게시글 작성자에게 요구할 사용자 요구사항의 값을 저장할 DTO
 */
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class OrderValueDTO {
	private int member_no;
	private int list_order_no;
	private String order_value;
}
