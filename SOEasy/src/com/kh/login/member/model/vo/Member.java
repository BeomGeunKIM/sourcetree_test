package com.kh.login.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{

	private int memberNo;
	private int pType;
	private String mName;
	private String mId;
	private String mNick;
	private String mPassword;
	private String mPhone;
	private String mEmail;
	private Date enrollDate;
	private String mStatus;
	private Date dropDate;
	private String mDropReason;
	private int imgNo;
	private String originName;
	private String filePath; 
	private String changeName;
	private int imgDiv;
	private int spaceNo;
	
	
	public Member() {

	
	}

	public Member(int memberNo, int pType, String mName, String mId, String mNick, String mPassword, String mPhone,
			String mEmail, Date enrollDate, String mStatus, Date dropDate, String mDropReason, int imgNo,
			String originName, String filePath, String changeName, int imgDiv, int spaceNo) {
		super();
		this.memberNo = memberNo;
		this.pType = pType;
		this.mName = mName;
		this.mId = mId;
		this.mNick = mNick;
		this.mPassword = mPassword;
		this.mPhone = mPhone;
		this.mEmail = mEmail;
		this.enrollDate = enrollDate;
		this.mStatus = mStatus;
		this.dropDate = dropDate;
		this.mDropReason = mDropReason;
		this.imgNo = imgNo;
		this.originName = originName;
		this.filePath = filePath;
		this.changeName = changeName;
		this.imgDiv = imgDiv;
		this.spaceNo = spaceNo;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", pType=" + pType + ", mName=" + mName + ", mId=" + mId + ", mNick="
				+ mNick + ", mPassword=" + mPassword + ", mPhone=" + mPhone + ", mEmail=" + mEmail + ", enrollDate="
				+ enrollDate + ", mStatus=" + mStatus + ", dropDate=" + dropDate + ", mDropReason=" + mDropReason
				+ ", imgNo=" + imgNo + ", originName=" + originName + ", filePath=" + filePath + ", changeName="
				+ changeName + ", imgDiv=" + imgDiv + ", spaceNo=" + spaceNo + "]";
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	public int getpType() {
		return pType;
	}

	public void setpType(int pType) {
		this.pType = pType;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmNick() {
		return mNick;
	}

	public void setmNick(String mNick) {
		this.mNick = mNick;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public int getImgDiv() {
		return imgDiv;
	}

	public void setImgDiv(int imgDiv) {
		this.imgDiv = imgDiv;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getDropDate() {
		return dropDate;
	}

	public void setDropDate(Date dropDate) {
		this.dropDate = dropDate;
	}

	public String getmDropReason() {
		return mDropReason;
	}

	public void setmDropReason(String mDropReason) {
		this.mDropReason = mDropReason;
	}
	
	
	
}


