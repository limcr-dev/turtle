package com.spring.turtle.dto;

import java.sql.Timestamp;

public class BoardCommentDTO {

	// 멤버변수
	private int b_comNo;			// 댓글번호
	private int b_comCnt;			// 댓글수
	private String b_comWriter;		// 아이디
	private String b_comContent;	// 댓글내용
	private Timestamp b_comRegdate;	// 등록일자
	private int boardNo;			// 게시글번호
	private String b_comType;		// 댓글 작성자타입
	
	// 디폴트 생성자
	public BoardCommentDTO() {
		super();
	}

	// 매개변수
	public BoardCommentDTO(int b_comNo, int b_comCnt, String b_comWriter, String b_comContent, Timestamp b_comRegdate,
			int boardNo, String b_comType) {
		super();
		this.b_comNo = b_comNo;
		this.b_comCnt = b_comCnt;
		this.b_comWriter = b_comWriter;
		this.b_comContent = b_comContent;
		this.b_comRegdate = b_comRegdate;
		this.boardNo = boardNo;
		this.b_comType = b_comType;
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

	public Timestamp getb_comRegdate() {
		return b_comRegdate;
	}

	public void setb_comRegdate(Timestamp b_comRegdate) {
		this.b_comRegdate = b_comRegdate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getB_comType() {
		return b_comType;
	}

	public void setB_comType(String b_comType) {
		this.b_comType = b_comType;
	}

	// toString
	@Override
	public String toString() {
		return "BoardCommentDTO [b_comNo=" + b_comNo + ", b_comCnt=" + b_comCnt + ", b_comWriter=" + b_comWriter
				+ ", b_comContent=" + b_comContent + ", b_comRegdate=" + b_comRegdate + ", boardNo=" + boardNo
				+ ", b_comType=" + b_comType + "]";
	}
}
