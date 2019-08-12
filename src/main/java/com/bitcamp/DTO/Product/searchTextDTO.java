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
public class searchTextDTO {
	private String filter_data;
	private int today_data;
	private int oweek_ago_data;
	private int tweek_ago_data;
	private int thweek_ago_data;
	private String renewal_time;
	private String search_text;
}
