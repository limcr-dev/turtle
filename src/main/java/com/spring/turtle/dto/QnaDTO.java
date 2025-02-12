package com.spring.turtle.dto;
import java.sql.Date;
import java.sql.Timestamp;

public class QnaDTO {

	// 멤버변수
	private int qnaNo;				// 번호
	private String qnaWriter;		// 이름
	private String qnaTitle;		// 제목
	private String qnaCommentCnt;	// 댓글수
	private int qnaViews;			// 조회수
	private String qnaContent;		// 내용
	private Date qnaRegdate;	// 등록일자
	private String qnaShow;			// 삭제유무
	private String qnaStatus;		// 처리상태
	
	// 디폴트 생성자
	public QnaDTO() {
		super();
	}

	// getter, setter
	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaCommentCnt() {
		return qnaCommentCnt;
	}

	public void setQnaCommentCnt(String qnaCommentCnt) {
		this.qnaCommentCnt = qnaCommentCnt;
	}

	public int getQnaViews() {
		return qnaViews;
	}

	public void setQnaViews(int qnaViews) {
		this.qnaViews = qnaViews;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaRegdate() {
		return qnaRegdate;
	}

	public void setQnaRegdate(Date qnaRegdate) {
		this.qnaRegdate = qnaRegdate;
	}

	public String getQnaShow() {
		return qnaShow;
	}

	public void setQnaShow(String qnaShow) {
		this.qnaShow = qnaShow;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	// toString
	@Override
	public String toString() {
		return "QnaDTO [qnaNo=" + qnaNo + ", qnaWriter=" + qnaWriter + ", qnaTitle=" + qnaTitle + ", qnaCommentCnt="
				+ qnaCommentCnt + ", qnaViews=" + qnaViews + ", qnaContent=" + qnaContent + ", qnaRegdate=" + qnaRegdate
				+ ", qnaShow=" + qnaShow + ", qnaStatus=" + qnaStatus + "]";
	}
}
