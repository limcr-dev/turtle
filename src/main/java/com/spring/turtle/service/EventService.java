package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface EventService {

	// 이벤트 목록
	public void eventList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 이벤트 상세페이지
	public void eventDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 이벤트 작성
	public void eventInsert(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 이벤트 수정
	public void eventUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 이벤트 수정처리
	public void eventUpdateAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 이벤트 삭제
	public void eventDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// ========================= 일반 =========================
	// 이벤트 목록
	public void eventList1(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
