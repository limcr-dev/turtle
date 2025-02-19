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

import com.spring.turtle.service.FaqServiceImpl;

@Controller
public class FaqController {
	
private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired 
	private FaqServiceImpl service;
	
	String viewPage = "";
	
	// FAQ 목록
	@RequestMapping("/faqList.bo")
	public String faqList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /faqList.bo >>>");
		service.faqListAction(request, response, model);
		
		return "support/faq/faqList";
	}
		
	// FAQ 목록 관리자
	@RequestMapping("/adFaqList.ad")
	public String adFaqList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqList.ad >>>");
		service.adFaqListAction(request, response, model);
		
		return "admin/support/faq/adFaqList";
	}	
	
	// FAQ 작성페이지이동 관리자
	@RequestMapping("/adFaqInsert.ad")
	public String adFaqInsert(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqInsert.ad >>>");
		service.adFaqListAction(request, response, model);
		
		return "admin/support/faq/adFaqInsert";
	}	
	
	// FAQ 작성 관리자
	@RequestMapping("/adFaqInsertAction.ad")
	public String adFaqInsertAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqInsertAction.ad >>>");
		service.adFaqInsertAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/adFaqList.ad";
		response.sendRedirect(viewPage);
		
		return null;
	}
	
	// FAQ 상세페이지 관리자
	@RequestMapping("/adFaqDetailAction.ad")
	public String adFaqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqDetailAction.ad >>>");
		service.adFaqDetailAction(request, response, model);
		
		return "admin/support/faq/adFaqDetail";
	}	
	
	// FAQ 삭제처리 관리자
	@RequestMapping("/adFaqDelete.ad")
	public String adFaqDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqDelete.ad >>>");
		service.adFaqDeleteAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/adFaqList.ad";
		response.sendRedirect(viewPage);
		
		return null;
	}
	// FAQ 수정페이지 이동 관리자
	@RequestMapping("/adFaqUpdate.ad")
	public String adFaqUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqUpdate.ad >>>");
		service.adFaqDetailAction(request, response, model);
		
		return "admin/support/faq/adFaqUpdate";
	}
	// FAQ 수정처리관리자
	@RequestMapping("/adFaqUpdateAction.ad")
	public String adFaqUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqUpdateAction.ad >>>");
		service.adFaqUpdateAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/adFaqList.ad";
		response.sendRedirect(viewPage);
		
		return null;
	}
	// FAQ 복구 관리자
	@RequestMapping("/adFaqRestore.ad")
	public String adFaqRestore(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adFaqRestore.ad >>>");
		service.adFaqRestoreAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/adFaqList.ad";
		response.sendRedirect(viewPage);
		
		return null;
	}
}