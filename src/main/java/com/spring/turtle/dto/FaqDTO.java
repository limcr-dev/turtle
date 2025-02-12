package com.spring.turtle.dto;

public class FaqDTO {

	// 멤버변수
	private int faqNo;				// 번호
	private String faqWriter;		// 작성자
	private String faqTitle;		// 제목
	private String faqContent;		// 내용
	private String faqType;			// 질문종류
	private String faqShow;			// 삭제유무
	
	// 디폴트 생성자
	public FaqDTO() {
		super();
	}
	
	// 매개변수 생성자
	public FaqDTO(int faqNo, String faqWriter, String faqTitle, String faqContent, String faqType, String faqShow) {
		super();
		this.faqNo = faqNo;
		this.faqWriter = faqWriter;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqType = faqType;
		this.faqShow = faqShow;
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

	@Override
	public String toString() {
		return "FaqDTO [faqNo=" + faqNo + ", faqWriter=" + faqWriter + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqType=" + faqType + ", faqShow=" + faqShow + "]";
	}
	
	
}
