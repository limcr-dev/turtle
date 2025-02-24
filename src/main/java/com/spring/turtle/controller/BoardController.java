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

import com.spring.turtle.service.BoardServiceImpl;

@Controller
public class BoardController {

private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardServiceImpl service;
	
	String viewPage = "";
	
	// 자유게시판 목록
	@RequestMapping("/boardList.bo")
	public String boardList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardList.ad >>>");
		service.boardListAction(request, response, model);
		
		return "support/board/boardList";
	}	
	
	// 자유게시판 목록 관리자
	@RequestMapping("/adBoardList.ad")
	public String adBoardList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adBoardList.ad >>>");
		service.boardListAction(request, response, model);
		
		return "admin/support/board/adBoardList";
	}	
	
	// 자유게시판 상세페이지
	@RequestMapping("/boardDetail.bo")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardDetail.ad >>>");
		service.boardDetailAction(request, response, model);
		
		return "support/board/boardDetail";
	}	
	
	// 자유게시판 상세페이지 관리자
	@RequestMapping("/adBoardDetail.ad")
	public String adBoardDetail(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adBoardDetail.ad >>>");
		service.boardDetailAction(request, response, model);
		
		return "admin/support/board/adBoardDetailAction";
	}	
	
	// 자유게시판 작성하기 페이지 이동
	@RequestMapping("/boardInsert.bo")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardInsert.bo >>>");
		
		return "support/board/boardInsert";
	}	
	
	// 자유게시판 작성하기 
	@RequestMapping("/boardInsertAction.bo")
	public String boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardInsertAction.bo >>>");
		service.boardInsertAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/boardList.bo";
		response.sendRedirect(viewPage);
		
		return null;
	}	
		
	// 자유게시판 삭제하기 
	@RequestMapping("/boardDelete.bo")
	public String boardDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardDelete.bo >>>");
		service.boardDeleteAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/boardList.bo";
		response.sendRedirect(viewPage);
		
		return null;
	}
	
	// 자유게시판 삭제하기 관리자 
	@RequestMapping("/adBoardDelete.ad")
	public String adBoardDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adBoardDelete.bo >>>");
		service.boardDeleteAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/adBoardList.ad";
		response.sendRedirect(viewPage);
		
		return null;
	}	
	
	// 자유게시판 수정페이지 이동
	@RequestMapping("/boardUpdate.bo")
	public String boardUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardUpdate.bo >>>");
		service.boardDetailAction(request, response, model);
		
		return "support/board/boardUpdate";
	}
	
	// 자유게시판 수정처리
	@RequestMapping("/boardUpdateAction.bo")
	public String boardUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardUpdateAction.bo >>>");
		
		service.boardUpdateAction(request, response, model);
		
		int boardNo = (int) request.getAttribute("boardNo");
		
		viewPage = request.getContextPath() +  "/boardDetail.bo?boardNo=" + boardNo;
		response.sendRedirect(viewPage);
		
		return null;
	}
	
	// 자유게시판 댓글목록
	@RequestMapping("/boardCommentList.bo")
	public String boardCommentList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardCommentList.bo >>>");
		service.boardCommentListAction(request, response, model);
		
		return "support/board/boardCommentList";
	}
	
	// 자유게시판 댓글목록 관리자
	@RequestMapping("/adBoardCommentList.ad")
	public String adBoardCommentList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adBoardCommentList.bo >>>");
		service.boardCommentListAction(request, response, model);
		
		return "admin/support/board/adBoardCommentList";
	}
		
	// 자유게시판 댓글작성
	@RequestMapping("/boardCommentInsert.bo")
	public String boardCommentInsert(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardCommentInsert.bo >>>");
		service.boardCommentAddAction(request, response, model);
		
		return "support/board/boardDetail";
	}
	
	// 자유게시판 댓글수정
	@RequestMapping("/boardCommentUpdate.bo")
	public String boardCommentUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardCommentUpdate.bo >>>");
		
		service.boardCommentUpdateAction(request, response, model);
		
		int boardNo = (int) request.getAttribute("boardNo");
		
		viewPage = request.getContextPath() +  "/boardDetail.bo?boardNo=" + boardNo;
		response.sendRedirect(viewPage);
		
		return "support/board/boardDetail";
	}	
	
	// 자유게시판 댓글수정 관리자
	@RequestMapping("/adBoardCommentUpdate.ad")
	public String adBoardCommentUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adBoardCommentUpdate.ad >>>");
		
		service.boardCommentUpdateAction(request, response, model);
		
		int boardNo = (int) request.getAttribute("boardNo");
		
		viewPage = request.getContextPath() +  "/adBoardDetail.ad?boardNo=" + boardNo;
		response.sendRedirect(viewPage);
		
		return null;
	}	
	
	// 자유게시판 댓글삭제
	@RequestMapping("/boardCommentDelete.bo")
	public String boardCommentDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /boardCommentDelete.bo >>>");
		
		service.boardCommentDeleteAction(request, response, model);
		
		int boardNo = (int) request.getAttribute("boardNo");
		
		viewPage = request.getContextPath() +  "/boardDetail.bo?boardNo=" + boardNo;
		response.sendRedirect(viewPage);
		
		return null;
	}
	
	// 자유게시판 댓글삭제
	@RequestMapping("/adBoardCommentDelete.ad")
	public String adBoardCommentDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adBoardCommentDelete.ad >>>");
		
		service.boardCommentDeleteAction(request, response, model);
		
		int boardNo = (int) request.getAttribute("boardNo");
		
		viewPage = request.getContextPath() +  "/adBoardDetail.ad?boardNo=" + boardNo;
		response.sendRedirect(viewPage);
		
		return null;
	}
	
	// 자유게시판 게시글 복구 관리자
	@RequestMapping("/adBoardRestore.ad")
	public String adBoardRestore(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /adBoardRestore.ad >>>");
		service.adBoardRestoreAction(request, response, model);
		
		viewPage = request.getContextPath() +  "/adBoardList.ad";
		response.sendRedirect(viewPage);
		
		return null;
	}
}
