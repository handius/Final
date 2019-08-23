package com.bitcamp.DTO.artist;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class ArtistRepDTO {
	private int artist_rep_no;
	private int artist_no;
	private int member_no;
	private String artist_rep_content;
	private Date artist_rep_date;
	private String user_name;
}
