package com.spring.turtle_01.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {
	
	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	// 공지사항 목록
	@RequestMapping("/noticeList.bo")
	public String noticeList() {
		logger.info("<<< url ==>  /noticeList.bo >>>");
		return "support/notice/noticeList";
	}
		
	// 공지사항 상세 페이지
	@RequestMapping("/noticeDetail.bo")
	public String noticeDetail() {
		logger.info("<<< url ==>  /noticeDetail.bo >>>");
		return "support/notice/noticeDetail";
	}
	
	// 이벤트 목록
	@RequestMapping("/eventList.bo")
	public String eventList() {
		logger.info("<<< url ==>  /eventList.bo >>>");
		return "support/event/eventList";
	}
	
	// 자유게시판 목록
	@RequestMapping("/boardList.bo")
	public String boardList() {
		logger.info("<<< url ==>  /boardList.bo >>>");
		return "support/board/boardList";
	}
	
	// 자유게시판 목록
	@RequestMapping("/boardDetail.bo")
	public String boarDetail() {
		logger.info("<<< url ==>  /boardDetail.bo >>>");
		return "support/board/boardDetail";
	}
		
	// FAQ 목록
	@RequestMapping("/faqList.bo")
	public String faqList() {
		logger.info("<<< url ==> /faqList.bo >>>");
		return "support/faq/faqList";
	}
	
	// 1:1 문의 목록
	@RequestMapping("/qnaList.bo")
	public String qnaList() {
		logger.info("<<< url ==>  /qnaList.bo >>>");
		return "support/qna/qnaList";
	}
		
}
