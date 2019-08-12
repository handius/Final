package com.bitcamp.DTO.customerqaboard;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CustomerQABoardDTO {
	private int question_no;
	private int member_no;
	private String question_title;
	private String question_content;
	private String question_date;
	private String answer_content;
	private String answer_status;
	private boolean question_delete_status;
	private String question_type;
	//리스트 뿌리는 용도
	private String user_name;
}
