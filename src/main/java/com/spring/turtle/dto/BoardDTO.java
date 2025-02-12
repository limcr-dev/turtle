package com.spring.turtle.dto;

import java.sql.Timestamp;

public class BoardDTO {

	// 멤버변수
	private int boardNo;			// 게시판번호
	private String boardWriter;		// 이름
	private String boardTitle;		// 제목
	private int boardCommentCnt;	// 댓글갯수
	private	int boardViews;			// 조회수
	private String boardContent;	// 내용
	private Timestamp boardRegdate;	// 등록일자
	private String boardShow;		// 삭제유무
	
	// 디폴트 생성자
	public BoardDTO() {
		super();
	}

	// 매개변수
	public BoardDTO(int boardNo, String boardWriter, String boardTitle, int boardCommentCnt, int boardViews,
			String boardContent, Timestamp boardRegdate, String boardShow) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardCommentCnt = boardCommentCnt;
		this.boardViews = boardViews;
		this.boardContent = boardContent;
		this.boardRegdate = boardRegdate;
		this.boardShow = boardShow;
	}

	// getter, setter
	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getBoardCommentCnt() {
		return boardCommentCnt;
	}

	public void setBoardCommentCnt(int boardCommentCnt) {
		this.boardCommentCnt = boardCommentCnt;
	}

	public int getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Timestamp getBoardRegdate() {
		return boardRegdate;
	}

	public void setBoardRegdate(Timestamp boardRegdate) {
		this.boardRegdate = boardRegdate;
	}

	public String getBoardShow() {
		return boardShow;
	}

	public void setBoardShow(String boardShow) {
		this.boardShow = boardShow;
	}

	// toString
	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardCommentCnt=" + boardCommentCnt + ", boardViews=" + boardViews + ", boardContent="
				+ boardContent + ", boardRegdate=" + boardRegdate + ", boardShow=" + boardShow + "]";
	}
}
