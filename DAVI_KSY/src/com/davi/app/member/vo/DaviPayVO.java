package com.davi.app.member.vo;

public class DaviPayVO {
	/*PAYNUM NUMBER(10),
	MEMBERID VARCHAR2(300),
	MEMBERNAME VARCHAR2(300),
    MEMBERPHONE VARCHAR2(300),
    MEMBEREMAIL VARCHAR2(300),
    MEMBERZIPCODE VARCHAR2(300),
    MEMBERADDRESS VARCHAR2(300),
    MEMBERADDRESSDETAIL VARCHAR2(300),
    PAYDATE DATE,
    PRODUCT VARCHAR2(300),
    PRICE NUMBER(10),*/
    
	private int payNum;
	private String memberId;
	private String memberName;
	private String memberPhone;
	private String memberEmail;
	private String memberZipcode;
	private String memberAddress;
	private String memberAddressDetail;
	private String payDate;
	private String product;
	private int price;
	
	public DaviPayVO() {;}
	
	
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberZipcode() {
		return memberZipcode;
	}
	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberAddressDetail() {
		return memberAddressDetail;
	}
	public void setMemberAddressDetail(String memberAddressDetail) {
		this.memberAddressDetail = memberAddressDetail;
	}
	
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}


	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	
	

}
