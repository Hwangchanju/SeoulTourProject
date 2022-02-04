package com.spring.project.commons;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchVO extends PageVO{
	private String keyword;
	private String condition;
	private String content_id;
	
	public SearchVO() {
		this.keyword = "";
		this.condition="title";
	}
	
	@Override
	public String toString() {
		return "search : "+this.keyword+"/"+this.condition;
	}
}
