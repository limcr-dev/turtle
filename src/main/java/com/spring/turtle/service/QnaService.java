package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface QnaService {
	// 1대1문의 목록
	public void qnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	// 1대1문의 목록
	public void adQnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
			
	// 1대1문의 상세페이지
	public void qnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 1대1문의 작성
	public void qnaInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 1대1문의 수정
	public void qnaUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 1대1문의 삭제
	public void qnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
		
	// 1대1문의 댓글 목록
	public void qnaCommentListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// 1대1문의 댓글 작성
	public void qnaCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// 1대1문의 댓글 수정
	public void qnaCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 1대1문의 댓글 삭제
	public void qnaCommentDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 1대1문의 복구 
	public void adQnaRestoreAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}