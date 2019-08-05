package com.bitcamp.DTO.freeboard;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class FreeboardRepDTO {
	
	private int rep_no;
	private int member_no;
	private int freeboard_no;
	private String rep_content;
	private Date rep_regiDate;
	private int rep_parent_no;

}
