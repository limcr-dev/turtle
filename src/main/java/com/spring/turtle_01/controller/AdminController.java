package com.spring.turtle_01.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	// 1:1 문의 목록
	@RequestMapping("/adQnaList.ad")
	public String adQnaList() {
		logger.info("<<< url ==>  /adQnaList.ad >>>");
		return "admin/support/qna/adQnaList";
	}
	
	// 공지 목록
	@RequestMapping("/adNoticeList.ad")
	public String adNoticeList() {
		logger.info("<<< url ==>  /adNoticeList.ad >>>");
		return "admin/support/notice/adNoticeList";
	}
		
	// 이벤트 목록
	@RequestMapping("/adEventList.ad")
	public String adEventList() {
		logger.info("<<< url ==>  /adEventList.ad >>>");
		return "admin/support/event/adEventList";
	}
	
	// FAQ 목록
	@RequestMapping("/adFaqList.ad")
	public String adFaqList() {
		logger.info("<<< url ==>  /adFaqList.ad >>>");
		return "admin/support/faq/adFaqList";
	}	
	
	// 자유게시판 목록
	@RequestMapping("/adBoardList.ad")
	public String adBoardList() {
		logger.info("<<< url ==>  /adBoardList.ad >>>");
		return "admin/support/board/adBoardList";
	}	
	
	// 예약 목록
	@RequestMapping("/adReservationList.ad")
	public String adReservationList() {
		logger.info("<<< url ==>  /adReservationList.ad >>>");
		return "admin/reservation/adReservationList";
	}	
	
	// 헬스 목록
	@RequestMapping("/adHealthList.ad")
	public String adHealthList() {
		logger.info("<<< url ==>  /adHealthList.ad >>>");
		return "admin/health/adHealthList";
	}
	
	// 회원 목록
	@RequestMapping("/adCustomerList.ad")
	public String adCustomerList() {
		logger.info("<<< url ==>  /adCustomerList.ad >>>");
		return "admin/customer/adCustomerList";
	}	
}
