package com.spring.turtle.dto;

import java.sql.Timestamp;
import java.sql.Date;

public class UserDTO {
	
	// 멤버변수
	private int userNo;				// 회원번호
	private String userId; 			// 아이디
	private String userPw; 			// 비밀번호
	private String userName;		// 이름
	private String userGender;		// 성별
	private String userAddress;		// 주소
	private Date userBirthday;		// 생일
	private String userHp;			// 전화번호
	private String userEmail;		// 이메일
	private String userShow;			// 탈퇴유무
	private Timestamp userRegDate;	// 가입일
	private String userType;			// 회원-U/관리자-A 구분
    
    // 디폴트생성자	
	public UserDTO() {
		super();
	}

	// 매개변수
	public UserDTO(int userNo, String userId, String userPw, String userName, String userGender, String userAddress, Date userBirthday,
			String userHp, String userEmail, String userShow, Timestamp userRegDate, String userType) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userBirthday = userBirthday;
		this.userHp = userHp;
		this.userEmail = userEmail;
		this.userShow = userShow;
		this.userRegDate = userRegDate;
		this.userType = userType;
	}
	
	// getter setter
	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserGender() {
		return userGender;
	}


	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public Date getUserBirthday() {
		return userBirthday;
	}


	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}


	public String getUserHp() {
		return userHp;
	}


	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserShow() {
		return userShow;
	}


	public void setUserShow(String userShow) {
		this.userShow = userShow;
	}


	public Timestamp getUserRegDate() {
		return userRegDate;
	}


	public void setUserRegDate(Timestamp userRegDate) {
		this.userRegDate = userRegDate;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	// toString
	
	@Override
	public String toString() {
		return "UserDTO [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userGender=" + userGender
				+ ", userAddress=" + userAddress + ", userBirthday=" + userBirthday + ", userHp=" + userHp
				+ ", userEmail=" + userEmail + ", userShow=" + userShow + ", userRegDate=" + userRegDate + ", userType="
				+ userType + "]";
	}
	
}
