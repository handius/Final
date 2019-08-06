package com.bitcamp.VO.file;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class FileVO {
	private String fileName;
	private String uploadPath;
	private String uuid;
}
