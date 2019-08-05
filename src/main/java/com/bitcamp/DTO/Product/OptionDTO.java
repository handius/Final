package com.bitcamp.DTO.Product;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
public class OptionDTO {
	private int option_no;
	private int list_no;
	private String option_name;
	private String option_stock;
	private int option_price;
}
