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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.turtle.service.EventServiceImpl;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventServiceImpl service;
	
	// 이벤트 목록
	@RequestMapping("/adEventList.ad")
	public String adEventList(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adEventList.ad >>>");
		
		service.eventList(request, response, model);
		
		return "admin/support/event/adEventList";
	}
	
	// 이벤트 상세페이지
	@RequestMapping("/adEventDetail.ad")
	public String adEventDetail(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adEventDetail.ad >>>");
		
		service.eventDetail(request, response, model);
		
		return "admin/support/event/adEventDetail";
	}
	
	
	// 이벤트 작성
	@RequestMapping("/adEventInsert.ad")
	public String adEventInsert(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adEventInsert.ad >>>");
		
		return "admin/support/event/adEventInsert";
	}
	
	// 이벤트 작성처리
	@RequestMapping("/adEventInsertAction.ad")
	public void adEventInsertAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adEventInsertAction.ad >>>");
		
		service.eventInsert(request, response, model);
		
		String viewPage = request.getContextPath() + "/adEventList.ad";
		response.sendRedirect(viewPage);
	}
	
	// 이벤트 수정
	@RequestMapping("/adEventUpdate.ad")
	public String adEventUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adEventUpdate.ad >>>");
		
		service.eventUpdate(request, response, model);
		
		return "admin/support/event/adEventUpdate";
	}
	
	// 이벤트 수정처리
	@RequestMapping("/adEventUpdateAction.ad")
	public void adEventUpdateAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adEventUpdateAction.ad >>>");
		
		service.eventUpdateAction(request, response, model);
		
		String viewPage = request.getContextPath() + "/adEventList.ad";
		response.sendRedirect(viewPage);
	}
	
	// 이벤트 삭제
	@RequestMapping("/adEventDelete.ad")
	public void adEventDelete(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adEventDelete.ad >>>");
		
		service.eventDelete(request, response, model);
		
		String viewPage = request.getContextPath() + "/adEventList.ad";
		response.sendRedirect(viewPage);
	}
	// ========================= 일반 =========================
	// 이벤트 목록
	@RequestMapping("/eventList.bo")
	public String eventList1(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /eventList.bo >>>");
		
		service.eventList1(request, response, model);
		
		return "support/event/eventList";
	}
	
	// 이벤트 상세페이지
	@RequestMapping("/eventDetail.bo")
	public String eventDetail(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /eventDetail.bo >>>");
		
		service.eventDetail(request, response, model);
		
		return "support/event/eventDetail";
	}
	// ========================= 일반 =========================
}
