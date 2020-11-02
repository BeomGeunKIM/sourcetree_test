package com.kh.login.admin.model.vo;

public class Synthesis implements java.io.Serializable {

	private int memberQTY; //총 회원수
	private int spaceQTY; //총 공간수
	private int imagesQty; //등록된 이미지 수
 	private int hostQTY; // 총 호스트 수 
	private int todayAcceptSpace; // 오늘 등록된 공간 (검수 요청 된 것 포함)
	private int todayJoinMembers; // 오늘 가입한 회원수
	private int todaysBenefit; // 오늘의 수익
	
	public Synthesis() {

	}

	public Synthesis(int memberQTY, int spaceQTY, int imagesQty, int hostQTY, int todayAcceptSpace,
			int todayJoinMembers, int todaysBenefit) {
		super();
		this.memberQTY = memberQTY;
		this.spaceQTY = spaceQTY;
		this.imagesQty = imagesQty;
		this.hostQTY = hostQTY;
		this.todayAcceptSpace = todayAcceptSpace;
		this.todayJoinMembers = todayJoinMembers;
		this.todaysBenefit = todaysBenefit;
	}

	@Override
	public String toString() {
		return "Synthesis [memberQTY=" + memberQTY + ", spaceQTY=" + spaceQTY + ", imagesQty=" + imagesQty
				+ ", hostQTY=" + hostQTY + ", todayAcceptSpace=" + todayAcceptSpace + ", todayJoinMembers="
				+ todayJoinMembers + ", todaysBenefit=" + todaysBenefit + "]";
	}

	public int getMemberQTY() {
		return memberQTY;
	}

	public void setMemberQTY(int memberQTY) {
		this.memberQTY = memberQTY;
	}

	public int getSpaceQTY() {
		return spaceQTY;
	}

	public void setSpaceQTY(int spaceQTY) {
		this.spaceQTY = spaceQTY;
	}

	public int getImagesQty() {
		return imagesQty;
	}

	public void setImagesQty(int imagesQty) {
		this.imagesQty = imagesQty;
	}

	public int getHostQTY() {
		return hostQTY;
	}

	public void setHostQTY(int hostQTY) {
		this.hostQTY = hostQTY;
	}

	public int getTodayAcceptSpace() {
		return todayAcceptSpace;
	}

	public void setTodayAcceptSpace(int todayAcceptSpace) {
		this.todayAcceptSpace = todayAcceptSpace;
	}

	public int getTodayJoinMembers() {
		return todayJoinMembers;
	}

	public void setTodayJoinMembers(int todayJoinMembers) {
		this.todayJoinMembers = todayJoinMembers;
	}

	public int getTodaysBenefit() {
		return todaysBenefit;
	}

	public void setTodaysBenefit(int todaysBenefit) {
		this.todaysBenefit = todaysBenefit;
	}
	
	
}
