package com.bitcamp.DTO.productdetail;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class ProductDetailOptionListDTO {
	private int option_no;
	private String option_name;
	private int option_stock;
	private int option_price;
}
