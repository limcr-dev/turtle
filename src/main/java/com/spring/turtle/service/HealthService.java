package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface HealthService {
	
	// 헬스회원 목록
	public void healthListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// 헬스회원 등록시(Id 조회)
	public void IdCheckAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;

	//헬스 회원 등록
	public void healthInsertAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	//헬스회원 수정(상세내용)
	public void healthDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	//헬스회원 수정
	public void healthUpdateAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	//헬스회원 삭제
	public void healthDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
