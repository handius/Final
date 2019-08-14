package com.bitcamp.DTO.productdetail;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class BuyReviewDTO {
	private int buy_review_no;
	private int order_no;
	private Date buy_review_date;
	private String buy_review_content;
	private String buy_review_image_loc;
	private int buy_review_score;
	private int buy_review_status;
	private String order_add_option;
	private int member_no;
	private String user_nick;
}
