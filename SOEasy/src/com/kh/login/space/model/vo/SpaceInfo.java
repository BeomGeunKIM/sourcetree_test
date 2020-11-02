package com.kh.login.space.model.vo;

import java.sql.Date;
import java.util.Arrays;

public class SpaceInfo implements java.io.Serializable {
	
	//공간등록 1 시작 ---
	private int spaceNo;					//공간번호
	private int hostNo;						//호스트번호
	private String spaceName;				//공간명
	private int spaceKind;					//공간종류 독립오피스/코워킹스페이스
	private String spaceAddress;			//공간주소
	private String spaceShortIntro;			//공간 한줄 소개
	private String spaceIntro;				//공간소개글
	private String spaceLocationFilter;		//공간 위치 필터
	private String[] conv;					//편의시설 배열
	//독립오피스의 경우
	private double spaceSize;				//공간사이즈
	private int spaceRoomCount;				//공간재고
	private String[] officeNo;				//호실번호
	private int spaceContainCount;			//수용인원
	//코워킹스페이스의 경우
	private int unfixSeat;					//자유석 갯수
	private int fixSeat;					//지정석 갯수
	private int totalSeat;					//총 좌석 수
	private int maxReserv;					//예약 가능 인원
	//공간등록 1 종료--- 	
	//공간등록 2---		
	private String didDayReserv;			//일별 예약 가능 여부
	private String didMonthReserv;			//월별 예약 가능 여부
	private int dayPay;						//일당 금액
	private int monthPay;					//월당 금액
	private String[] openChecks;			//공간 휴무 여부
	private int[] startTimes;				//공간 운영 시작 시간
	private int[] endTimes;					//공간 운영 종료 시간
	private double[] spaceRefundPolicy;		//일자별 환불율 [0]->당일, ..., [8]->이용7일전
	//공간등록 2 종료----
	//공간등록 3---
	private String bsnsName;				//상호명
	private String representName;			//대표자명
	private String bsnsLicenseNo;			//사업자등록번호
	private int bsnsType;					//사업자유형
	private String bsnsCondition;			//주업태
	private String bsnsEvent;				//주종목
	private String bsnsAddress;				//사업장 주소
	private String calEmail;				//정산용 이메일
	private String calPhone;				//정산용 전화번호
	private String calBank;					//정산 은행명
	private String calAcctHolder;			//정산 예금주
	private String calAcctNo;				//정산 계좌번호
	//공간등록 3--
	//공개여부 !important
	private String sStatus;					//공간 소개글 공개여부

	public SpaceInfo() {}

	public SpaceInfo(int spaceNo, int hostNo, String spaceName, int spaceKind, String spaceAddress,
			String spaceShortIntro, String spaceIntro, String spaceLocationFilter, String[] conv, double spaceSize,
			int spaceRoomCount, String[] officeNo, int spaceContainCount, int unfixSeat, int fixSeat, int totalSeat,
			int maxReserv, String didDayReserv, String didMonthReserv, int dayPay, int monthPay, String[] openChecks,
			int[] startTimes, int[] endTimes, double[] spaceRefundPolicy, String bsnsName, String representName,
			String bsnsLicenseNo, int bsnsType, String bsnsCondition, String bsnsEvent, String bsnsAddress,
			String calEmail, String calPhone, String calBank, String calAcctHolder, String calAcctNo, String sStatus) {
		super();
		this.spaceNo = spaceNo;
		this.hostNo = hostNo;
		this.spaceName = spaceName;
		this.spaceKind = spaceKind;
		this.spaceAddress = spaceAddress;
		this.spaceShortIntro = spaceShortIntro;
		this.spaceIntro = spaceIntro;
		this.spaceLocationFilter = spaceLocationFilter;
		this.conv = conv;
		this.spaceSize = spaceSize;
		this.spaceRoomCount = spaceRoomCount;
		this.officeNo = officeNo;
		this.spaceContainCount = spaceContainCount;
		this.unfixSeat = unfixSeat;
		this.fixSeat = fixSeat;
		this.totalSeat = totalSeat;
		this.maxReserv = maxReserv;
		this.didDayReserv = didDayReserv;
		this.didMonthReserv = didMonthReserv;
		this.dayPay = dayPay;
		this.monthPay = monthPay;
		this.openChecks = openChecks;
		this.startTimes = startTimes;
		this.endTimes = endTimes;
		this.spaceRefundPolicy = spaceRefundPolicy;
		this.bsnsName = bsnsName;
		this.representName = representName;
		this.bsnsLicenseNo = bsnsLicenseNo;
		this.bsnsType = bsnsType;
		this.bsnsCondition = bsnsCondition;
		this.bsnsEvent = bsnsEvent;
		this.bsnsAddress = bsnsAddress;
		this.calEmail = calEmail;
		this.calPhone = calPhone;
		this.calBank = calBank;
		this.calAcctHolder = calAcctHolder;
		this.calAcctNo = calAcctNo;
		this.sStatus = sStatus;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public int getSpaceKind() {
		return spaceKind;
	}

	public void setSpaceKind(int spaceKind) {
		this.spaceKind = spaceKind;
	}

	public String getSpaceAddress() {
		return spaceAddress;
	}

	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}

