package com.bitcamp.DTO.Product;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Getter @Setter
public class OrderOptionDTO {
	private int list_order_no;
	private String order_name;
	private String order_option;
}
