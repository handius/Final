package com.bitcamp.VO.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Setter;
import lombok.ToString;

@Setter
@ToString
public class NewMemberVO {
	private Date join_date;
	private int join_count;
	public int getJoin_date() {
		SimpleDateFormat format = new SimpleDateFormat("dd");
		Integer result = Integer.parseInt(format.format(join_date));
		return result;
	}
	public int getJoin_count() {
		return join_count;
	}
}
