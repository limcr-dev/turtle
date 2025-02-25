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
	
	// 헬스 등록(회원용)
	@RequestMapping("/healthJoin.do")
	public String healthJoin(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /healthJoin.ad >>>");
		service.healthJoin(request, response, model);
		return "health/healthJoin";
	}
	
	// 헬스 등록 처리(회원용)
	@RequestMapping("/healthJoinAction.do")
	public String healthJoinAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException {
		logger.info("<<< url ==>  /healthJoinAction.do>>>");
		service.healthJoinAction(request, response, model);
		return "health/healthJoinAction";
	}
	// 헬스회원 목록
	@RequestMapping("/adHealthList.ad")
	public String adHealthList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthList.ad >>>");
		
		service.healthListAction(request, response, model);
		return "admin/health/adHealthList";
	}
	
	// 미결제 헬스회원 목록
	@RequestMapping("/adHealthUnPayList.ad")
	public String adHealthUnPayList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthUnPayList.ad >>>");
		
		service.healthUnPayListAction(request, response, model);
		return "admin/health/adHealthUnPayList";
	}

	@RequestMapping("/adHealthApproveAction.ad")
	public String adHealthApproveAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthApproveAction.ad >>>");
		
		service.healthUnPayListApprove(request, response, model);
		return "admin/health/adHealthApproveAction";
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
		service.healthInsert(request, response, model);
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
	
	//헬스회원 삭제
	@RequestMapping("/adHealthCancleAction")
	public String adHealthCancleAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adHealthCancleAction.ad >>>");
		service.healthDeleteAction(request, response, model);
		return "admin/health/adHealthCancleAction";
	}
}
