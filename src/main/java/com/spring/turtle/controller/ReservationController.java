package com.spring.turtle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	// 예약 목록
	@RequestMapping("/adReservationList.ad")
	public String adReservationList() {
		logger.info("<<< url ==>  /adReservationList.ad >>>");
		return "admin/reservation/adReservationList";
	}
}
