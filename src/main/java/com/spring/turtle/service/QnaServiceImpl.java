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
		System.out.println("QnaServiceImpl - qnaListAction()");

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
		System.out.println("QnaServiceImpl - qnaListAction()");
		
		String pageNum = request.getParameter("pageNum");
		Paging10 paging = new Paging10(pageNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		String statusType = "";
		if(request.getParameter("statusType") != null) {
			statusType = request.getParameter("statusType");
		}
		map.put("statusType", statusType);
		
		int total = dao.adQnaCnt(map);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
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
		System.out.println("QnaServiceImpl - qnaDetailAction()");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		QnaDTO dto = dao.getQnaDetail(qnaNo);
		model.addAttribute("dto", dto);
	}
	
	// 1대1문의 작성
	@Override
	public void qnaInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - qnaInsertAction()");
		
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
		System.out.println("QnaServiceImpl - qnaUpdateAction()");
		
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
		System.out.println("QnaServiceImpl - qnaDeleteAction()");
		
		int num = Integer.parseInt(request.getParameter("qnaNo"));
		
		dao.deleteQna(num);
	}
	
	// 1대1문의 댓글 목록
	@Override
	public void qnaCommentListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - qnaCommentListAction()");
		
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		List<QnaCommentDTO> list = dao.qnaCommentList(qnaNo);
		model.addAttribute("list", list);
	}
	
	// 1대1문의 댓글 작성
	@Override
	public void qnaCommentAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - qnaCommentAddAction()");
		
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
		System.out.println("QnaServiceImpl - qnaCommentUpdateAction()");
		
		QnaCommentDTO dto = new QnaCommentDTO();
		int qnaNo = Integer.parseInt(request.getParameter("hidden_qnaNo"));
		dto.setQ_comNo(Integer.parseInt(request.getParameter("hidden_q_comNo")));
		dto.setQnaNo(qnaNo);
		dto.setQ_comContent(request.getParameter("q_comContent_re"));
		dao.updateQnaComment(dto);
		
		request.setAttribute("qnaNo", qnaNo);
	}
	// 1대1문의 댓글 삭제
	@Override
	public void qnaCommentDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("QnaServiceImpl - qnaCommentDelete()");
		int q_comNo = Integer.parseInt(request.getParameter("q_comNo"));
		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		dao.DeleteQnaComment(q_comNo);
		
		// 관리자 댓글 삭제 시 진행중으로 다시 변경
		String sessionType = (String) request.getSession().getAttribute("sessionType");
		
		if(sessionType.equals("admin") || sessionType.equals("trainer")){
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
	// 1대1문의 복구
	@Override
	public void adQnaRestoreAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("QnaServiceImpl - adQnaRestoreAction()");

		int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
		
		dao.adRestoreQna(qnaNo);
	}
}