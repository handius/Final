package com.bitcamp.DTO.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * 작성자 : 윤건일
 * 프로그램 이름 : OptionDTO
 * 내용 : 제품 게시글이 가지고 있을 옵션 값을 저장하는 DTO
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class OptionDTO {
	private String option_name;
	private int option_stock;
	private int option_price;
}
