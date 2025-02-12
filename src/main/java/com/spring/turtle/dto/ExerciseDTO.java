package com.spring.turtle.dto;

import java.sql.Date;

public class ExerciseDTO {

	// 멤버변수
	private int exerciseNo;			// 헬스등록번호
	private int userNo;				// 회원번호
	private int tranerNo;			// 트레이너번호
	private int ptCnt;				// PT횟수
	private Date exerciseStartDate;	// 시작
	private Date exerciseEndDate;	// 끝
	
	// 디폴트생성자
	public ExerciseDTO() {
		super();
	}

	// 매개변수
	public ExerciseDTO(int exerciseNo, int userNo, int tranerNo, int ptCnt, Date exerciseStartDate,
			Date exerciseEndDate) {
		super();
		this.exerciseNo = exerciseNo;
		this.userNo = userNo;
		this.tranerNo = tranerNo;
		this.ptCnt = ptCnt;
		this.exerciseStartDate = exerciseStartDate;
		this.exerciseEndDate = exerciseEndDate;
	}

	// getter, setter
	public int getExerciseNo() {
		return exerciseNo;
	}

	public void setExerciseNo(int exerciseNo) {
		this.exerciseNo = exerciseNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTranerNo() {
		return tranerNo;
	}

	public void setTranerNo(int tranerNo) {
		this.tranerNo = tranerNo;
	}

	public int getPtCnt() {
		return ptCnt;
	}

	public void setPtCnt(int ptCnt) {
		this.ptCnt = ptCnt;
	}

	public Date getExerciseStartDate() {
		return exerciseStartDate;
	}

	public void setExerciseStartDate(Date exerciseStartDate) {
		this.exerciseStartDate = exerciseStartDate;
	}

	public Date getExerciseEndDate() {
		return exerciseEndDate;
	}

	public void setExerciseEndDate(Date exerciseEndDate) {
		this.exerciseEndDate = exerciseEndDate;
	}

	// toString
	@Override
	public String toString() {
		return "ExerciseDTO [exerciseNo=" + exerciseNo + ", userNo=" + userNo + ", tranerNo=" + tranerNo + ", ptCnt="
				+ ptCnt + ", exerciseStartDate=" + exerciseStartDate + ", exerciseEndDate=" + exerciseEndDate + "]";
	}
}
