package com.bitcamp.VO.admin;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@ToString
public class MainProductVO {
	private int list_no;
	private String list_title;
	private int list_base_price;
	private String list_image_loc;
}
