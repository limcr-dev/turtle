package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface ReservationService {
	
	// ---------------- 상담 예약 ------------------
	// 회원 인증(사용자)
	public void revConsultCheckUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 시간 체크(사용자/관리자)
	public void revConsultDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 등록(사용자)
	public void insertRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 목록(사용자)
	public void revConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 목록(관리자)
	public void adRevConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 상세 페이지(사용자)
	public void adRevConsultDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 수정(관리자)
	public void adRevConsultUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 취소(사용자/관리자)
	public void deleteRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	//------------------ PT 예약 --------------------

	// PT 수업 여부 확인(사용자)
	public void checkUserPTCount(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// PT 회원 인증(사용자)
	public void revPTCheckUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// PT 시간 체크(사용자/관리자)
		public void revPTDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
		
	// PT 예약 등록(사용자)
	public void insertRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// PT 예약 목록(사용자)
	public void revPTList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
		
	// PT 예약 취소(사용자/관리자)
	public void deleteRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// PT 상태 완료로 변경(사용자)
	public void completeRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// PT 예약 목록(관리자)
	public void adRevPTList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// PT 예약 상세 페이지(관리자)
	public void adRevPTDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// PT 예약 수정(관리자)
	public void adRevPTUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// PT 상태 완료로 변경(사용자)
	public void completeAdRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
}
