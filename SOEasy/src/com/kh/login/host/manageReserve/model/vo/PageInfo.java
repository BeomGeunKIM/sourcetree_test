package com.kh.login.host.manageReserve.model.vo;

public class PageInfo {
	private int currentPage;
	private int listCount;
	private int limit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int requestCount;
	
	public PageInfo() {}

	
	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage,  int endPage) {
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage,
			int requestCount) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.requestCount = requestCount;
	}



	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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

	
	
	public int getRequestCount() {
		return requestCount;
	}



	public void setRequestCount(int requestCount) {
		this.requestCount = requestCount;
	}



	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
				+ maxPage + ", startPage=" + startPage + ", endPage=" + endPage + ", requestCount=" + requestCount
				+ "]";
	}


	public static String customQString(String url, int length) {
		url = "?"+url+"&";
		int count = 0;
		for(int i=0; i<url.length();i++) {
			if(url.charAt(i)=='&') {
				count++;
				if(count==length) {
					url=url.substring(0, i+1);
					break;
				}
			}
		}
		
		return url;
	}
	
	

}
