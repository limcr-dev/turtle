package com.spring.turtle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 자유게시판 목록
	@RequestMapping("/adBoardList.ad")
	public String adBoardList() {
		logger.info("<<< url ==>  /adBoardList.ad >>>");
		return "admin/support/board/adBoardList";
	}	
}
