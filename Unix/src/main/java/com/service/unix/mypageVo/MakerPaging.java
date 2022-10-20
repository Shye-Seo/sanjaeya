package com.service.unix.mypageVo;

public class MakerPaging {
	private int totalCount;     // 게시판 전체 데이터 개수
	private int displayPageNum = 4;   // 게시판 화면에서 한번에 보여질 페이지 번호의 개수 (1,2,3,4)
	
	private int startPage;      // 현재 화면에서 보이는 startPage 번호
	private int endPage;        // 현재 화면에 보이는 endPage 번호
	
	private Criteria cri;       // 앞서 생성한 Criteria를 주입받는다.
	private int tempEndPage;
	
	public int getTotalCount() {
		return totalCount;
	}
 
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	// 보여줄 페이지 번호(page)와 페이지당 보여줄 게시물 개수(perPageNum)를 토대로 각 변수들 값 설정 
	private void calcData() {
		this.endPage = (int) (Math.ceil(cri.getPage() / (double) this.displayPageNum) * this.displayPageNum);
		this.startPage = (this.endPage - this.displayPageNum) + 1;
		this.tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if(this.endPage >= this.tempEndPage) {
			this.endPage = this.tempEndPage;
		}
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public int getTempEndPage() {
		return tempEndPage;
	}
	
}
