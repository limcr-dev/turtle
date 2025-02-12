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

import com.spring.turtle.service.AdCustomerServiceImpl;

@Controller
public class AdCustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdCustomerController.class);
	
	@Autowired
	private AdCustomerServiceImpl service;
	
	// 관리자메인
	@RequestMapping("/adMain.ad")
	public String adMain() {
		logger.info("<<< url ==>  /adMain.ad >>>");
		return "admin/common/adMain";
	}
	
	// 회원 목록
	@RequestMapping("/adCustomerList.ad")
	public String adCustomerList(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adCustomerList.ad >>>");
		
		service.customerList(request, response, model);
		
		return "admin/customer/adCustomerList";
	}	
	
	// 회원 정보 조회
	@RequestMapping("/adCustomerDetail.ad")
	public String adCustomerDetail(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeDetail.ad >>>");

		service.customerDetail(request, response, model);
		
		return "admin/customer/adCustomerDetail";
	}
	
	
	// 회원 정보 수정
	
	
	// 회원 삭제
	@RequestMapping("/adCustomerDelete.ad")
	public String adCustomerDelete(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adCustomerDelete.ad >>>");

		service.customerDelete(request, response, model);
		
		String viewPage = request.getContextPath() + "/adCustomerDelete.ad";
		response.sendRedirect(viewPage);
		
		return "admin/customer/adCustomerList";
	}
}
