package com.kh.login.host.manageReserve.model.vo;

import java.sql.Date;

public class HostReserve {
	private int reserveNo;					//예약번호
	private String guestNo;					//게스트번호
	private int spaceNo;					//공간번호
	private String officeNo;					//호실번호
	private int hostNo;						//호스트번호
	private String SpaceName;				//공간명
	private int spaceKind;					//공간종류
	private String spacdAddress;			//공간주소
	private String didDayReserve;			//일별 예약 여부
	private int dayPayNumber;				//일당 가격
	private String didMonthReserve;			//월별 예약 여부
	private int monthPay;					//월당 가격
	private int didHostOk;					//호스트 승인 여부
	private int day;						//요일
	private int startTime;					//시작시간
	private int endTime;					//종료시간
	private int MemberNo;					//게스트번호
	private int reservePersonCount;			//예약인원
	private int reserveStatus;				//예약상태
	private String startDay;				//사용시작날짜
	private String endDay;					//사용종료날짜
	private String reserveDate;				//예약날짜
	private String userName;				//예약자 이름
	private int reserveTerm;				//예약기간
	

	//회원 정보
	private int payStatus;
	private String phone;
	private String email;
	private String requestContent;			//요청사항
	private String realUserName;
	
	public HostReserve() {}

	public int getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}

	public HostReserve(int reserveNo, String guestNo, int spaceNo, String officeNo, int hostNo, String spaceName,
			int spaceKind, String spacdAddress, String didDayReserve, int dayPayNumber, String didMonthReserve,
			int monthPay, int didHostOk, int day, int startTime, int endTime, int memberNo, int reservePersonCount,
			int reserveStatus, String startDay, String endDay, String reserveDate, String userName, int reserveTerm,
			int payStatus, String phone, String email, String requestContent, String realUserName) {
		super();
		this.reserveNo = reserveNo;
		this.guestNo = guestNo;
		this.spaceNo = spaceNo;
		this.officeNo = officeNo;
		this.hostNo = hostNo;
		SpaceName = spaceName;
		this.spaceKind = spaceKind;
		this.spacdAddress = spacdAddress;
		this.didDayReserve = didDayReserve;
		this.dayPayNumber = dayPayNumber;
		this.didMonthReserve = didMonthReserve;
		this.monthPay = monthPay;
		this.didHostOk = didHostOk;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
		MemberNo = memberNo;
		this.reservePersonCount = reservePersonCount;
		this.reserveStatus = reserveStatus;
		this.startDay = startDay;
		this.endDay = endDay;
		this.reserveDate = reserveDate;
		this.userName = userName;
		this.reserveTerm = reserveTerm;
		this.payStatus = payStatus;
		this.phone = phone;
		this.email = email;
		this.requestContent = requestContent;
		this.realUserName = realUserName;
	}

	public HostReserve(int reserveNo, String guestNo, int spaceNo, String officeNo, int hostNo, String spaceName,
			int spaceKind, String spacdAddress, String didDayReserve, int dayPayNumber, String didMonthReserve,
			int monthPay, int didHostOk, int day, int startTime, int endTime, int memberNo, int reservePersonCount,
			int reserveStatus, String startDay, String endDay, String reserveDate, String userName, int reserveTerm,
			String phone, String email, String requestContent, String realUserName) {
		super();
		this.reserveNo = reserveNo;
		this.guestNo = guestNo;
		this.spaceNo = spaceNo;
		this.officeNo = officeNo;
		this.hostNo = hostNo;
		SpaceName = spaceName;
		this.spaceKind = spaceKind;
		this.spacdAddress = spacdAddress;
		this.didDayReserve = didDayReserve;
		this.dayPayNumber = dayPayNumber;
		this.didMonthReserve = didMonthReserve;
		this.monthPay = monthPay;
		this.didHostOk = didHostOk;
		this.day = day;
		this.startTime = startTime;
		this.endTime = endTime;
		MemberNo = memberNo;
		this.reservePersonCount = reservePersonCount;
		this.reserveStatus = reserveStatus;
		this.startDay = startDay;
		this.endDay = endDay;
		this.reserveDate = reserveDate;
		this.userName = userName;
		this.reserveTerm = reserveTerm;
		this.phone = phone;
		this.email = email;
		this.requestContent = requestContent;
		this.realUserName = realUserName;
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public String getGuestNo() {
		return guestNo;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public String getOfficeNo() {
		return officeNo;
	}

	public int getHostNo() {
		return hostNo;
	}

	public String getSpaceName() {
		return SpaceName;
	}

	public int getSpaceKind() {
		return spaceKind;
	}

	public String getSpacdAddress() {
		return spacdAddress;
	}

	public String getDidDayReserve() {
		return didDayReserve;
	}

	public int getDayPayNumber() {
		return dayPayNumber;
	}

	public String getDidMonthReserve() {
		return didMonthReserve;
	}

	public int getMonthPay() {
		return monthPay;
	}

	public int getDidHostOk() {
		return didHostOk;
	}

	public int getDay() {
		return day;
	}

	public int getStartTime() {
		return startTime;
	}

	public int getEndTime() {
		return endTime;
	}

	public int getMemberNo() {
		return MemberNo;
	}

	public int getReservePersonCount() {
		return reservePersonCount;
	}

	public int getReserveStatus() {
		return reserveStatus;
	}

	public String getStartDay() {
		return startDay;
	}

	public String getEndDay() {
		return endDay;
	}

	public String getReserveDate() {
		return reserveDate;
	}

	public String getUserName() {
		return userName;
	}

	public int getReserveTerm() {
		return reserveTerm;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getRequestContent() {
		return requestContent;
	}

	public String getRealUserName() {
		return realUserName;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public void setGuestNo(String guestNo) {
		this.guestNo = guestNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public void setOfficeNo(String officeNo) {
		this.officeNo = officeNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public void setSpaceName(String spaceName) {
		SpaceName = spaceName;
	}

	public void setSpaceKind(int spaceKind) {
		this.spaceKind = spaceKind;
	}

	public void setSpacdAddress(String spacdAddress) {
		this.spacdAddress = spacdAddress;
	}

	public void setDidDayReserve(String didDayReserve) {
		this.didDayReserve = didDayReserve;
	}

	public void setDayPayNumber(int dayPayNumber) {
		this.dayPayNumber = dayPayNumber;
	}

	public void setDidMonthReserve(String didMonthReserve) {
		this.didMonthReserve = didMonthReserve;
	}

	public void setMonthPay(int monthPay) {
		this.monthPay = monthPay;
	}

	public void setDidHostOk(int didHostOk) {
		this.didHostOk = didHostOk;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}

	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}

	public void setMemberNo(int memberNo) {
		MemberNo = memberNo;
	}

	public void setReservePersonCount(int reservePersonCount) {
		this.reservePersonCount = reservePersonCount;
	}

	public void setReserveStatus(int reserveStatus) {
		this.reserveStatus = reserveStatus;
	}

	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}

	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}

	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setReserveTerm(int reserveTerm) {
		this.reserveTerm = reserveTerm;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public void setRealUserName(String realUserName) {
		this.realUserName = realUserName;
	}

	@Override
	public String toString() {
		return "HostReserve [reserveNo=" + reserveNo + ", guestNo=" + guestNo + ", spaceNo=" + spaceNo + ", officeNo="
				+ officeNo + ", hostNo=" + hostNo + ", SpaceName=" + SpaceName + ", spaceKind=" + spaceKind
				+ ", spacdAddress=" + spacdAddress + ", didDayReserve=" + didDayReserve + ", dayPayNumber="
				+ dayPayNumber + ", didMonthReserve=" + didMonthReserve + ", monthPay=" + monthPay + ", didHostOk="
				+ didHostOk + ", day=" + day + ", startTime=" + startTime + ", endTime=" + endTime + ", MemberNo="
				+ MemberNo + ", reservePersonCount=" + reservePersonCount + ", reserveStatus=" + reserveStatus
				+ ", startDay=" + startDay + ", endDay=" + endDay + ", reserveDate=" + reserveDate + ", userName="
				+ userName + ", reserveTerm=" + reserveTerm + ", payStatus=" + payStatus + ", phone=" + phone
				+ ", email=" + email + ", requestContent=" + requestContent + ", realUserName=" + realUserName + "]";
	}

	
	
	

}
