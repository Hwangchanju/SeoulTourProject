package com.spring.project.commons;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageCreator {

	private PageVO paging;
	private int articleTotalCount;	// 게시판의 총 게시물 수 
	
	private int beginPage;	// 시작 페이지 번호
	private int endPage;	// 끝 페이지 번호
	private boolean prev; // 이전 버튼 활성화 여부
	private boolean next; // 다음 버튼 활성화 여부
	
	private final int displayPageNum = 5;	// 한 화면에 보여진 버튼 개수
	
	public String makeURI(int page, int counterPerPage) {
		UriComponents ucp = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("counterPerPage", counterPerPage)
				.queryParam("keyword", ((SearchVO)paging).getKeyword())
				.queryParam("condition", ((SearchVO)paging).getCondition())
				.build();
		return ucp.toString();
	}
	
	
	private void calcDataOfPage() {
		
		// 보정 전 끝 페이지 구하기
		endPage = (int)(Math.ceil(paging.getPage()/(double)displayPageNum)*displayPageNum);

		// 시작 페이지 번호 구하기
		beginPage = (endPage - displayPageNum)+1 ;

		// 현재 시작페이지가 1이라면, 이전 버튼을 활성화할지 여부를 지정
		prev = (beginPage==1)? false : true;

		// 마지막 페이지인지 여부 확인 후 다음 버튼 비활성화 판단
		next = (articleTotalCount<=(endPage * paging.getCounterPerPage())) ? false : true;

		// 다음 버튼이 비활성화라면 끝 페이지를 재 보정
		if(!isNext()) {
			endPage= (int)(Math.ceil(articleTotalCount/(double)paging.getCounterPerPage()));
		}
	}


	public PageVO getPaging() {
		return paging;
	}


	public void setPaging(PageVO paging) {
		this.paging = paging;
	}


	public int getArticleTotalCount() {
		return articleTotalCount;
	}


	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	
	
}
