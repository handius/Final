package com.bitcamp.mapper;

public interface JoinMapper {
	
	public int userIdCheck(String user_id);
	public void userJoin(String id, String password, String name, String email, String address);
	
}
