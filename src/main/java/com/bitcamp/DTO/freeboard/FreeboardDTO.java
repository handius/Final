package com.bitcamp.DTO.freeboard;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class FreeboardDTO {
	private int freeboard_no;
	private String freeboard_title;
	private String freeboard_content;
	private String freeboard_regiTime;
	private int freeboard_hits;
	private int freeboard_status;
	private String freeboard_category;
	private int freeboard_member_no;
	private String user_nick;
	private int freeboard_rep_count;
}
