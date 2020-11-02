package com.kh.login.guest.model.vo;

import java.sql.Date;

public class ReserveHistory implements java.io.Serializable {

	//예약 내역을 저장하는 객체
	private int reserveNo; //예약 번호
	private int guestNo; //예약자 회원 번호
	private String userId; //예약자 회원 아이디
	private String guestName; //결제자 이름
	private String guestEmail; //결제자 이메일
	private int spaceNo; //예약된 공간 번호
	private String seatType; //자유석 지정석 여부 (fix_unfix)
	private String seatNo; //호실 번호
	private String spaceName; //공간명
	private int spaceType; //공간 종류
	private Date startUse; //공간 사용 시작일
	private Date endUse; //공간 사용 종료일
	private Date reserveDate; // 예약 신청한 일자
	private int personCount; //사용 인원수
	private int charge; // 요금
	private String payMethod; //결제수단 
	private int payStatus; // 결제 상태
	private int acceptStatus; // 승인 처리 여부
	private int reserveStatus; // 예약 상태
	private String hasReview; // 후기 존재 여부
	private String userName; //예약자와 사용자가 다를 수 있기때문
	private String userPhone;//예약자와 사용자가 다를 수 있기 때문
	private String userEmail; // 예약자와 사용자가 다를 수 있기 때문
	
	
	public ReserveHistory() {

	}


	

	public ReserveHistory(int reserveNo, int guestNo, String userId, String guestName, String guestEmail, int spaceNo,
			String seatType, String seatNo, String spaceName, int spaceType, Date startUse, Date endUse, Date reserveDate,
			int personCount, int charge, String payMethod, int payStatus, int acceptStatus, int reserveStatus,
			String hasReview, String userName, String userPhone, String userEmail) {
		super();
		this.reserveNo = reserveNo;
		this.guestNo = guestNo;
		this.userId = userId;
		this.guestName = guestName;
		this.guestEmail = guestEmail;
		this.spaceNo = spaceNo;
		this.seatType = seatType;
		this.seatNo = seatNo;
		this.spaceName = spaceName;
		this.spaceType = spaceType;
		this.startUse = startUse;
		this.endUse = endUse;
		this.reserveDate = reserveDate;
		this.personCount = personCount;
		this.charge = charge;
		this.payMethod = payMethod;
		this.payStatus = payStatus;
		this.acceptStatus = acceptStatus;
		this.reserveStatus = reserveStatus;
		this.hasReview = hasReview;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
	}


	@Override
	public String toString() {
		return "ReserveHistory [reserveNo=" + reserveNo + ", guestNo=" + guestNo + ", userId=" + userId + ", guestName="
				+ guestName + ", guestEmail=" + guestEmail + ", spaceNo=" + spaceNo + ", seatType=" + seatType
				+ ", seatNo=" + seatNo + ", spaceName=" + spaceName + ", spaceType=" + spaceType + ", startUse="
				+ startUse + ", endUse=" + endUse + ", reserveDate=" + reserveDate + ", personCount=" + personCount
				+ ", charge=" + charge + ", payMethod=" + payMethod + ", payStatus=" + payStatus + ", acceptStatus="
				+ acceptStatus + ", reserveStatus=" + reserveStatus + ", hasReview=" + hasReview + ", userName="
				+ userName + ", userPhone=" + userPhone + ", userEmail=" + userEmail + "]";
	}




	public int getReserveNo() {
		return reserveNo;
	}


	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}


	public int getGuestNo() {
		return guestNo;
	}


	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getSpaceNo() {
		return spaceNo;
	}


	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}


	public String getSeatType() {
		return seatType;
	}


	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}


	public String getSeatNo() {
		return seatNo;
	}


	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}


	public String getSpaceName() {
		return spaceName;
	}


	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}


	public int getSpaceType() {
		return spaceType;
	}


	public void setSpaceType(int spaceType) {
		this.spaceType = spaceType;
	}


	public Date getStartUse() {
		return startUse;
	}


	public void setStartUse(Date startUse) {
		this.startUse = startUse;
	}


	public Date getEndUse() {
		return endUse;
	}


	public void setEndUse(Date endUse) {
		this.endUse = endUse;
	}


	public Date getReserveDate() {
		return reserveDate;
	}


	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}


	public int getPersonCount() {
		return personCount;
	}


	public void setPersonCount(int personCount) {
		this.personCount = personCount;
	}


	public int getCharge() {
		return charge;
	}


	public void setCharge(int charge) {
		this.charge = charge;
	}


	public String getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	public int getPayStatus() {
		return payStatus;
	}


	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}


	public int getAcceptStatus() {
		return acceptStatus;
	}


	public void setAcceptStatus(int acceptStatus) {
		this.acceptStatus = acceptStatus;
	}


	public int getReserveStatus() {
		return reserveStatus;
	}


	public void setReserveStatus(int reserveStatus) {
		this.reserveStatus = reserveStatus;
	}


	public String getHasReview() {
		return hasReview;
	}


	public void setHasReview(String hasReview) {
		this.hasReview = hasReview;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}




	public String getGuestName() {
		return guestName;
	}




	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}




	public String getGuestEmail() {
		return guestEmail;
	}




	public void setGuestEmail(String guestEmail) {
		this.guestEmail = guestEmail;
	}

	
	
	
}
