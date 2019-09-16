package com.bitcamp.DTO.mypage;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class OrderOrderDTO {
	private int member_no;
	private int list_no;
	private int list_order_no;
	private int list_order_member_no;
	private String order_name;
	private String order_option;
	private String order_value;
}
