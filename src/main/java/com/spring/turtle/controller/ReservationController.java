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
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.turtle.service.ReservationService;

@Controller
public class ReservationController {

	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService service;
	
	// ------------- 상담 예약 ----------------
	// 상담 예약 페이지(사용자)
	@RequestMapping("/revConsult.do")
	public String revConsult() {
		logger.info("<<< url ==>  /revConsult.ad >>>");
		return "reservation/revConsult";
	}
	
	// 회원 인증(사용자)
	@RequestMapping("/revConsultCheckUser.do")
	public String revConsultCheckUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultCheckUser.ad >>>");
		
		service.revConsultCheckUser(request, response, model);
		return "reservation/revConsultCheckUser";
	}
	
	// 상담 예약 가능한 날짜 불러오기(사용자)
	@RequestMapping("/revConsultDateCheck.do")
	public String revDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDateCheck.ad >>>");
		
		service.revConsultDateCheck(request, response, model);
		
		return "reservation/revConsultTime";
	}
	
	// 예약 등록(사용자)
	@RequestMapping("/revConsultInsert.do")
	public String revConsultInsert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDateCheck.ad >>>");
		
		service.insertRevConsult(request, response, model);
		
		return "reservation/revConsultInsert";
	}	
	
	// 상담 예약 목록(사용자)
	@RequestMapping("/revConsultList.do")
	public String revConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultList.ad >>>");
		
		service.revConsultList(request, response, model);
		
		return "reservation/revConsultList";
	}
	
	// 상담 예약 취소(사용자)
	@RequestMapping("/revConsultDelete.do")
	public String revConsultDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDelete.ad >>>");
		
		service.deleteRevConsult(request, response, model);
		
		return "reservation/revConsultDelete";
	}
	
	// 예약 목록(관리자)
	@RequestMapping("/adRevConsultList.ad")
	public String adReservationList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevConsultList.ad >>>");
		
		service.adRevConsultList(request, response, model);
		return "admin/reservation/adRevConsultList";
	}
	
	// 상담 예약 상세 페이지(관리자)
	@RequestMapping("/adRevConsultDetail.ad")
	public String adRevConsultDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevConsultDetail.ad >>>");
		
		service.adRevConsultDetail(request, response, model);
		return "admin/reservation/adRevConsultDetail";
	}
	
	// 상담 예약 수정(관리자)
	@RequestMapping("/adRevConsultUpdate.ad")
	public String adRevConsultUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevConsultUpdate.ad >>>");
		
		service.adRevConsultUpdate(request, response, model);
		return "admin/reservation/adRevConsultUpdate";
	}
	
	// 상담 예약 취소(관리자)
	@RequestMapping("/adRevConsultDelete.ad")
	public String adRevConsultDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevConsultDelete.ad >>>");
		
		service.deleteRevConsult(request, response, model);
		
		return "admin/reservation/adRevConsultDelete";
	}
	
	// -------------- PT 예약 ----------------
	// PT 예약 페이지(사용자)
	@RequestMapping("/revPT.do")
	public String revPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revPT.do >>>");
		
		service.checkUserPTCount(request, response, model);
		return "reservation/revPT";
	}
	
	// PT 회원 인증
	@RequestMapping("/revPTCheckUser.do")
	public String revPTCheckUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revPTCheckUser.ad >>>");
		
		service.revPTCheckUser(request, response, model);
		return "reservation/revPTCheckUser";
	}
	
	// 상담 예약 가능한 날짜 불러오기(사용자)
	@RequestMapping("/revPTDateCheck.do")
	public String revPTDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDateCheck.ad >>>");
		
		service.revPTDateCheck(request, response, model);
		
		return "reservation/revPTTime";
	}
		
	// 예약 등록(사용자)
	@RequestMapping("/revPTInsert.do")
	public String revPTAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revPTInsert.ad >>>");
		
		service.insertRevPT(request, response, model);
		
		return "reservation/revPTInsert";
	}	
	
	// 상담 예약 목록(사용자)
	@RequestMapping("/revPTList.do")
	public String revPTList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revPTList.ad >>>");
		
		service.revPTList(request, response, model);
		
		return "reservation/revPTList";
	}
	
	// PT 상태 완료로 변경(사용자)
	@RequestMapping("/revPTComplete.do")
	public String revConsultApprove(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /completeRevPT.do >>>");
		
		service.completeRevPT(request, response, model);
		return "reservation/revPTComplete";
	}
	
	// PT 예약 취소(사용자)
	@RequestMapping("/revPTDelete.do")
	public String revPTDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /revConsultDelete.ad >>>");
		
		service.deleteRevPT(request, response, model);
		
		return "reservation/revPTDelete";
	}
	
	// PT 예약 목록(관리자)
	@RequestMapping("/adRevPTList.ad")
	public String adRevPTList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevPTList.ad >>>");
		
		service.adRevPTList(request, response, model);
		
		return "admin/reservation/adRevPTList";
	}
	
	// PT 예약 상세 페이지(관리자)
	@RequestMapping("/adRevPTDetail.ad")
	public String adRevPTDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevPTDetail.ad >>>");
		
		service.adRevPTDetail(request, response, model);
		return "admin/reservation/adRevPTDetail";
	}
	
	// PT 예약 수정(관리자)
	@RequestMapping("/adRevPTUpdate.ad")
	public String adRevPTUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevPTUpdate.ad >>>");
		
		service.adRevPTUpdate(request, response, model);
		return "admin/reservation/adRevPTUpdate";
	}
	
	// PT 상태 완료로 변경(관리자)
	@RequestMapping("/adRevPTComplete.ad")
	public String adRevPTComplete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adRevPTComplete.ad >>>");
		
		service.completeAdRevPT(request, response, model);
		return "admin/reservation/adRevPTComplete";
	}
}
