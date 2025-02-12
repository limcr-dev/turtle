package com.spring.turtle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
	
private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	// FAQ 목록
	@RequestMapping("/adFaqList.ad")
	public String adFaqList() {
		logger.info("<<< url ==>  /adFaqList.ad >>>");
		return "admin/support/faq/adFaqList";
	}	
}
