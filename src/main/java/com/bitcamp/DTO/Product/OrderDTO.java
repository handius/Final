package com.bitcamp.DTO.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
public class OrderDTO {
	private int list_order_no;
	private int list_no;
	private String order_name;
	private String order_option;
}
