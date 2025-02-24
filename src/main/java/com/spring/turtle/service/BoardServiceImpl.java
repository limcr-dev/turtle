package com.spring.turtle.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.turtle.dao.BoardDAOImpl;
import com.spring.turtle.dto.BoardCommentDTO;
import com.spring.turtle.dto.BoardDTO;
import com.spring.turtle.page.Paging10;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAOImpl dao;
	
	// 자유게시판 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardListAction()");
		
		String uri = request.getRequestURI();
		System.out.println("uri" + uri);
		String sessionType = "";
		
		if(request.getSession().getAttribute("sessionType") != null && uri.contains("adBoardList.ad")) {
			sessionType = (String) request.getSession().getAttribute("sessionType");
		}
		
		String pageNum = request.getParameter("pageNum");
		Paging10 paging = new Paging10(pageNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("sessionType", sessionType);
		
		int total = dao.boardCnt(map);
		
		System.out.println("total =" + total);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		List<BoardDTO> list = dao.boardList(map);
		
		System.out.println("list =" + list);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	
	// 자유게시판 게시글 상세페이지
	@Override
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardDetailAction()");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		BoardDTO dto = dao.getDetailBoard(boardNo);
		dao.plusViewBoard(boardNo);
		
		model.addAttribute("dto", dto);
	}
	
	// 자유게시판 게시글 작성
	@Override
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardInsertAction()");
		
		BoardDTO dto = new BoardDTO();
		
		dto.setBoardTitle(request.getParameter("boardTitle"));
		dto.setBoardContent(request.getParameter("boardContent"));
		dto.setBoardWriter((String)request.getSession().getAttribute("sessionID"));
		
		dao.insertBoard(dto);
	}

	// 자유게시판 게시글 삭제
	@Override
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardDeleteAction()");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		dao.deleteBoard(boardNo);
	}
	
	// 자유게시판 게시글 수정
	@Override
	public void boardUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardUpdateAction()");
		
		BoardDTO dto = new BoardDTO();
		int boardNo = Integer.parseInt(request.getParameter("hidden_boardNo"));
		dto.setBoardNo(boardNo);
		dto.setBoardTitle(request.getParameter("boardTitle"));
		dto.setBoardContent(request.getParameter("boardContent"));
		
		dao.updateBoard(dto);
		
		request.setAttribute("boardNo", boardNo);
	}
	
	// 자유게시판 댓글 목록
	@Override
	public void boardCommentListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardCommentListAction()");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		List<BoardCommentDTO> list = dao.boardCommentList(boardNo);
		
		System.out.println("boardNo" + boardNo);
		
		model.addAttribute("list", list);
	}
		
	// 자유게시판 게시글 댓글 작성
	@Override
	public void boardCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardCommentAddAction()");
		
		BoardCommentDTO dto = new BoardCommentDTO();
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		dto.setBoardNo(boardNo);
		dto.setB_comWriter((String) request.getSession().getAttribute("sessionID"));
		dto.setB_comContent(request.getParameter("b_comContent"));
		dto.setB_comType((String) request.getSession().getAttribute("sessionType"));
		
		int result = dao.insertBoardComment(dto);
		
		// 등록 성공시 댓글 갯수 증가
		if(result == 1) {
			dao.plusBoardCommentCnt(boardNo);
		}
	}

	// 자유게시판 게시글 댓글 수정
	@Override
	public void boardCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardCommentUpdateAction()");
		
		BoardCommentDTO dto = new BoardCommentDTO();
		int boardNo = Integer.parseInt(request.getParameter("hidden_boardNo"));
		dto.setB_comContent(request.getParameter("b_comContent_re"));
		dto.setB_comNo(Integer.parseInt(request.getParameter("hidden_b_comNo")));
		dto.setBoardNo(boardNo);
		
		System.out.println("dto" + dto);
		
		dao.updateBoardComment(dto);
		
		request.setAttribute("boardNo", boardNo);
	}
	
	// 자유게시판 게시글 댓글 삭제
	@Override
	public void boardCommentDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - boardCommentDeleteAction()");
		
		int b_comNo = Integer.parseInt(request.getParameter("b_comNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("b_comNo", b_comNo);
		map.put("boardNo", boardNo);
		
		int result = dao.deleteBoardComment(map);
		if(result == 1) {
			dao.minusBoardCommentCnt(boardNo);
		}
		request.setAttribute("boardNo", boardNo);
	}
	
	// 자유게시판 게시글 복구 관리자
	@Override
	public void adBoardRestoreAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("BoardServiceImpl - adBoardRestoreAction()");
		
		dao.adRestoreBoard(Integer.parseInt(request.getParameter("boardNo")));
	}
}
