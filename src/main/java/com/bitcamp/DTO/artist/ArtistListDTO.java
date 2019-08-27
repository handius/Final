package com.bitcamp.DTO.artist;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter @Setter
public class ArtistListDTO {
	private ArtistBoardDTO artistBoarddto;
	private List<Integer> listNo;
	private List<String> listImg;
	private String searchText;
}