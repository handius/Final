package com.bitcamp.DTO.productdetail;


import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class QABoardDTO {
	private int qa_board_no;
	private int list_no;
	private int member_no;
	private Date qa_board_date;
	private String qa_board_content;
	private int qa_board_secret;
	private String qa_board_status;
	private int qa_board_delete_status;
	private int qa_board_parent_no;
	private int start_sql;
	private int end_sql;
	private String user_name;
	private int level;
}
