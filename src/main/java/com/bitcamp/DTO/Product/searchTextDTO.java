package com.bitcamp.DTO.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * 작성자 : 윤건일
 * 프로그램 이름 : searchTextDTO
 * 내용 : 데이터 베이스를 통해 파이썬과 연결될 데이터들을 주고 받을 DTO
 */
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class searchTextDTO {
	private String filter_data;
	private int today_data;
	private int oweek_ago_data;
	private int tweek_ago_data;
	private int thweek_ago_data;
	private String renewal_time;
	private String search_text;
	private String now_text;
}
