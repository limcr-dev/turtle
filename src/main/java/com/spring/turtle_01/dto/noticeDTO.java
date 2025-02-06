package com.spring.turtle_01.dto;

import java.sql.Timestamp;

public class noticeDTO {
	
	// 멤버변수
	private int noticeNo;				// 번호
	private String noticeWiter;			// 이름
	private String noticeTitle;			// 제목
	private int noticeViews;			// 조회수
	private String noticeContent;		// 내용
	private Timestamp noticeRegdate;	// 등록일자
	private String noticeShow;			// 삭제유무
	
	// 디폴트생성자
	public noticeDTO() {
		super();
	}

	// getter, setter
	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeWiter() {
		return noticeWiter;
	}

	public void setNoticeWiter(String noticeWiter) {
		this.noticeWiter = noticeWiter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public int getNoticeViews() {
		return noticeViews;
	}

	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Timestamp getNoticeRegdate() {
		return noticeRegdate;
	}

	public void setNoticeRegdate(Timestamp noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}

	public String getNoticeShow() {
		return noticeShow;
	}

	public void setNoticeShow(String noticeShow) {
		this.noticeShow = noticeShow;
	}

	// toString
	@Override
	public String toString() {
		return "noticeDTO [noticeNo=" + noticeNo + ", noticeWiter=" + noticeWiter + ", noticeTitle=" + noticeTitle
				+ ", noticeViews=" + noticeViews + ", noticeContent=" + noticeContent + ", noticeRegdate="
				+ noticeRegdate + ", noticeShow=" + noticeShow + "]";
	}	
}
