package com.spring.turtle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HealthController {

	private static final Logger logger = LoggerFactory.getLogger(HealthController.class);
	
	// 헬스 목록
	@RequestMapping("/adHealthList.ad")
	public String adHealthList() {
		logger.info("<<< url ==>  /adHealthList.ad >>>");
		return "admin/health/adHealthList";
	}
}
