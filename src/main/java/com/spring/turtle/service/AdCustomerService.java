package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface AdCustomerService {
	
	// 회원 목록
	public void customerList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 정보 조회
	public void customerDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 관리자 지정
	public void userToAdmin(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 삭제
	public void customerDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
