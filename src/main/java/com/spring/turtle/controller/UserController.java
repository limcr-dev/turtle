package com.spring.turtle.controller;

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

import com.spring.turtle.service.UserServiceImpl;

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
	@RequestMapping("/loginAction.do")
	public String loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /loginAction.do >>>");
		
		service.loginAction(request, response, model);
		
		return "customer/mypage/loginAction";
	}
	
	// 마이페이지
	@RequestMapping("/mypage.do")
	public String mypage(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /mypage.do >>>");
		
		service.userDetail(request, response, model);
		
		return "customer/mypage/mypage";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /logout.do >>>");
		
		request.getSession().invalidate();
		
		return "common/main";
	}
	
	// 회원 수정 인증
	@RequestMapping("/modifyUser.do")
	public String modifyUser(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /modifyUser.do >>>");
		
		return "customer/mypage/modifyUser";
	}
	
	// 회원수정 -  상세페이지
	@RequestMapping("/modifyUserDetail.do")
	public String modifyUserDetail(HttpServletRequest request, HttpServletResponse response, Model model)
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
		String viewPage = request.getContextPath() +  "/mypage.do";
		response.sendRedirect(viewPage);
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
		
		return "customer/mypage/deleteUserAction";
	}
	
	// 관리자페이지
	@RequestMapping("/admin_main.do")
    public String admin_main() {
		logger.info("<<< url ==>  /admin_main.do >>>");
		
        return "admin/admin_main"; 
    }
	
	// Q&A
	@RequestMapping("/faq.do")
	public String faq() {
		logger.info("<<< url ==>  /faq.do >>>");
		return "board/faq";
	}
	
	// 챗봇
	@GetMapping("/chatbot")
    public String chatbotPage() {
        return "chatbot"; // chatbot.html 파일을 반환
    }
	
	// 예약 페이지로 이동
	@GetMapping("/reservation.do")
	public String reservation() {
		logger.info("<<< url ==>  /reservation.do >>>");
		
        return "reservation/reservation"; 
    }
	
	// 예약
	@GetMapping("/reservationAction.do")
	public String reservationAction() {
		logger.info("<<< url ==>  /admin_main.do >>>");
		
        return "admin/test_reservation_Action"; 
    }
	
	// 예약
	@GetMapping("/test.do")
	public String test() {
		logger.info("<<< url ==>  /test.do >>>");
		
        return "admin/test"; 
    }
	
	// 이메일중복확인
	@RequestMapping("/emailConfirmAction.do")
    public String emailConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /emailConfirmAction.do >>>");
		
		service.emailConfirmAction(request, response, model);
		
		return "customer/customer/emailConfirmAction"; 
    }
	
	// 이메일 인증 확인
	@RequestMapping("/emailAuthAction.do")
    public String emailAuthAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException{
		logger.info("<<< url ==>  /emailAuthAction.do >>>");
		
		return "customer/customer/emailAuthAction"; 
    }

	
	// ----------- 개발하면서 컨트롤러 분리 예정 ------------
	// 내부시설 페이지 이동
	@GetMapping("/facility.do")
	public String facility() {
		logger.info("<<< url ==>  /facility.do >>>");
		
        return "facility/facility"; 
    }
	
	// 상품 페이지 이동
	@GetMapping("/productList.do")
	public String productList() {
		logger.info("<<< url ==>  /productList.do >>>");
		
        return "product/diet"; 
    }
	
	// 프로그램 페이지 이동
	@GetMapping("/programList.do")
	public String programList() {
		logger.info("<<< url ==>  /programList.do >>>");
		
        return "program/programList"; 
    }
}
