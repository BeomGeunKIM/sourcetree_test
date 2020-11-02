package com.kh.login.space.model.vo;

public class SearchFilter implements java.io.Serializable{
	private String search;					//검색어
//	공간유형
	private String spaceKind;				//공간종류
	private String didHostOk;				//호스트 승인 여부 	
//	지역유형
	private String spaceLocationFilter;		//지역
//	이용유형
	private String term;					//이용기간
//	가격
	private int lowPrice;					//최소가격
	private int highPrice;					//최대가격
//	정렬
	private String sort;					//정렬
	
	public SearchFilter() {}

	public SearchFilter(String search, String spaceKind, String didHostOk, String spaceLocationFilter, String term,
			int lowPrice, int highPrice, String sort) {
		super();
		this.search = search;
		this.spaceKind = spaceKind;
		this.didHostOk = didHostOk;
		this.spaceLocationFilter = spaceLocationFilter;
		this.term = term;
		this.lowPrice = lowPrice;
		this.highPrice = highPrice;
		this.sort = sort;
	}

	public String getSearch() {
		return search;
	}

	public String getSpaceKind() {
		return spaceKind;
	}

	public String getDidHostOk() {
		return didHostOk;
	}

	public String getSpaceLocationFilter() {
		return spaceLocationFilter;
	}

	public String getTerm() {
		return term;
	}

	public int getLowPrice() {
		return lowPrice;
	}

	public int getHighPrice() {
		return highPrice;
	}

	public String getSort() {
		return sort;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public void setSpaceKind(String spaceKind) {
		this.spaceKind = spaceKind;
	}

	public void setDidHostOk(String didHostOk) {
		this.didHostOk = didHostOk;
	}

	public void setSpaceLocationFilter(String spaceLocationFilter) {
		this.spaceLocationFilter = spaceLocationFilter;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public void setLowPrice(int lowPrice) {
		this.lowPrice = lowPrice;
	}

	public void setHighPrice(int highPrice) {
		this.highPrice = highPrice;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "SearchFilter [search=" + search + ", spaceKind=" + spaceKind + ", didHostOk=" + didHostOk
				+ ", spaceLocationFilter=" + spaceLocationFilter + ", term=" + term + ", lowPrice=" + lowPrice
				+ ", highPrice=" + highPrice + ", sort=" + sort + "]";
	}

	

	
}