	public String getSpaceShortIntro() {
		return spaceShortIntro;
	}

	public void setSpaceShortIntro(String spaceShortIntro) {
		this.spaceShortIntro = spaceShortIntro;
	}

	public String getSpaceIntro() {
		return spaceIntro;
	}

	public void setSpaceIntro(String spaceIntro) {
		this.spaceIntro = spaceIntro;
	}

	public String getSpaceLocationFilter() {
		return spaceLocationFilter;
	}

	public void setSpaceLocationFilter(String spaceLocationFilter) {
		this.spaceLocationFilter = spaceLocationFilter;
	}

	public String[] getConv() {
		return conv;
	}

	public void setConv(String[] conv) {
		this.conv = conv;
	}

	public double getSpaceSize() {
		return spaceSize;
	}

	public void setSpaceSize(double spaceSize) {
		this.spaceSize = spaceSize;
	}

	public int getSpaceRoomCount() {
		return spaceRoomCount;
	}

	public void setSpaceRoomCount(int spaceRoomCount) {
		this.spaceRoomCount = spaceRoomCount;
	}

	public String[] getOfficeNo() {
		return officeNo;
	}

	public void setOfficeNo(String[] officeNo) {
		this.officeNo = officeNo;
	}

	public int getSpaceContainCount() {
		return spaceContainCount;
	}

	public void setSpaceContainCount(int spaceContainCount) {
		this.spaceContainCount = spaceContainCount;
	}

	public int getUnfixSeat() {
		return unfixSeat;
	}

	public void setUnfixSeat(int unfixSeat) {
		this.unfixSeat = unfixSeat;
	}

	public int getFixSeat() {
		return fixSeat;
	}

	public void setFixSeat(int fixSeat) {
		this.fixSeat = fixSeat;
	}

