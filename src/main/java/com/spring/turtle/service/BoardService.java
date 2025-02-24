package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface BoardService {
	// 자유게시판 게시글 목록
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
//	// 자유게시판 게시글 목록 관리자
//	public void adBoardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException;
//	
	// 자유게시판 게시글 상세페이지
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
		
	// 자유게시판 게시글 작성
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 자유게시판 게시글 삭제
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
		
	// 자유게시판 게시글 수정
	public void boardUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
		
	// 자유게시판 게시글 댓글목록
	public void boardCommentListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 자유게시판 게시글 댓글 작성
	public void boardCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
			
	// 자유게시판 게시글 댓글 수정
	public void boardCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 자유게시판 게시글 댓글 삭제
	public void boardCommentDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 자유게시판 게시글 복구 관리자
	public void adBoardRestoreAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
