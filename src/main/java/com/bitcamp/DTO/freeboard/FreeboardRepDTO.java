package com.bitcamp.DTO.freeboard;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class FreeboardRepDTO {
	
	private int rep_no;
	private int member_no;
	private int freeboard_no;
	private String rep_content;
	private String rep_regiDate;
	private int rep_parent_no;

}
