package com.spring.turtle.dto;

import java.sql.Date;

public class ReservationDTO {

	// 멤버변수
	private int reNo;			// 예약번호
	private String reUserId;	// 예약회원아이디
	private Date reDate;		// 예약날짜, 시간
	
	// 디폴트생성자
	public ReservationDTO() {
		super();
	}

	// getter, setter
	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public String getReUserId() {
		return reUserId;
	}

	public void setReUserId(String reUserId) {
		this.reUserId = reUserId;
	}

	public Date getReDate() {
		return reDate;
	}

	public void setReDate(Date reDate) {
		this.reDate = reDate;
	}

	// toString
	@Override
	public String toString() {
		return "ReservationDTO [reNo=" + reNo + ", reUserId=" + reUserId + ", reDate=" + reDate + "]";
	}
}
