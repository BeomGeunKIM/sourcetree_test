package com.kh.login.space.model.vo;

public class Review implements java.io.Serializable {

	private int reviewNo;
	private int spaceNo;
	private String spaceName;
	private int memberNo;
	private String memberNick;
	private String reviewContent;
	private int rPoint;
	private String enrollDate;
	private int reservNo;

	public Review() {
		
	}

	public Review(int reviewNo, int spaceNo, int memberNo, String reviewContent, int rPoint, String enrollDate,
			int reservNo) {

		super();
		this.reviewNo = reviewNo;
		this.spaceNo = spaceNo;
		this.spaceName = spaceName;
		this.memberNo = memberNo;
		this.memberNick = memberNick;
		this.reviewContent = reviewContent;
		this.rPoint = rPoint;
		this.enrollDate = enrollDate;
		this.reservNo = reservNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getrPoint() {
		return rPoint;
	}

	public void setrPoint(int rPoint) {
		this.rPoint = rPoint;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getReservNo() {
		return reservNo;
	}

	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", memberNo="
				+ memberNo + ", memberNick=" + memberNick + ", reviewContent=" + reviewContent + ", rPoint=" + rPoint
				+ ", enrollDate=" + enrollDate + ", reservNo=" + reservNo + "]";
	}
		
}
