package com.bitcamp.DTO.freeboard;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class FreeboardDTO {
	private int freeboard_no;
	private String freeboard_title;
	private String freeboard_content;
	private Date freeboard_regiTime;
	private String freeboard_hits;
	private String freeboard_status;
	private String freeboard_category;
}
