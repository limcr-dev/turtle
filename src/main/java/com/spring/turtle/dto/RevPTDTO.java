package com.spring.turtle.dto;

import java.sql.Timestamp;
 
// PT 예약
public class RevPTDTO {
	
	// 멤버변수
	private int revPTNo;		// PT 예약 번호
    private String userId;		// 회원 아이디
    private String userName;	// 회원 이름
    private String userHp;		// 회원 전화번호
    private String trainerId;	// 트레이너 아이디
    private Timestamp revPTDate;// PT 예약일
    private String revPTStatus;	// PT 예약 상태 -> 대기, 승인, 완료, 취소
    
    // 디폴트 생성자
	public RevPTDTO() {}

	// 매개변수 생성자
	public RevPTDTO(int revPTNo, String userId, String userName, String userHp, String trainerId, Timestamp revPTDate,
			String revPTStatus) {
		super();
		this.revPTNo = revPTNo;
		this.userId = userId;
		this.userName = userName;
		this.userHp = userHp;
		this.trainerId = trainerId;
		this.revPTDate = revPTDate;
		this.revPTStatus = revPTStatus;
	}

	// getter, setter
	public int getRevPTNo() {
		return revPTNo;
	}

	public void setRevPTNo(int revPTNo) {
		this.revPTNo = revPTNo;
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

	public Timestamp getRevPTDate() {
		return revPTDate;
	}

	public void setRevPTDate(Timestamp revPTDate) {
		this.revPTDate = revPTDate;
	}

	public String getRevPTStatus() {
		return revPTStatus;
	}

	public void setRevPTStatus(String revPTStatus) {
		this.revPTStatus = revPTStatus;
	}

	// toString
	@Override
	public String toString() {
		return "RevPTDTO [revPTNo=" + revPTNo + ", userId=" + userId + ", userName=" + userName + ", userHp=" + userHp
				+ ", trainerId=" + trainerId + ", revPTDate=" + revPTDate + ", revPTStatus=" + revPTStatus + "]";
	}
}
