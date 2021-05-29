package com.davi.app.board.vo;

public class BoardFreeReplyVO {
	
	/*FREENUM NUMBER(10),  --게시글 번호
	FREEREPLYNUM NUMBER(10),  -- 댓글번호
	PARENTREPLYNUM NUMBER(10) DEFAULT 0 NOT NULL, --부모 댓글의 번호 부모가없으면0	
	MEMBERID VARCHAR2(300) NOT NULL,
	FREEREPLYCONTENT VARCHAR2(3000),
	FREEREPLYDATE DATE,*/
	
	private int freeNum;
	private int freeReplyNum;
	private int parentReplyNum;
	private String memberId;
	private String freeReplyContent;
	private String freeReplyDate;
	private String parentReplyId;

	public BoardFreeReplyVO() {;}

	
	public int getFreeNum() {
		return freeNum;
	}

	public void setFreeNum(int freeNum) {
		this.freeNum = freeNum;
	}

	public int getFreeReplyNum() {
		return freeReplyNum;
	}

	public void setFreeReplyNum(int freeReplyNum) {
		this.freeReplyNum = freeReplyNum;
	}

	public int getParentReplyNum() {
		return parentReplyNum;
	}

	public void setParentReplyNum(int parentReplyNum) {
		this.parentReplyNum = parentReplyNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getFreeReplyContent() {
		return freeReplyContent;
	}

	public void setFreeReplyContent(String freeReplyContent) {
		this.freeReplyContent = freeReplyContent;
	}

	public String getFreeReplyDate() {
		return freeReplyDate;
	}

	public void setFreeReplyDate(String freeReplyDate) {
		this.freeReplyDate = freeReplyDate;
	}


	public String getParentReplyId() {
		return parentReplyId;
	}


	public void setParentReplyId(String parentReplyId) {
		this.parentReplyId = parentReplyId;
	}
	
}
