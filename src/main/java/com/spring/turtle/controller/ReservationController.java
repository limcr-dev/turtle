package com.spring.turtle.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.turtle.service.ReservationService;

@Controller
public class ReservationController {

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService service;
	
	// ------------- 사용자 ----------------
	// 예약 목록
	@RequestMapping("/revConsult.do")
	public String revConsult() {
		logger.info("<<< url ==>  /revConsult.ad >>>");
		return "reservation/revConsult";
	}
	
	// 회원 인증
	@RequestMapping("/revCheckUser.do")
	public String revCheckUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revCheckUser.ad >>>");
		
		service.checkUserAction(request, response, model);
		return "reservation/revCheckUser";
	}
	
	// 상담 예약 가능한 날짜 불러오기
	@RequestMapping("/revConsultDateCheck.do")
	public String revDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDateCheck.ad >>>");
		
		service.revConsultDateCheck(request, response, model);
		
		return "reservation/revConsultTime";
	}
	
	// 예약 등록
	@RequestMapping("/revConsultAction.do")
	public String revConsultAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDateCheck.ad >>>");
		
		service.insertRevConsult(request, response, model);
		
		return "reservation/revConsultAction";
	}	
	
	// 상담 예약 목록(사용자)
	@RequestMapping("/revConsultList.do")
	public String revConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDetail.ad >>>");
		
		service.revConsultList(request, response, model);
		
		return "reservation/revConsultList";
	}
	
	// 상담 예약 취소(사용자)
	@RequestMapping("/revConsultDeleteAction.do")
	public String revConsultDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDeleteAction.ad >>>");
		
		service.deleteRevConsult(request, response, model);
		
		return "reservation/revConsultDeleteAction";
	}
	
	// 예약 상세 페이지(관리자)
	@RequestMapping("/revConsultDetail.do")
	public String revConsultDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDetail.ad >>>");
		
		service.revConsultDetail(request, response, model);
		
		return "reservation/revConsultDetail";
	}
	
	// 상담 예약 목록(사용자)
	
	// ------------- 관리자 ----------------
	// 예약 목록
	@RequestMapping("/adReservationList.ad")
	public String adReservationList() {
		logger.info("<<< url ==>  /adReservationList.ad >>>");
		return "admin/reservation/adReservationList";
	}
}
