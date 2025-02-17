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
	
	

	
	
	// ------공지사항-------
	// 공지 목록
	public void noticeListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 공지 상세페이지
	public void noticeDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// ------이벤트------
	// 이벤트 목록
	public void eventListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 이벤트 상세페이지
	public void eventDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	
	// ------FAQ------
	// FAQ 목록
	public void faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// FAQ 상세내용
	public void faqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	
	// ------자유게시판------
	// 자유게시판 게시글 목록
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 자유게시판 게시글 작성
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 자유게시판 게시글 상세페이지
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 자유게시판 게시글 삭제
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 자유게시판 게시글 댓글 작성
	public void boardCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 자유게시판 게시글 댓글 수정
	public void boardCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
}
