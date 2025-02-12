package com.spring.turtle.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface UserService {
	
	// ID 중복확인 처리
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
		
	// 회원가입처리
	public void signInAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 로그인처리 (회원정보인증)
	public void loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원정보 인증후 상세페이지
	public void modifyDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 상세정보 불러오기(mypage)
	public void userDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원정보 수정 처리
	public void modifyUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원정보 인증후 탈퇴 처리
	public void deleteUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

}
