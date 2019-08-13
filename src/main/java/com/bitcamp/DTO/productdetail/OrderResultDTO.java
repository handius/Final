package com.bitcamp.DTO.productdetail;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class OrderResultDTO {
	private String order_name;
	private String order_option;
	private String order_value;
}
