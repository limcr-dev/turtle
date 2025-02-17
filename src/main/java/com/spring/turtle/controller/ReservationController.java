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
		logger.info("<<< url ==>  /adReservationList.ad >>>");
		return "reservation/revConsult";
	}
	
	// 회원 인증
	@RequestMapping("/revCheckUser.do")
	public String revSearchUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revSearchUser.ad >>>");
		
		service.checkUserAction(request, response, model);
		return "reservation/revCheckUser";
	}
	
	// ------------- 관리자 ----------------
	// 예약 목록
	@RequestMapping("/adReservationList.ad")
	public String adReservationList() {
		logger.info("<<< url ==>  /adReservationList.ad >>>");
		return "admin/reservation/adReservationList";
	}
}