	public int getTotalSeat() {
		return totalSeat;
	}

	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}

	public int getMaxReserv() {
		return maxReserv;
	}

	public void setMaxReserv(int maxReserv) {
		this.maxReserv = maxReserv;
	}

	public String getDidDayReserv() {
		return didDayReserv;
	}

	public void setDidDayReserv(String didDayReserv) {
		this.didDayReserv = didDayReserv;
	}

	public String getDidMonthReserv() {
		return didMonthReserv;
	}

	public void setDidMonthReserv(String didMonthReserv) {
		this.didMonthReserv = didMonthReserv;
	}

	public int getDayPay() {
		return dayPay;
	}

	public void setDayPay(int dayPay) {
		this.dayPay = dayPay;
	}

	public int getMonthPay() {
		return monthPay;
	}

	public void setMonthPay(int monthPay) {
		this.monthPay = monthPay;
	}

	public String[] getOpenChecks() {
		return openChecks;
	}

	public void setOpenChecks(String[] openChecks) {
		this.openChecks = openChecks;
	}

	public int[] getStartTimes() {
		return startTimes;
	}

	public void setStartTimes(int[] startTimes) {
		this.startTimes = startTimes;
	}

	public int[] getEndTimes() {
		return endTimes;
	}

	public void setEndTimes(int[] endTimes) {
		this.endTimes = endTimes;
	}

	public double[] getSpaceRefundPolicy() {
		return spaceRefundPolicy;
	}

	public void setSpaceRefundPolicy(double[] spaceRefundPolicy) {
		this.spaceRefundPolicy = spaceRefundPolicy;
	}

	public String getBsnsName() {
		return bsnsName;
	}

	public void setBsnsName(String bsnsName) {
		this.bsnsName = bsnsName;
	}

	public String getRepresentName() {
		return representName;
	}

	public void setRepresentName(String representName) {
		this.representName = representName;
	}

	public String getBsnsLicenseNo() {
		return bsnsLicenseNo;
	}

	public void setBsnsLicenseNo(String bsnsLicenseNo) {
		this.bsnsLicenseNo = bsnsLicenseNo;
	}

	public int getBsnsType() {
		return bsnsType;
	}

	public void setBsnsType(int bsnsType) {
		this.bsnsType = bsnsType;
	}

	public String getBsnsCondition() {
		return bsnsCondition;
	}

	public void setBsnsCondition(String bsnsCondition) {
		this.bsnsCondition = bsnsCondition;
	}

	public String getBsnsEvent() {
		return bsnsEvent;
	}

	public void setBsnsEvent(String bsnsEvent) {
		this.bsnsEvent = bsnsEvent;
	}

	public String getBsnsAddress() {
		return bsnsAddress;
	}

	public void setBsnsAddress(String bsnsAddress) {
		this.bsnsAddress = bsnsAddress;
	}

	public String getCalEmail() {
		return calEmail;
	}

	public void setCalEmail(String calEmail) {
		this.calEmail = calEmail;
	}

	public String getCalPhone() {
		return calPhone;
	}

	public void setCalPhone(String calPhone) {
		this.calPhone = calPhone;
	}

	public String getCalBank() {
		return calBank;
	}

	public void setCalBank(String calBank) {
		this.calBank = calBank;
	}

	public String getCalAcctHolder() {
		return calAcctHolder;
	}

	public void setCalAcctHolder(String calAcctHolder) {
		this.calAcctHolder = calAcctHolder;
	}

	public String getCalAcctNo() {
		return calAcctNo;
	}

	public void setCalAcctNo(String calAcctNo) {
		this.calAcctNo = calAcctNo;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	@Override
	public String toString() {
		return "SpaceInfo [spaceNo=" + spaceNo + ", hostNo=" + hostNo + ", spaceName=" + spaceName + ", spaceKind="
				+ spaceKind + ", spaceAddress=" + spaceAddress + ", spaceShortIntro=" + spaceShortIntro
				+ ", spaceIntro=" + spaceIntro + ", spaceLocationFilter=" + spaceLocationFilter + ", conv="
				+ Arrays.toString(conv) + ", spaceSize=" + spaceSize + ", spaceRoomCount=" + spaceRoomCount
				+ ", officeNo=" + Arrays.toString(officeNo) + ", spaceContainCount=" + spaceContainCount
				+ ", unfixSeat=" + unfixSeat + ", fixSeat=" + fixSeat + ", totalSeat=" + totalSeat + ", maxReserv="
				+ maxReserv + ", didDayReserv=" + didDayReserv + ", didMonthReserv=" + didMonthReserv + ", dayPay="
				+ dayPay + ", monthPay=" + monthPay + ", openChecks=" + Arrays.toString(openChecks) + ", startTimes="
				+ Arrays.toString(startTimes) + ", endTimes=" + Arrays.toString(endTimes) + ", spaceRefundPolicy="
				+ Arrays.toString(spaceRefundPolicy) + ", bsnsName=" + bsnsName + ", representName=" + representName
				+ ", bsnsLicenseNo=" + bsnsLicenseNo + ", bsnsType=" + bsnsType + ", bsnsCondition=" + bsnsCondition
				+ ", bsnsEvent=" + bsnsEvent + ", bsnsAddress=" + bsnsAddress + ", calEmail=" + calEmail + ", calPhone="
				+ calPhone + ", calBank=" + calBank + ", calAcctHolder=" + calAcctHolder + ", calAcctNo=" + calAcctNo
				+ ", sStatus=" + sStatus + "]";
	}

}
