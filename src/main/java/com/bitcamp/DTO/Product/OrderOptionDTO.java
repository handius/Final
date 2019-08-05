package com.bitcamp.DTO.Product;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class OrderOptionDTO {
	private int list_order_no;
	private int list_no;
	private String order_name;
	private String order_option;
}
