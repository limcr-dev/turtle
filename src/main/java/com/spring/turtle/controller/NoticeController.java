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

import com.spring.turtle.service.NoticeServiceImpl;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeServiceImpl service;
	
	// 공지 목록
	@RequestMapping("/adNoticeList.ad")
	public String adNoticeList(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeList.ad >>>");
		
		service.noticeList(request, response, model);
		
		return "admin/support/notice/adNoticeList";
	}
	
	// 공지 상세페이지
	@RequestMapping("/adNoticeDetail.ad")
	public String adNoticeDetail(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeDetail.ad >>>");

		service.noticeDetail(request, response, model);
		
		return "admin/support/notice/adNoticeDetail";
	}
	
	// 공지 작성 화면
	@RequestMapping("/adNoticeInsert.ad")
	public String adNoticeInsert(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeInsert.ad >>>");
		
		return "admin/support/notice/adNoticeInsert";
	}
	
	// 공지 작성 처리
	@RequestMapping("/adNoticeInsertAction.ad")
	public void adNoticeInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeInsert.ad >>>");

		service.noticeInsert(request, response, model);
		
		String viewPage = request.getContextPath() + "/adNoticeList.ad";
		response.sendRedirect(viewPage);
	}
	
	// 공지 수정 화면
	@RequestMapping("/adNoticeUpdate.ad")
	public String adNoticeUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeUpdate.ad >>>");
		
		service.noticeUpdate(request, response, model);
		
		return "admin/support/notice/adNoticeUpdate";
	}
	
	
	// 공지 수정 처리
	@RequestMapping("/adNoticeUpdateAction.ad")
	public void adNoticeUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeUpdateAction.ad >>>");
		
		service.noticeUpdateAction(request, response, model);
		
		String viewPage = request.getContextPath() + "/adNoticeList.ad";
		response.sendRedirect(viewPage);
	}
	
	// 공지 삭제 처리
	@RequestMapping("/adNoticeDeleteAction.ad")
	public String adNoticeDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeDeleteAction.ad >>>");

		service.noticeDelete(request, response, model);
		
		String viewPage = request.getContextPath() + "/adNoticeList.ad";
		response.sendRedirect(viewPage);
		
		return "admin/support/notice/adNoticeDetail";
	}
	
}
