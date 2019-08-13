package com.bitcamp.DTO.freeboard;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class FreeboardDTO {
	private int freeboard_no;
	private String freeboard_title;
	private String freeboard_content;
	private String freeboard_regiTime;
	private int freeboard_hits;
	private int freeboard_status;
	private String freeboard_category;
	private int member_no;
}
