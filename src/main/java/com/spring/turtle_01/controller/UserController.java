package com.spring.turtle_01.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.turtle_01.service.UserServiceImpl;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserServiceImpl service;
	
	// 첫페이지
	@RequestMapping("/main.do")
	public String main() {
		logger.info("<<< url ==>  /main.do >>>");
		return "common/main";
	}
	
	// 회원가입 화면
	@RequestMapping("/join.do")
	public String join() {
		logger.info("<<< url ==>  /join.do >>>");
		
		return "customer/customer/join";
	}
	
	// 아이디중복확인
	@RequestMapping("/idConfirmAction.do")
    public String idConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /idConfirmAction.do >>>");
		
		service.idConfirmAction(request, response, model);
		
		return "customer/customer/idConfirmAction"; 
    }
	
	// 주소찾기
	@RequestMapping("/jusoPopup.do")
	public String goPopup() {
		logger.info("<<< url ==>  /jusoPopup.do >>>");
		
		return "customer/customer/jusoPopup";
	}
	
	// 회원가입 처리
	@RequestMapping("/joinAction.do")
	public String joinAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /joinAction.do >>>");
		
		service.signInAction(request, response, model);
		
		return "customer/mypage/joinAction";
	}
	
	// 로그인 화면
	@RequestMapping("/login.do")
	public String login() {
		logger.info("<<< url ==>  /login.do >>>");
		return "customer/customer/login";
	}
	
	// 로그인 처리
	@RequestMapping("/logInAction.do")
	public String logInAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /logInAction.do >>>");
		
		service.logInAction(request, response, model);
		
		return "customer/mypage/logInAction";
	}
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /logout.do >>>");
		
		request.getSession().invalidate();
		
		return "common/main";
	}
		
	// 회원수정 -  상세페이지
	@RequestMapping("/modifyDetailAction.do")
	public String modifyDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /modifyDetailAction.do >>>");
		
		service.modifyDetailAction(request, response, model);
		
		return "customer/mypage/modifyUserDetail";
	}
	
	// 회원수정 처리
	@RequestMapping("/modifyUserAction.do")
	public String modifyUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /modifyUserAction.do >>>");
		
		service.modifyUserAction(request, response, model);
		
		return "customer/mypage/mypage";
	}
	
	// 회원 삭제 인증
	@RequestMapping("/deleteUser.do")
	public String deleteUser(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /deleteUser.do >>>");
		
		return "customer/mypage/deleteUser";
	}
	
	// 회원 삭제 처리
	@RequestMapping("/deleteUserAction.do")
	public String deleteUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /deleteUserAction.do >>>");
		
		service.deleteUserAction(request, response, model);
		
		return "customer/main";
	}
	
	// 챗봇
	@GetMapping("/chatbot")
    public String chatbotPage() {
        return "chatbot"; // chatbot.html 파일을 반환
    }
	
	// 내부 시설
	@GetMapping("/facility.do")
    public String facilityList() {
        return "facility/facility";
    }
	
	// 상품 목록
	@GetMapping("/productList.do")
    public String productList() {
        return "product/productList";
    }
	
	// 프로그램 목록
	@GetMapping("/programList.do")
    public String programList() {
        return "program/programList";
    }
	
	// 예약 페이지
	@GetMapping("/reservation.do")
    public String reservation() {
        return "reservation/reservation";
    }
	
}
