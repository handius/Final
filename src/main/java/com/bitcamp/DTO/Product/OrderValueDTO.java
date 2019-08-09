package com.bitcamp.DTO.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class OrderValueDTO {
	private int member_no;
	private int list_order_no;
	private String order_value;
}
