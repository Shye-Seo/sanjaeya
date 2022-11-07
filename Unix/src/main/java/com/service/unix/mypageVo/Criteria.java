package com.service.unix.mypageVo;

public class Criteria {
	private int page;  		  // 보여줄 페이지 번호
	private int perPageNum;   // 페이지당 보여줄 게시글의 개수
	
	public Criteria() {
		// 최조 게시판에 진입할 때를 위한 기본값
		this.page=1;
		this.perPageNum=7;
	}
	
	public int getPage() {
		return this.page;
	}
	public void setPage(int page) {
		if(page<0) {
			this.page=0;
			return;
		}
		this.page=page;
	}
	
	public int getPerPageNum() {
		 return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0||perPageNum>100) {
			this.perPageNum=7;
			return;
		}
		this.perPageNum=perPageNum;
	}
	
	// sql의 limit 구문에서 시작 위치를 지정할 때 사용된다. 예를 들어 10개씩 출력하는 경우, 3페이지의 데이터는 limit 20, 10과 같은 형태가 되어야 한다.
	// this.page가 1이면 0이 되어야 한다. mysql limit 0, 10 해야 처음부터 10개씩 나온다. 
	public int getPageStart() {
		if((this.page-1) * perPageNum < 0) return 0;
		return (this.page-1) * perPageNum;
	}
}
