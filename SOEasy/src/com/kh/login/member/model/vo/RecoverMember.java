package com.kh.login.member.model.vo;

import java.sql.Date;

public class RecoverMember implements java.io.Serializable {
	private int memberNo;
	private int rNum; // 복구 처리 번호
	private String userId; //아이디
	private String dropReason; //회원 탈퇴 사유
	private String email; //복구 요청 안내 이메일
	private Date requestDate; //복구 요청 날짜
	private int rStatus; // 복구 처리 여부

	public RecoverMember() {
		// TODO Auto-generated constructor stub
	}

	public RecoverMember(int memberNo, int rNum, String userId, String dropReason, String email, Date requestDate,
			int rStatus) {
		super();
		this.memberNo = memberNo;
		this.rNum = rNum;
		this.userId = userId;
		this.dropReason = dropReason;
		this.email = email;
		this.requestDate = requestDate;
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "RecoverMember [memberNo=" + memberNo + ", rNum=" + rNum + ", userId=" + userId + ", dropReason="
				+ dropReason + ", email=" + email + ", requestDate=" + requestDate + ", rStatus=" + rStatus + "]";
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDropReason() {
		return dropReason;
	}

	public void setDropReason(String dropReason) {
		this.dropReason = dropReason;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public int getrStatus() {
		return rStatus;
	}

	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
	}
	

	
	
	

}
