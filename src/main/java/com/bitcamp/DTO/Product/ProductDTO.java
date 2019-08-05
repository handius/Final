package com.bitcamp.DTO.Product;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class ProductDTO {
	private int list_no;
	private String list_title;
	private String list_artist;
	private String list_product;
	private String list_category;
	private String list_content;
	private int list_base_price;
	private String list_date;
	private int buy_count;
	private int isordered;
	private String ordered_content;
	private int list_status;
}
