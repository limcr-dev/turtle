package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface ReservationService {
	
	// 회원 인증
	public void checkUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 등록
	public void insertRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 상세 정보 조회
	public void revConsultDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 수정(관리자)
	public void modifyRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 삭제
	public void deleteRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 예약 목록
	public void revConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 상담 시간 체크
	public void revConsultDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
