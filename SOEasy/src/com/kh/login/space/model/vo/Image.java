package com.kh.login.space.model.vo;

public class Image implements java.io.Serializable{


	private int imgNo;
	private String originName;
	private String changeName;
	private String filePath;
	private int imgDiv;
	private int spaceNo;
	private int memberNo;
	private int fileLevel;
	
	public Image() {}

	public Image(int imgNo, String originName, String changeName, String filePath, int imgDiv, int spaceNo,
			int memberNo, int fileLevel) {
		super();
		this.imgNo = imgNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.imgDiv = imgDiv;
		this.spaceNo = spaceNo;
		this.memberNo = memberNo;
		this.fileLevel = fileLevel;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	@Override
	public String toString() {
		return "Image [imgNo=" + imgNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + ", imgDiv=" + imgDiv + ", spaceNo=" + spaceNo + ", memberNo=" + memberNo + ", fileLevel="
				+ fileLevel + "]";
	}

}
