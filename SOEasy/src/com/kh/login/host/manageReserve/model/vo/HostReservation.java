package com.kh.login.host.manageReserve.model.vo;

public class HostReservation implements java.io.Serializable {

	private int reservNo;			//예약번호
	private int hostNo;			//게스트번호
	private int spaceNo;			//공간번호
	private String fixUnfix;		//자유지정석여부
	private String officeNo;			//호실번호
	private String startDate;		//사용시작날짜
	private String endDate;			//사용종료날짜
	private int reservPersonCount;	//예약인원
	private int didHostOk;			//호스트 승인 여부 	
	private int reservStatus;		//예약상태	      	
	private String didReview;		//리뷰작성여부	
	private String reservDate;		//예약날짜
	private int expectPay;			//에상결제금액
	private String userName;		//사용자 이름
	private String userPhone;		//사용자 연락처
	private String userEmail;		//사용자 이메일
	private String requestContent;	//요청사항

	public HostReservation() {

	}

	public HostReservation(int reservNo, int guestNo, int spaceNo, String fixUnfix, String officeNo, String startDate,
			String endDate, int reservPersonCount, int didHostOk, int reservStatus, String didReview, String reservDate,
			int expectPay, String userName, String userPhone, String userEmail, String requestContent) {
		super();
		this.reservNo = reservNo;
		this.hostNo = guestNo;
		this.spaceNo = spaceNo;
		this.fixUnfix = fixUnfix;
		this.officeNo = officeNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reservPersonCount = reservPersonCount;
		this.didHostOk = didHostOk;
		this.reservStatus = reservStatus;
		this.didReview = didReview;
		this.reservDate = reservDate;
		this.expectPay = expectPay;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.requestContent = requestContent;
	}

	public int getReservNo() {
		return reservNo;
	}

	public int getHostNo() {
		return hostNo;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public String getFixUnfix() {
		return fixUnfix;
	}

	public String getOfficeNo() {
		return officeNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public int getReservPersonCount() {
		return reservPersonCount;
	}

	public int getDidHostOk() {
		return didHostOk;
	}

	public int getReservStatus() {
		return reservStatus;
	}

	public String getDidReview() {
		return didReview;
	}

	public String getReservDate() {
		return reservDate;
	}

	public int getExpectPay() {
		return expectPay;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public void setFixUnfix(String fixUnfix) {
		this.fixUnfix = fixUnfix;
	}

	public void setOfficeNo(String officeNo) {
		this.officeNo = officeNo;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public void setReservPersonCount(int reservPersonCount) {
		this.reservPersonCount = reservPersonCount;
	}

	public void setDidHostOk(int didHostOk) {
		this.didHostOk = didHostOk;
	}

	public void setReservStatus(int reservStatus) {
		this.reservStatus = reservStatus;
	}

	public void setDidReview(String didReview) {
		this.didReview = didReview;
	}

	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}

	public void setExpectPay(int expectPay) {
		this.expectPay = expectPay;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	@Override
	public String toString() {
		return "HostReservation [reservNo=" + reservNo + ", guestNo=" + hostNo + ", spaceNo=" + spaceNo + ", fixUnfix="
				+ fixUnfix + ", officeNo=" + officeNo + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", reservPersonCount=" + reservPersonCount + ", didHostOk=" + didHostOk + ", reservStatus="
				+ reservStatus + ", didReview=" + didReview + ", reservDate=" + reservDate + ", expectPay=" + expectPay
				+ ", userName=" + userName + ", userPhone=" + userPhone + ", userEmail=" + userEmail
				+ ", requestContent=" + requestContent + "]";
	}
	

}




















