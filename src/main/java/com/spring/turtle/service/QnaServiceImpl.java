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

import com.spring.turtle.dao.QnaDAOImpl;
import com.spring.turtle.dto.QnaCommentDTO;
import com.spring.turtle.dto.QnaDTO;
import com.spring.turtle.page.Paging10;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAOImpl dao;
	
	// 1대1문의 목록
	@Override
	public void qnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaListAction()");

		String pageNum = request.getParameter("pageNum");
		Paging10 paging = new Paging10(pageNum);
		
		String qnaWriter = "";
		String sessionType = "";
		if(request.getSession().getAttribute("sessionID") != null) {
			qnaWriter = (String) request.getSession().getAttribute("sessionID");
		}
		if(request.getSession().getAttribute("sessionType") != null) {
			
			sessionType = (String) request.getSession().getAttribute("sessionType");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("qnaWriter", qnaWriter);
		map.put("sessionType", sessionType);
		
		int total = dao.qnaCnt(map);
		
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		System.out.println("sessionType : " + sessionType);
		if(sessionType.equals("admin") || sessionType.equals("trainer")) {
			map.put("statusType", "");
			List<QnaDTO> list = dao.qnaListAdmin(map);
			model.addAttribute("list", list);
		}
		else {
			List<QnaDTO> list = dao.qnaList(map);
			model.addAttribute("list", list);
		}
		model.addAttribute("paging", paging);
	}

	// 1대1문의 목록 관리자
	@Override
	public void adQnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaListAction()");
		
		String pageNum = request.getParameter("pageNum");
		Paging10 paging = new Paging10(pageNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		String statusType = "";
		if(request.getParameter("statusType") != null) {
			statusType = request.getParameter("statusType");
		}
		map.put("statusType", statusType);
		
		int total = dao.adQnaCnt(map);
		System.out.println("total" + total);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		System.out.println("statusType" + statusType);
		map.put("start", start);
		map.put("end", end);
		
		
		List<QnaDTO> list = dao.qnaListAdmin(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("statusType", statusType);
	}
	// 1대1문의 상세페이지
	@Override
	public void qnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaDetailAction()");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		QnaDTO dto = dao.getQnaDetail(qnaNo);
		model.addAttribute("dto", dto);
	}
	
	// 1대1문의 작성
	@Override
	public void qnaInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaInsertAction()");
		
		QnaDTO dto = new QnaDTO();
		dto.setQnaWriter((String) request.getSession().getAttribute("sessionID"));
		dto.setQnaTitle(request.getParameter("qnaTitle"));
		dto.setQnaContent(request.getParameter("qnaContent"));
		
		int result = dao.insertQna(dto);
		model.addAttribute("result", result);
	}
	
	// 1대1문의 수정
	public void qnaUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("SupportServiceImpl - qnaUpdateAction()");
		
		QnaDTO dto = new QnaDTO();
		dto.setQnaWriter((String) request.getSession().getAttribute("sessionID"));
		dto.setQnaNo(Integer.parseInt(request.getParameter("qnaNo")));
		dto.setQnaTitle(request.getParameter("qnaTitle"));
		dto.setQnaContent(request.getParameter("qnaContent"));
		
		dao.qnaUpdate(dto);
	}
		
	// 1대1문의 삭제
	@Override
	public void qnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaDeleteAction()");
		
		int num = Integer.parseInt(request.getParameter("qnaNo"));
		
		dao.deleteQna(num);
	}
	
	// 1대1문의 댓글 목록
	@Override
	public void qnaCommentListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaCommentListAction()");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		List<QnaCommentDTO> list = dao.qnaCommentList(qnaNo);
		model.addAttribute("list", list);
	}
	
	// 1대1문의 댓글 작성
	@Override
	public void qnaCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaCommentAddAction()");
		
		QnaCommentDTO dto = new QnaCommentDTO();
		
		dto.setQnaNo(Integer.parseInt(request.getParameter("qnaNo")));
		dto.setQ_comWriter((String) request.getSession().getAttribute("sessionID"));
		dto.setQ_comContent(request.getParameter("q_comContent"));
		
		String sessionType = (String) request.getSession().getAttribute("sessionType");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num",Integer.parseInt(request.getParameter("qnaNo")));
		
		if(sessionType.equals("admin") || sessionType.equals("trainer")){
			map.put("qnaStatus", "답변완료");
			dto.setQ_comWriter("관리자");
			dao.changeQnaCommentStatus(map);
		}
		if(sessionType.equals("user")){
			map.put("qnaStatus", "추가질문");
			dao.changeQnaCommentStatus(map);
		}
		dao.insertQnaComment(dto);
	}

	// 1대1문의 댓글 수정
	@Override
	public void qnaCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - qnaCommentUpdateAction()");
		
		QnaCommentDTO dto = new QnaCommentDTO();
		int qnaNo = Integer.parseInt(request.getParameter("hidden_qnaNo"));
		dto.setQ_comNo(Integer.parseInt(request.getParameter("hidden_q_comNo")));
		dto.setQnaNo(qnaNo);
		dto.setQ_comContent(request.getParameter("q_comContent_re"));
		System.out.println("dto " + dto);
		dao.updateQnaComment(dto);
		
		request.setAttribute("qnaNo", qnaNo);
	}
	// 1대1문의 댓글 삭제
	@Override
	public void qnaCommentDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("SupportServiceImpl - qnaCommentDelete()");
		int q_comNo = Integer.parseInt(request.getParameter("q_comNo"));
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		dao.DeleteQnaComment(q_comNo);
		
		// 관리자 댓글 삭제 시 진행중으로 다시 변경
		String sessionType = (String) request.getSession().getAttribute("sessionType");
		
		if(sessionType.equals("admin") || sessionType.equals("trainer")){
			String sessionID = ((String) request.getSession().getAttribute("sessionID"));
			String q_comWriter = request.getParameter("q_comWriter");
			
			// 관리자 댓글 삭제시에만
			if(q_comWriter.equals("관리자")) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("num",Integer.parseInt(request.getParameter("qnaNo")));
				map.put("qnaStatus", "진행중");
				
				dao.changeQnaCommentStatus(map);
			}
		}
		request.setAttribute("qnaNo", qnaNo);
	}

	// ------공지사항-------
	// 공지 목록
	@Override
	public void noticeListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - noticeListAction()");
		
	}
	// 공지 상세페이지
	@Override
	public void noticeDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - noticeDetailAction()");
		
	}


	// ------이벤트------
	// 이벤트 목록
	@Override
	public void eventListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - eventListAction()");
		
	}

	// 이벤트 상세페이지
	@Override
	public void eventDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - eventDetailAction()");
		
	}


	// ------FAQ------
	// FAQ 목록
	@Override
	public void faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - faqListAction()");
		
	}

	// FAQ 상세내용
	@Override
	public void faqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - faqDetailAction()");
		
	}

	
	// ------자유게시판------
	// 자유게시판 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - boardListAction()");
		
	}

	// 자유게시판 게시글 작성
	@Override
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - boardInsertAction()");
		
	}

	// 자유게시판 게시글 상세페이지
	@Override
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - boardDetailAction()");
		
	}

	// 자유게시판 게시글 삭제
	@Override
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - boardDeleteAction()");
		
	}

	// 자유게시판 게시글 댓글 작성
	@Override
	public void boardCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - boardCommentAddAction()");
		
	}

	// 자유게시판 게시글 댓글 수정
	@Override
	public void boardCommentUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("SupportServiceImpl - boardCommentUpdateAction()");
		
	}

}
