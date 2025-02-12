package com.spring.turtle.dto;

import java.sql.Timestamp;

public class EventDTO {
	
	// 멤버변수
	private int eventNo;			// 번호
	private String eventWiter;		// 이름
	private String eventTitle;		// 제목
	private String eventContent;	// 내용
	private Timestamp eventRegdate;	// 등록일자
	private String eventShow;		// 삭제유무
	private int eventViews;			// 조회수
	private String eventImage;		// 이미지
	
	// 디폴트생성자
	public EventDTO() {
		super();
	}

	// getter, setter
	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getEventWiter() {
		return eventWiter;
	}

	public void setEventWiter(String eventWiter) {
		this.eventWiter = eventWiter;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventContent() {
		return eventContent;
	}

	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
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

	// toString 
	@Override
	public String toString() {
		return "EventDTO [eventNo=" + eventNo + ", eventWiter=" + eventWiter + ", eventTitle=" + eventTitle
				+ ", eventContent=" + eventContent + ", eventRegdate=" + eventRegdate + ", eventShow=" + eventShow
				+ ", eventViews=" + eventViews + ", eventImage=" + eventImage + "]";
	}
}
