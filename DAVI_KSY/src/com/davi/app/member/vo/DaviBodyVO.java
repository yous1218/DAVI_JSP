package com.davi.app.member.vo;

public class DaviBodyVO {
	/*
	 * CREATE TABLE DAVI_BODY(
    MEMBERNUM NUMBER(10),
    MEMBERID VARCHAR2(300),
    BODYDATE DATE,
    BODYWEIGHT NUMBER(10),
    BODYWEEK NUMBER(10),
    MEMBERRATE NUMBER(10),
    CONSTRAINT DAVI_NUM_PK PRIMARY KEY(MEMBERNUM),
    CONSTRAINT DAVI_MEMBERID_FK FOREIGN KEY(MEMBERID) REFERENCES DAVI_MEMBER(MEMBERID)
);
		)*/
	
	private int memberNum;
	private String memberId;
	private String bodyDate;
	private double bodyWeight;
	private int bodyWeek;
	private double memberRate;
	
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBodyDate() {
		return bodyDate;
	}
	public void setBodyDate(String bodyDate) {
		this.bodyDate = bodyDate;
	}
	public double getBodyWeight() {
		return bodyWeight;
	}
	public void setBodyWeight(double bodyWeight) {
		this.bodyWeight = bodyWeight;
	}
	public int getBodyWeek() {
		return bodyWeek;
	}
	public void setBodyWeek(int bodyWeek) {
		this.bodyWeek = bodyWeek;
	}
	public double getMemberRate() {
		return memberRate;
	}
	public void setMemberRate(double memberRate) {
		this.memberRate = memberRate;
	}
	
	
	
	
	
}
