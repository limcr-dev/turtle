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

import com.spring.turtle.service.QnaServiceImpl;

@Controller
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaServiceImpl service;
	
	String viewPage = "";
	
	// 1:1 문의 목록
	@RequestMapping("/qnaList.bo")
	public String qnaList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaList.bo >>>");
		service.qnaListAction(request, response, model);
		
		return "support/qna/qnaList";
	}
	// 1:1 문의 목록 관리자
	@RequestMapping("/adQnaList.ad")
	public String adQnaList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adQnaList.ad >>>");
		service.adQnaListAction(request, response, model);
		
		return "admin/support/qna/adQnaList";
	}
	// 1:1 상세페이지
	@RequestMapping("/qnaDetailAction.bo")
	public String qnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaDetailAction.bo >>>");
		service.qnaDetailAction(request, response, model);
		
		return "support/qna/qnaDetailAction";
	}
	// 1:1 상세페이지 관리자
	@RequestMapping("/adQnaDetailAction.ad")
	public String adQnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adQnaDetailAction.bo >>>");
		service.qnaDetailAction(request, response, model);
		
		return "admin/support/qna/adQnaDetailAction";
	}
	
	// 1대1문의 작성 페이지
	@RequestMapping("/qnaInsert.bo")
	public String qnaInsert(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaInsert.bo >>>");
		
		return "support/qna/qnaInsert";
	}	
	// 1대1문의 작성 페이지
	@RequestMapping("/qnaInsertAction.bo")
	public String qnaInsertAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaInsertAction.bo >>>");
		service.qnaInsertAction(request, response, model);
		viewPage = request.getContextPath() +  "/qnaList.bo";
		response.sendRedirect(viewPage);
		return "support/qna/qnaInsert";
	}
	// 1대1문의 댓글목록
	@RequestMapping("/qnaCommentList.bo")
	public String qnaCommentList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaCommentList.bo >>>");
		service.qnaCommentListAction(request, response, model);
		
		return "support/qna/qnaCommentList";
	}	
	// 1대1문의 댓글목록 댓글관리자
	@RequestMapping("/adQnaCommentList.ad")
	public String adQnaCommentList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adQnaDetailAction.bo >>>");
		service.qnaCommentListAction(request, response, model);
		
		return "admin/support/qna/adQnaCommentList";
	}
	// 1대1문의 댓글 추가 
	@RequestMapping("/qnaCommentInsert.bo")
	public String qnaCommentInsert(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaCommentInsert.bo >>>");
		service.qnaCommentAddAction(request, response, model);
		
		return "support/qna/qnaDetailAction";
	}	
	// 1대1문의 수정 페이지이동
	@RequestMapping("/qnaUpdate.bo")
	public String qnaUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaUpdate.bo >>>");
		service.qnaDetailAction(request, response, model);
		
		return "support/qna/qnaUpdate";
	}	
	
	// 1대1문의 수정
	@RequestMapping("/qnaUpdateAction.bo")
	public String qnaUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaUpdateAction.bo >>>");
		service.qnaUpdateAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/qnaList.bo";
		response.sendRedirect(viewPage);
		return null;
	}	
	
	// 1대1문의 삭제
	@RequestMapping("/qnaDelete.bo")
	public String qnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaDelete.bo >>>");
		service.qnaDeleteAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/qnaList.bo";
		response.sendRedirect(viewPage);
		return null;
	}	
	
	// 1대1문의 삭제 관리자
	@RequestMapping("/adQnaDelete.ad")
	public String adQnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adQnaDelete.ad >>>");
		service.qnaDeleteAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/adQnaList.ad";
		response.sendRedirect(viewPage);
		return null;
	}	
	// 1대1문의 댓글 삭제
	@RequestMapping("/qnaCommentDelete.bo")
	public String qnaCommentDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaCommentDeleteAction.bo >>>");
		
		service.qnaCommentDelete(request, response, model);
		int qnaNo = (int) request.getAttribute("qnaNo");
		viewPage = request.getContextPath() +  "/qnaDetailAction.bo?qnaNo=" + qnaNo;
		response.sendRedirect(viewPage);
		return null;
	}
	// 1대1문의 댓글 삭제 관리자
	@RequestMapping("/adQnaCommentDelete.ad")
	public String adQnaCommentDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adQnaCommentDeleteAction.ad >>>");
		
		service.qnaCommentDelete(request, response, model);
		int qnaNo = (int) request.getAttribute("qnaNo");
		viewPage = request.getContextPath() +  "/adQnaDetailAction.ad?qnaNo=" + qnaNo;
		response.sendRedirect(viewPage);
		return null;
	}	
	// 1대1문의 댓글 수정
	@RequestMapping("/qnaCommentUpdate.bo")
	public String qnaCommentUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /qnaCommentUpdate.bo >>>");
		
		service.qnaCommentUpdateAction(request, response, model);
		
		int qnaNo = (int) request.getAttribute("qnaNo");
		viewPage = request.getContextPath() +  "/qnaDetailAction.bo?qnaNo=" + qnaNo;
		response.sendRedirect(viewPage);
		
		return null;
	}
	// 1대1문의 댓글 수정 관리자
	@RequestMapping("/adQnaCommentUpdate.ad")
	public String adQnaCommentUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adQnaCommentUpdate.ad >>>");
		
		service.qnaCommentUpdateAction(request, response, model);
		
		int qnaNo = (int) request.getAttribute("qnaNo");
		viewPage = request.getContextPath() +  "/adQnaDetailAction.ad?qnaNo=" + qnaNo;
		response.sendRedirect(viewPage);
		
		return null;
	}	
	
	// 공지사항 목록
	@RequestMapping("/noticeList.bo")
	public String noticeList() {
		logger.info("<<< url ==>  /noticeList.bo >>>");
		return "support/notice/noticeList";
	}
		
	// 공지사항 상세 페이지
	@RequestMapping("/noticeDetail.bo")
	public String noticeDetail() {
		logger.info("<<< url ==>  /noticeDetail.bo >>>");
		return "support/notice/noticeDetail";
	}
	
	// 이벤트 목록
	@RequestMapping("/eventList.bo")
	public String eventList() {
		logger.info("<<< url ==>  /eventList.bo >>>");
		return "support/event/eventList";
	}
	
	// 자유게시판 목록
	@RequestMapping("/boardList.bo")
	public String boardList() {
		logger.info("<<< url ==>  /boardList.bo >>>");
		return "support/board/boardList";
	}
	
	// 자유게시판 목록
	@RequestMapping("/boardDetail.bo")
	public String boarDetail() {
		logger.info("<<< url ==>  /boardDetail.bo >>>");
		return "support/board/boardDetail";
	}
		
	// FAQ 목록
	@RequestMapping("/faqList.bo")
	public String faqList() {
		logger.info("<<< url ==> /faqList.bo >>>");
		return "support/faq/faqList";
	}

}
