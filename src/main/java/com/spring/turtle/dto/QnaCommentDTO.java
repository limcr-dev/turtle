package com.spring.turtle.dto;

import java.sql.Timestamp;

public class QnaCommentDTO {
	
	// 멤버변수
	private int q_comNo;			// 번호
	private int q_comCnt;			// 댓글수
	private String q_comWriter;		// 작성자
	private String q_comContent;	// 댓글내용
	private Timestamp q_comRegdate;		// 등록일자
	private int qnaNo;				// 1:1 문의 글번호
	
	// 디폴트생성자
	public QnaCommentDTO() {
		super();
	}

	// getter, setter
	public int getQ_comNo() {
		return q_comNo;
	}

	public void setQ_comNo(int q_comNo) {
		this.q_comNo = q_comNo;
	}

	public int getQ_comCnt() {
		return q_comCnt;
	}

	public void setQ_comCnt(int q_comCnt) {
		this.q_comCnt = q_comCnt;
	}

	public String getQ_comWriter() {
		return q_comWriter;
	}

	public void setQ_comWriter(String q_comWriter) {
		this.q_comWriter = q_comWriter;
	}

	public String getQ_comContent() {
		return q_comContent;
	}

	public void setQ_comContent(String q_comContent) {
		this.q_comContent = q_comContent;
	}

	public Timestamp getQ_comRegdate() {
		return q_comRegdate;
	}

	public void setQ_comRegdate(Timestamp q_comRegdate) {
		this.q_comRegdate = q_comRegdate;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	// toString
	@Override
	public String toString() {
		return "QnaCommentDTO [q_comNo=" + q_comNo + ", q_comCnt=" + q_comCnt + ", q_comWriter=" + q_comWriter
				+ ", q_comContent=" + q_comContent + ", q_comRegdate=" + q_comRegdate + ", qnaNo=" + qnaNo + "]";
	}
}
