package com.spring.turtle_01.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class SupportServiceImpl implements SupportService{

	// 1대1문의 목록
	@Override
	public void qnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 1대1문의 작성
	@Override
	public void qnaInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 1대1문의 글 삭제시 인증
	public void qnaPwdChkAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		
	}
	// 1대1문의 삭제
	@Override
	public void qnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 1대1문의 상세페이지
	@Override
	public void qnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 1대1문의 댓글 작성
	@Override
	public void qnaCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 1대1문의 댓글 수정
	@Override
	public void qnaCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	
	// ------공지사항-------
	// 공지 목록
	@Override
	public void noticeListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}
	// 공지 상세페이지
	@Override
	public void noticeDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}


	// ------이벤트------
	// 이벤트 목록
	@Override
	public void eventListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 이벤트 상세페이지
	@Override
	public void eventDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}


	// ------FAQ------
	// FAQ 목록
	@Override
	public void faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// FAQ 상세내용
	@Override
	public void faqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	
	// ------자유게시판------
	// 자유게시판 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 자유게시판 게시글 작성
	@Override
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 자유게시판 게시글 상세페이지
	@Override
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 자유게시판 게시글 삭제
	@Override
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 자유게시판 게시글 댓글 작성
	@Override
	public void boardCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// 자유게시판 게시글 댓글 수정
	@Override
	public void boardCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

}
