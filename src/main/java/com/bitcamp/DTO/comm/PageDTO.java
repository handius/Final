package com.bitcamp.DTO.comm;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@NoArgsConstructor
@Getter @Setter
public class PageDTO {
	private int pagepercount;
	private int totalcount;
	private int totalpage;
	private int startrow;
	private int endrow;
	private int blocksize;
	private int startblock;
	private int endblock;
	private int currpage;
	private boolean next;
	private boolean prev;
	
	public PageDTO(int currpage, int totalCount, int pagepercount, int blockSize) {
		this.currpage = currpage;
		this.totalcount = totalCount;
		this.pagepercount = pagepercount;
		this.blocksize = blockSize;
		calData();
	}
	
	private void calData() {
		startrow = (currpage-1) * pagepercount+1;
		endrow = startrow+pagepercount-1;
		if(endrow > totalcount) {
			endrow = totalcount;
		}
		startblock = (((currpage-1)/blocksize)*blocksize)+1;
		endblock = startblock+blocksize-1;
		
		totalpage = (int)Math.ceil(totalcount/(double)pagepercount);
		if(endblock > totalpage) {
			endblock = totalpage;
		}
		prev = (startblock==1)?false:true;
		next = (endblock<totalpage)? true:false;
	}
}
