package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface FaqService {
	// FAQ 목록
	public void faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// FAQ 목록 관리자
	public void adFaqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// FAQ 작성
	public void adFaqInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
		
	// FAQ 상세페이지
	public void adFaqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// FAQ 수정
	public void adFaqUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// FAQ 삭제
	public void adFaqDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// FAQ 삭제
	public void adFaqRestoreAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}