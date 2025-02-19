package com.spring.turtle.dto;

import java.sql.Timestamp;

public class FaqDTO {

	// 멤버변수
	private int faqNo;				// 번호
	private String faqWriter;		// 작성자
	private String faqTitle;		// 제목
	private String faqContent;		// 내용
	private String faqType;			// 질문종류
	private String faqShow;			// 삭제유무
	private Timestamp faqRegDate;	// 작성일
	
	// 디폴트 생성자
	public FaqDTO() {
		super();
	}
	
	// 매개변수 생성자
	public FaqDTO(int faqNo, String faqWriter, String faqTitle, String faqContent, String faqType, String faqShow,
			Timestamp faqRegDate) {
		super();
		this.faqNo = faqNo;
		this.faqWriter = faqWriter;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqType = faqType;
		this.faqShow = faqShow;
		this.faqRegDate = faqRegDate;
	}

	// getter setter
	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqType() {
		return faqType;
	}

	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}

	public String getFaqShow() {
		return faqShow;
	}

	public void setFaqShow(String faqShow) {
		this.faqShow = faqShow;
	}

	public Timestamp getFaqRegDate() {
		return faqRegDate;
	}

	public void setFaqRegDate(Timestamp faqRegDate) {
		this.faqRegDate = faqRegDate;
	}

	@Override
	public String toString() {
		return "FaqDTO [faqNo=" + faqNo + ", faqWriter=" + faqWriter + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqType=" + faqType + ", faqShow=" + faqShow + ", faqRegDate=" + faqRegDate + "]";
	}
	
	
}
