package com.spring.turtle.dto;

import java.sql.Timestamp;

public class BoardCommentDTO {

	// 멤버변수
	private int b_comNo;			// 댓글번호
	private int b_comCnt;			// 댓글수
	private String b_comWriter;		// 아이디
	private String b_comContent;	// 댓글내용
	private Timestamp b_comRegDate;	// 등록일자
	private int boardNo;			// 게시글번호
	
	// 디폴트 생성자
	public BoardCommentDTO() {
		super();
	}

	// 매개변수
	public BoardCommentDTO(int b_comNo, int b_comCnt, String b_comWriter, String b_comContent, Timestamp b_comRegDate,
			int boardNo) {
		super();
		this.b_comNo = b_comNo;
		this.b_comCnt = b_comCnt;
		this.b_comWriter = b_comWriter;
		this.b_comContent = b_comContent;
		this.b_comRegDate = b_comRegDate;
		this.boardNo = boardNo;
	}

	// getter, setter
	public int getB_comNo() {
		return b_comNo;
	}

	public void setB_comNo(int b_comNo) {
		this.b_comNo = b_comNo;
	}

	public int getB_comCnt() {
		return b_comCnt;
	}

	public void setB_comCnt(int b_comCnt) {
		this.b_comCnt = b_comCnt;
	}

	public String getB_comWriter() {
		return b_comWriter;
	}

	public void setB_comWriter(String b_comWriter) {
		this.b_comWriter = b_comWriter;
	}

	public String getB_comContent() {
		return b_comContent;
	}

	public void setB_comContent(String b_comContent) {
		this.b_comContent = b_comContent;
	}

	public Timestamp getB_comRegDate() {
		return b_comRegDate;
	}

	public void setB_comRegDate(Timestamp b_comRegDate) {
		this.b_comRegDate = b_comRegDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	// toString
	@Override
	public String toString() {
		return "BoardCommentDTO [b_comNo=" + b_comNo + ", b_comCnt=" + b_comCnt + ", b_comWriter=" + b_comWriter
				+ ", b_comContent=" + b_comContent + ", b_comRegDate=" + b_comRegDate + ", boardNo=" + boardNo + "]";
	}
}
