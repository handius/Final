package com.bitcamp.DTO.productdetail;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class OrderResultDTO {
	private int list_order_no;
	private String order_name;
	private String order_option;
	private int list_order_member_no;
	private String order_value;
	private String order_value_TextColor;
}
