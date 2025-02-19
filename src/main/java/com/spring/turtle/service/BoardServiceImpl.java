package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.turtle.dao.QnaDAOImpl;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private QnaDAOImpl dao;
	
	// 자유게시판 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - boardListAction()");
		
	}

	// 자유게시판 게시글 작성
	@Override
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - boardInsertAction()");
		
	}

	// 자유게시판 게시글 상세페이지
	@Override
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - boardDetailAction()");
		
	}

	// 자유게시판 게시글 삭제
	@Override
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - boardDeleteAction()");
		
	}

	// 자유게시판 게시글 댓글 작성
	@Override
	public void boardCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - boardCommentAddAction()");
		
	}

	// 자유게시판 게시글 댓글 수정
	@Override
	public void boardCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - boardCommentUpdateAction()");
		
	}

}
