package com.bitcamp.VO.admin;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class NewMemberVO {
	private Date join_date;
	private int join_count;
}
