package com.kh.login.board.model.vo;

import java.util.Date;

public class Board implements java.io.Serializable{
	private int noticeNo;
	private int adminNo;
	private int nCategory;
	private Date nDate;
	private String nContent;
	private String nStatus;
	private String mNick;
	private String nTitle;
	public Board() {}
	public Board(int noticeNo, int adminNo, int nCategory, Date nDate, String nContent, String nStatus, String mNick,
			String nTitle) {
		super();
		this.noticeNo = noticeNo;
		this.adminNo = adminNo;
		this.nCategory = nCategory;
		this.nDate = nDate;
		this.nContent = nContent;
		this.nStatus = nStatus;
		this.mNick = mNick;
		this.nTitle = nTitle;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public int getnCategory() {
		return nCategory;
	}
	public void setnCategory(int nCategory) {
		this.nCategory = nCategory;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnStatus() {
		return nStatus;
	}
	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}
	public String getmNick() {
		return mNick;
	}
	public void setmNick(String mNick) {
		this.mNick = mNick;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	@Override
	public String toString() {
		return "Board [noticeNo=" + noticeNo + ", adminNo=" + adminNo + ", nCategory=" + nCategory + ", nDate=" + nDate
				+ ", nContent=" + nContent + ", nStatus=" + nStatus + ", mNick=" + mNick + ", nTitle=" + nTitle + "]";
	}
	
	
	
	
}
