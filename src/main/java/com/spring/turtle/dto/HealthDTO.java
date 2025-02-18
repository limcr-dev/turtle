package com.spring.turtle.dto;

import java.sql.Date;

public class HealthDTO {
	
	private int healthNo;
	private String userId;
	private String userName;
	private String userHp;
	private String healthImg;
	private int ptCnt;
	private Date healthStartDate;
	private Date healthEndDate;
	private String healthStatus;
	private String healthShow;
	
	public HealthDTO() {
		super();	
	}

	public HealthDTO(int healthNo, String userId, String userName, String userHp, String healthImg, int ptCnt,
			Date healthStartDate, Date healthEndDate, String healthStatus, String healthShow) {
		super();
		this.healthNo = healthNo;
		this.userId = userId;
		this.userName = userName;
		this.userHp = userHp;
		this.healthImg = healthImg;
		this.ptCnt = ptCnt;
		this.healthStartDate = healthStartDate;
		this.healthEndDate = healthEndDate;
		this.healthStatus = healthStatus;
		this.healthShow = healthShow;
	}

	public int getHealthNo() {
		return healthNo;
	}

	public void setHealthNo(int healthNo) {
		this.healthNo = healthNo;
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

	public String getHealthImg() {
		return healthImg;
	}

	public void setHealthImg(String healthImg) {
		this.healthImg = healthImg;
	}

	public int getPtCnt() {
		return ptCnt;
	}

	public void setPtCnt(int ptCnt) {
		this.ptCnt = ptCnt;
	}

	public Date getHealthStartDate() {
		return healthStartDate;
	}

	public void setHealthStartDate(Date healthStartDate) {
		this.healthStartDate = healthStartDate;
	}

	public Date getHealthEndDate() {
		return healthEndDate;
	}

	public void setHealthEndDate(Date healthEndDate) {
		this.healthEndDate = healthEndDate;
	}

	public String getHealthStatus() {
		return healthStatus;
	}

	public void setHealthStatus(String healthStatus) {
		this.healthStatus = healthStatus;
	}

	public String getHealthShow() {
		return healthShow;
	}

	public void setHealthShow(String healthShow) {
		this.healthShow = healthShow;
	}

	@Override
	public String toString() {
		return "HealthDTO [healthNo=" + healthNo + ", userId=" + userId + ", userName=" + userName + ", userHp="
				+ userHp + ", healthImg=" + healthImg + ", ptCnt=" + ptCnt + ", healthStartDate=" + healthStartDate
				+ ", healthEndDate=" + healthEndDate + ", healthStatus=" + healthStatus + ", healthShow=" + healthShow
				+ "]";
	}
}
