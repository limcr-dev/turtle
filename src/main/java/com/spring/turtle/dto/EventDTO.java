package com.spring.turtle.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class EventDTO {
	
	// 멤버변수
	private int eventNo;			// 번호
	private String eventWriter;		// 이름
	private String eventTitle;		// 제목
	private Date eventStartDate;	// 시작날짜
	private Date eventEndDate;		// 끝날짜
	private Timestamp eventRegdate;	// 등록일자
	private String eventShow;		// 삭제유무
	private int eventViews;			// 조회수
	private String eventImage;		// 이미지
	
	// 디폴트생성자
	public EventDTO() {
		super();
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventWriter() {
		return eventWriter;
	}

	public void setEventWriter(String eventWriter) {
		this.eventWriter = eventWriter;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Date getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public Timestamp getEventRegdate() {
		return eventRegdate;
	}

	public void setEventRegdate(Timestamp eventRegdate) {
		this.eventRegdate = eventRegdate;
	}

	public String getEventShow() {
		return eventShow;
	}

	public void setEventShow(String eventShow) {
		this.eventShow = eventShow;
	}

	public int getEventViews() {
		return eventViews;
	}

	public void setEventViews(int eventViews) {
		this.eventViews = eventViews;
	}

	public String getEventImage() {
		return eventImage;
	}

	public void setEventImage(String eventImage) {
		this.eventImage = eventImage;
	}

	@Override
	public String toString() {
		return "EventDTO [eventNo=" + eventNo + ", eventWriter=" + eventWriter + ", eventTitle=" + eventTitle
				+ ", eventStartDate=" + eventStartDate + ", eventEndDate=" + eventEndDate + ", eventRegdate="
				+ eventRegdate + ", eventShow=" + eventShow + ", eventViews=" + eventViews + ", eventImage="
				+ eventImage + "]";
	}
}
