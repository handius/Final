package com.bitcamp.DTO.Product;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * 작성자 : 윤건일
 * 프로그램 이름 : OrderOptionDTO
 * 내용 : 사용자에게 요구할 요구사항을 저장할 DTO
 */
@ToString
@NoArgsConstructor
@Getter @Setter
public class OrderOptionDTO {
	private int list_order_no;
	private String order_name;
	private String order_option;
}
