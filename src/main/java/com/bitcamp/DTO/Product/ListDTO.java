package com.bitcamp.DTO.Product;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
/*
 * 작성자 : 윤건일
 * 프로그램 이름 : ListDTO
 * 내용 : 전체적인 게시글 정보를 포함하고 있는 DTO
 * 
 */
@NoArgsConstructor
@Getter @Setter
@ToString
public class ListDTO {
	private int list_no;
	private String list_title;
	private String list_artist;
	private String list_product;
	private int list_base_price;
	private String list_category;
	private String list_content;
	private String list_date;
	private List<String> list_image_loc;
	private List<String> list_hash;
	private int isordered;
	private List<String> option_name;
	private List<Integer> option_stock;
	private List<Integer> option_price;
	private String ordered_content;
	private List<String> order_name;
	private List<String> order_option;
	private int buy_count;
	private int list_status;
	private int rnum;
}
