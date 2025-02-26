package com.spring.turtle.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.turtle.dao.FaqDAOImpl;
import com.spring.turtle.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAOImpl dao;

	// FAQ 목록
	@Override
	public void faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - faqListAction()");
		
		String category = "";
		
		if(request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		else {
			category = "로그인관련";
		}
		List<FaqDTO> list = dao.faqList(category);
		model.addAttribute("list", list);
	}

	// FAQ 목록 관리자
	@Override
	public void adFaqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - adFaqListAction()");
		
		String category = "";
		
		if(request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		else {
			category = "";
		}
		
		List<FaqDTO> list = dao.adFaqList(category);
		model.addAttribute("list", list);
		model.addAttribute("category", category);
	}
	
	// FAQ 작성
	@Override
	public void adFaqInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - adFaqInsertAction()");
		String faqTitle =  request.getParameter("faqTitle");
		String faqContent = request.getParameter("faqContent");
		String faqType = request.getParameter("category");
		String faqWriter = (String)request.getSession().getAttribute("sessionID");
		
		FaqDTO dto = new FaqDTO();
		
		dto.setFaqTitle(faqTitle);
		dto.setFaqWriter(faqWriter);
		dto.setFaqType(faqType);
		dto.setFaqContent(faqContent);
		
		dao.adInsertFaq(dto);
	}
	// FAQ 상세페이지
	@Override
	public void adFaqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - adFaqDetailAction()");
		
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		FaqDTO dto = dao.getFaqDetail(faqNo);
		
		model.addAttribute("dto", dto);
	}
	
	// FAQ 수정
	@Override
	public void adFaqUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - adFaqUpdateAction()");
		
		FaqDTO dto = new FaqDTO();
		
		dto.setFaqTitle(request.getParameter("faqTitle"));
		dto.setFaqContent(request.getParameter("faqContent"));
		dto.setFaqType(request.getParameter("category"));
		dto.setFaqNo(Integer.parseInt(request.getParameter("hidden_faqNo")));
		
		dao.adUpdateFaq(dto);
	}

	// FAQ 삭제
	@Override
	public void adFaqDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - adFaqDeleteAction()");
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		
		dao.adDeleteFaq(faqNo);
	}
	
	// FAQ 복구
	@Override
	public void adFaqRestoreAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		System.out.println("FaqServiceImpl - adFaqRestoreAction()");
		int faqNo = Integer.parseInt(request.getParameter("faqNo"));
		
		dao.adRestoreFaq(faqNo);
	}
}
