package com.davi.app.board.vo;

public class BoardFreeVO {
	
	private int freeNum;
	private String freeHead;
	private String memberId;
	private String freeTitle;
	private String freeContent;
	private String freeDate;
	private int freeNotice;
	
	public BoardFreeVO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getFreeDate() {
		return freeDate;
	}
	public void setFreeDate(String freeDate) {
		this.freeDate = freeDate;
	}
	public int getFreeNotice() {
		return freeNotice;
	}
	public void setFreeNotice(int freeNotice) {
		this.freeNotice = freeNotice;
	}
	public int getFreeNum() {
		return freeNum;
	}
	public void setFreeNum(int freeNum) {
		this.freeNum = freeNum;
	}
	public String getFreeHead() {
		return freeHead;
	}
	public void setFreeHead(String freeHead) {
		this.freeHead = freeHead;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getFreeTitle() {
		return freeTitle;
	}
	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}
	public String getFreeContent() {
		return freeContent;
	}
	public void setFreeContent(String freeContent) {
		this.freeContent = freeContent;
	}

}
