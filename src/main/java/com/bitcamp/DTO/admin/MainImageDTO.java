package com.bitcamp.DTO.admin;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class MainImageDTO {
	private int main_image_no;
	private String main_image_path;
	private Date main_image_date;
	private String main_image_link;
	private int main_view_no;
}
