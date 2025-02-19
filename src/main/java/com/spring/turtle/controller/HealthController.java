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

import com.spring.turtle.service.HealthServiceImpl;

@Controller
public class HealthController {

	@Autowired
	private HealthServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(HealthController.class);
	
	// 헬스회원 목록
	@RequestMapping("/adHealthList.ad")
	public String adHealthList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthList.ad >>>");
		
		service.healthListAction(request, response, model);
		return "admin/health/adHealthList";
	}
	
	// // 헬스회원 등록시(Id 조회)
	@RequestMapping("/adIdConfirmAction.ad")
	public String adIdConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adIdConfirmAction.ad >>>");
		
		service.IdCheckAction(request, response, model);
		return "admin/health/adIdConfirmAction";
	}
	
	// 헬스회원 등록 화면
	@RequestMapping("/adHealthInsert.ad")
	public String adHealthInsert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthInsert.ad >>>");
		return "admin/health/adHealthInsert";
	}
	
	// 헬스회원 등록 처리
	@RequestMapping("/adHealthInsertAction")
	public String adHealthInsertAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthInsertAction.ad >>>");
		service.healthInsertAction(request, response, model);
		return "admin/health/adHealthInsertAction";
	}
	
	//헬스회원 수정 화면
	@RequestMapping("/adHealthDetailAction")
	public String adHealthDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthDetailAction.ad >>>");
		
		service.healthDetailAction(request, response, model);
		return "admin/health/adHealthDetailAction";
	}
	
	//헬스회원 수정
	@RequestMapping("/adHealthUpdateAction")
	public String adHealthUpdateAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthUpdateAction.ad >>>");
		service.healthUpdateAction(request, response, model);
		return "admin/health/adHealthUpdateAction";
	}
	
	//헬스회원 삭제
	@RequestMapping("/adHealthDeleteAction")
	public String adHealthDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthDeleteAction.ad >>>");
		service.healthDeleteAction(request, response, model);
		return "admin/health/adHealthDeleteAction";
	}
	
}
