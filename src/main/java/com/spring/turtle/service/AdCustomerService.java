package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface AdCustomerService {
	
	// 회원 목록
	public void customerList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 정보 조회
	public void customerDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 트레이너 지정
	public void userToTrainer(String[] userIds)
			throws ServletException, IOException;
	
	// 회원 관리자 지정
	public void userToAdmin(String[] userIds)
			throws ServletException, IOException;
	
	// 회원 지정
	public void updateCustomer(String[] userIds)
			throws ServletException, IOException;
	
	// 회원 삭제
	public void customerDelete(String[] userIds)
			throws ServletException, IOException;
	
	// 회원 복구
	public void customerRestore(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
