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

import com.spring.turtle.dao.NoticeDAOImpl;
import com.spring.turtle.dto.NoticeDTO;
import com.spring.turtle.page.Paging10;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAOImpl dao;
	
	// ========================= 관리 =========================
	// 공지사항 목록
	@Override
	public void noticeList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - noticeList()");
		
		String pageNum = request.getParameter("pageNum");
		String noticeShow = request.getParameter("noticeShow");
		
		Paging10 paging = new Paging10(pageNum);
		int total = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (noticeShow != null && !noticeShow.isEmpty()) {
			map.put("noticeShow", noticeShow);
			// noticeShow에 따른 공지사항 갯수
			total = dao.noticeCntShow(map);
	    } else {
	    	// 전체 갯수
	    	total = dao.noticeCnt();
	    }

		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeDTO> list = dao.noticeList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("noticeShow", noticeShow);
	}

	// 공지사항 상세페이지
	@Override
	public void noticeDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - noticeDetail()");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		dao.plusReadCnt(noticeNo);
		
		NoticeDTO dto = new NoticeDTO();
		
		dto = dao.getNoticeDetail(noticeNo);
		
		model.addAttribute("dto", dto);
	}

	// 공지사항 작성 처리
	@Override
	public void noticeInsert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - noticeInsert()");
		
		NoticeDTO dto = new NoticeDTO();
		
		String noticeWriter = (String)request.getSession().getAttribute("sessionID");
		
		dto.setNoticeWriter(noticeWriter);
		dto.setNoticeTitle(request.getParameter("noticeTitle"));
		dto.setNoticeContent(request.getParameter("noticeContent"));
		
		dao.insertNotice(dto);
	}
	
	
	// 공지사항 수정 화면(상세 값 불러오기)
	@Override
	public void noticeUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - noticeUpdate()");
		
		NoticeDTO dto = new NoticeDTO();

		int noticeNo = Integer.parseInt(request.getParameter("hidden_noticeNo"));
		
		dto.setNoticeNo(noticeNo);
		dto.setNoticeTitle(request.getParameter("noticeTitle"));
		dto.setNoticeContent(request.getParameter("noticeContent"));
		
		dto = dao.getNoticeDetail(noticeNo);

		model.addAttribute("dto", dto);
	}


	// 공지사항 수정 처리
	@Override
	public void noticeUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - noticeUpdate()");
		
		NoticeDTO dto = new NoticeDTO();

		int noticeNo = Integer.parseInt(request.getParameter("hidden_noticeNo"));
		String noticeWriter = (String)request.getSession().getAttribute("sessionID");
		
		dto.setNoticeWriter(noticeWriter);
		dto.setNoticeTitle(request.getParameter("noticeTitle"));
		dto.setNoticeContent(request.getParameter("noticeContent"));
		dto.setNoticeNo(noticeNo);
		
		System.out.println("dto ===>" + dto);
		
		dao.updateNotice(dto);
	}

	// 공지사항 삭제 처리
	@Override
	public void noticeDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - noticeDeleteAction()");
		
		int noticeNo = Integer.parseInt(request.getParameter("hidden_noticeNo"));
		
		dao.deleteNotice(noticeNo);
	}
	
	// 공지사항 다중 삭제
	@Override
	public void noticeDelete(String[] noticeMul) {
		System.out.println("서비스 - noticeDelete()");
		
		dao.deleteNoticeSeveral(noticeMul);
	}
	// ========================= 관리 =========================
	
	// ========================= 일반 =========================
	// 공지사항 목록
	@Override
	public void noticeList1(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - noticeList1()");
		
		String pageNum = request.getParameter("pageNum");
		
		Paging10 paging = new Paging10(pageNum);
		int total = dao.noticeCnt();

		paging.setTotalCount(total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeDTO> list = dao.noticeList1(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
	// ========================= 일반 =========================
}
