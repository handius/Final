package com.bitcamp.DTO.artist;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class ArtistBoardDTO {
	private int artist_no;
	private int member_no;
	private String artist_board_title;
	private String artist_main_img;
	private int artist_count;
	private float artist_score;
	private int artist_board_status;
	private String user_id;
	private String user_name;
}
