package com.kh.login.host.balance.model.vo;

import java.sql.Date;

public class Balance implements java.io.Serializable {

	private int payNo; // 결제 번호
	private Date paidDate; //결제 일
	private int hostNo; //호스트 넘버
	private String payMethod; //결제 수단
	private int amount; // 결제 액
	private int refund; // 환불 액
	private int benefit; // benefit = amount+ (-1*refund);
	private Date refundDate;
	private String spaceName; 
	private String payer;
	private int payStyle; //결제 유형(월별인지 일별인지 둘다인지)
	private int PGfee; //카드 수수료
	private int useStatus; // 공간 사용 상태(사용중,사용완료, 사용전)
	
	
	public Balance() {
		// TODO Auto-generated constructor stub
	}


	public Balance(int payNo, Date paidDate, int hostNo, String payMethod, int amount, int refund, int benefit,
			Date refundDate, String spaceName, String payer, int payStyle, int pGfee, int useStatus) {
		super();
		this.payNo = payNo;
		this.paidDate = paidDate;
		this.hostNo = hostNo;
		this.payMethod = payMethod;
		this.amount = amount;
		this.refund = refund;
		this.benefit = benefit;
		this.refundDate = refundDate;
		this.spaceName = spaceName;
		this.payer = payer;
		this.payStyle = payStyle;
		PGfee = pGfee;
		this.useStatus = useStatus;
	}

	




	@Override
	public String toString() {
		return "Balance [payNo=" + payNo + ", paidDate=" + paidDate + ", hostNo=" + hostNo + ", payMethod=" + payMethod
				+ ", amount=" + amount + ", refund=" + refund + ", benefit=" + benefit + ", refundDate=" + refundDate
				+ ", spaceName=" + spaceName + ", payer=" + payer + ", payStyle=" + payStyle + ", PGfee=" + PGfee
				+ ", useStatus=" + useStatus + "]";
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public Date getPaidDate() {
		return paidDate;
	}


	public void setPaidDate(Date paidDate) {
		this.paidDate = paidDate;
	}


	public int getHostNo() {
		return hostNo;
	}


	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}


	public String getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	public int getAmount() {
		return amount;
	}


	public void setAmount(int amount) {
		this.amount = amount;
	}


	public int getRefund() {
		return refund;
	}


	public void setRefund(int refund) {
		this.refund = refund;
	}


	public int getBenefit() {
		return benefit;
	}


	public void setBenefit(int benefit) {
		this.benefit = benefit;
	}


	public Date getRefundDate() {
		return refundDate;
	}


	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}


	public String getSpaceName() {
		return spaceName;
	}


	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}


	public String getPayer() {
		return payer;
	}


	public void setPayer(String payer) {
		this.payer = payer;
	}


	public int getPayStyle() {
		return payStyle;
	}


	public void setPayStyle(int payStyle) {
		this.payStyle = payStyle;
	}


	public int getPGfee() {
		return PGfee;
	}


	public void setPGfee(int pGfee) {
		PGfee = pGfee;
	}


	public int getUseStatus() {
		return useStatus;
	}


	public void setUseStatus(int useStatus) {
		this.useStatus = useStatus;
	}
	
	
	

}
