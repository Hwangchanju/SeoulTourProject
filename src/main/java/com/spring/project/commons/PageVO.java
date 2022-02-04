package com.spring.project.commons;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PageVO {

	private int page;	// 사용자가 요청한 페이지
	private int counterPerPage; 	// 한 페이지당 들어갈 게시물
	
	public PageVO() {
		this.page =1;
		this.counterPerPage = 8;
	}
	
}
