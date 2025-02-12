package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface NoticeService {
	
	// 공지사항 목록
	public void noticeList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 공지사항 상세페이지
	public void noticeDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 공지사항 작성 처리
	public void noticeInsert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 공지사항 수정 화면
	public void noticeUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 공지사항 수정 처리
	public void noticeUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 공지사항 삭제 처리
	public void noticeDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
