package com.spring.turtle.dto;

import java.sql.Timestamp;

public class RevConsultDTO {
	
	// 멤버변수
	private int revConsultNo;			// 상담 예약 번호
	private String userId;				// 예약자 아이디
	private String userName;			// 예약자 이름
	private String userHp;				// 예약자 전화번호
	private String trainerId;			// 상담 담당 트레이너 아이디
    private Timestamp revConsultDate;		// 예약 날짜
    private String revConsultStatus;	// 예약 상태 - 대기, 승인, 거절
    private String revConsultDay;		// 예약 요일(일, 월, 화 ...)
    
    // 디폴트 생성자
	public RevConsultDTO() {}
	
	// 매개변수 생성자
	public RevConsultDTO(int revConsultNo, String userId, String userName, String userHp, String trainerId,
			Timestamp revConsultDate, String revConsultStatus, String revConsultDay) {
		this.revConsultNo = revConsultNo;
		this.userId = userId;
		this.userName = userName;
		this.userHp = userHp;
		this.trainerId = trainerId;
		this.revConsultDate = revConsultDate;
		this.revConsultStatus = revConsultStatus;
		this.revConsultDay = revConsultDay;
	}
	
	// getter, setter
	public int getRevConsultNo() {
		return revConsultNo;
	}
	
	public void setRevConsultNo(int revConsultNo) {
		this.revConsultNo = revConsultNo;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserHp() {
		return userHp;
	}
	
	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}
	
	public String getTrainerId() {
		return trainerId;
	}
	
	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}
	
	public Timestamp getRevConsultDate() {
		return revConsultDate;
	}
	
	public void setRevConsultDate(Timestamp revConsultDate) {
		this.revConsultDate = revConsultDate;
	}
	
	public String getRevConsultStatus() {
		return revConsultStatus;
	}
	
	public void setRevConsultDay(String revConsultDay) {
		this.revConsultDay = revConsultDay;
	}
	
	public String getRevConsultDay() {
		return revConsultDay;
	}
	
	public void setRevConsultStatus(String revConsultStatus) {
		this.revConsultStatus = revConsultStatus;
	}
	
	@Override
	public String toString() {
		return "RevConsultDTO [revConsultNo=" + revConsultNo + ", userId=" + userId + ", userName=" + userName
				+ ", userHp=" + userHp + ", trainerId=" + trainerId + ", revConsultDate=" + revConsultDate
				+ ", revConsultStatus=" + revConsultStatus + "]";
	}
    
}
