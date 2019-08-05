package com.bitcamp.DTO.member;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Getter @Setter
public class MemberDTO {
	private int member_no;
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_nick;
	private String user_email;
	private String user_address;
	private Date user_regiDate;
	private int user_status;
	private int user_call;
	private String user_certKey;
	private int user_certStatus;
	private String user_flatform;
}
