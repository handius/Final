package com.bitcamp.DTO.member;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor

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
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public Date getUser_regiDate() {
		return user_regiDate;
	}
	public void setUser_regiDate(Date user_regiDate) {
		this.user_regiDate = user_regiDate;
	}
	public int getUser_status() {
		return user_status;
	}
	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	public int getUser_call() {
		return user_call;
	}
	public void setUser_call(int user_call) {
		this.user_call = user_call;
	}
	public String getUser_certKey() {
		return user_certKey;
	}
	public void setUser_certKey(String user_certKey) {
		this.user_certKey = user_certKey;
	}
	public int getUser_certStatus() {
		return user_certStatus;
	}
	public void setUser_certStatus(int user_certStatus) {
		this.user_certStatus = user_certStatus;
	}
	public String getUser_flatform() {
		return user_flatform;
	}
	public void setUser_flatform(String user_flatform) {
		this.user_flatform = user_flatform;
	}
	
	
}
