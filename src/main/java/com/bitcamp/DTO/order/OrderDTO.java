package com.bitcamp.DTO.order;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class OrderDTO {
	private int order_no;
	private int list_no;
	private int member_no;
	private int order_price;
	private List<Integer> order_add_option;
	private List<String> option_name;
	private List<Integer> order_amount;
	private List<Integer> option_price;
	private String order_date;
	private String order_status;
	private int artist_no;
	private List<Integer> list_order_no;
	private List<Integer> ordermade_no;
	private List<String> order_value;

	private String list_title;
}
