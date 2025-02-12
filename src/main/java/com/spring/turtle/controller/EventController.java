package com.spring.turtle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	// 이벤트 목록
	@RequestMapping("/adEventList.ad")
	public String adEventList() {
		logger.info("<<< url ==>  /adEventList.ad >>>");
		return "admin/support/event/adEventList";
	}
	
}
