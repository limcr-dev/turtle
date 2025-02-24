package com.spring.turtle.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.turtle.dao.EventDAOImpl;
import com.spring.turtle.dto.EventDTO;
import com.spring.turtle.page.Paging10;
import com.spring.turtle.page.Paging9;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	private EventDAOImpl dao;

	// 이벤트 목록
	@Override
	public void eventList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - eventList()");
		
		String pageNum = request.getParameter("pageNum");
		String eventShow = request.getParameter("eventShow");
		
		Paging10 paging = new Paging10(pageNum);
		int total = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (eventShow != null && !eventShow.isEmpty()) {
			map.put("eventShow", eventShow);
			// noticeShow에 따른 공지사항 갯수
			total = dao.eventCntShow(map);
	    } else {
	    	// 전체 갯수
	    	total = dao.eventCnt();
	    }
		
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		List<EventDTO> list = dao.eventList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("eventShow", eventShow);
	}
	
	// 이벤트 상세페이지
	@Override
	public void eventDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - eventDetail()");
		
		int eventNo = Integer.parseInt(request.getParameter("eventNo"));
		
		dao.plusReadCnt(eventNo);
		
		EventDTO dto = new EventDTO();
		
		dto = dao.getEventDetail(eventNo);
		
		model.addAttribute("dto", dto);
	}

	// 이벤트 작성
	@Override
	public void eventInsert(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - eventInsert()");
		
		MultipartFile file = request.getFile("eventImg");
		
		// input 경로
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/");	// 폴더 생성
		String realDir = "D:\\DEV\\workspace_team_pj\\team_pj\\turtle\\src\\main\\webapp\\resources\\upload\\";
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename())); 
			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
				
			EventDTO dto = new EventDTO();
			
			String eventWriter = (String)request.getSession().getAttribute("sessionID");
			String eventImage = "/turtle/resources/upload/" + file.getOriginalFilename();
			String eventTitle = request.getParameter("eventTitle");
			
			dto.setEventWriter(eventWriter);
			dto.setEventTitle(eventTitle);
			dto.setEventStartDate(Date.valueOf(request.getParameter("eventStartDate")));
			dto.setEventEndDate(Date.valueOf(request.getParameter("eventEndDate")));
			dto.setEventImage(eventImage);
			
			dao.insertEvent(dto);
			
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			if(fis != null) fis.close();
			if(fos != null) fos.close();
		}
	}

	// 이벤트 수정
	@Override
	public void eventUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - eventUpdate()");
		
		EventDTO dto = new EventDTO();

		int eventNo = Integer.parseInt(request.getParameter("hidden_eventNo"));
		
		dto.setEventNo(eventNo);
//		dto.setEventTitle(request.getParameter("eventTitle"));
//		dto.setEventStartDate(Date.valueOf(request.getParameter("eventStartDate")));
//		dto.setEventEndDate(Date.valueOf(request.getParameter("eventEndDate")));
//		dto.setEventImage(request.getParameter("eventImage"));
		
		dto = dao.getEventDetail(eventNo);

		model.addAttribute("dto", dto);
		
	}
	
	// 이벤트 수정처리
	@Override
	public void eventUpdateAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - eventUpdateAction()");
		
		MultipartFile file = request.getFile("eventImg");
		
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/");	// 폴더 생성
		String realDir = "D:\\DEV\\workspace_team_pj\\team_pj\\turtle\\src\\main\\webapp\\resources\\upload\\";
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename())); 
				fis = new FileInputStream(saveDir + file.getOriginalFilename());
				fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
			
				EventDTO dto = new EventDTO();
			
				int eventNo = Integer.parseInt(request.getParameter("hidden_eventNo"));
				String eventWriter = (String)request.getSession().getAttribute("sessionID");
				String eventImage = "/turtle/resources/upload/" + file.getOriginalFilename();
				
				dto.setEventWriter(eventWriter);
				dto.setEventTitle(request.getParameter("eventTitle"));
				dto.setEventStartDate(Date.valueOf(request.getParameter("eventStartDate")));
				dto.setEventEndDate(Date.valueOf(request.getParameter("eventEndDate")));
				dto.setEventImage(eventImage);
				dto.setEventNo(eventNo);
				System.out.println("dto1111 >>>>" + dto);
				
				dao.updateEvent(dto);
			
				System.out.println("dto2222222222 >>>>" + dto);
			} catch(IOException e) {
				e.printStackTrace();
			} finally {
				if(fis != null) fis.close();
				if(fos != null) fos.close();
			}
		}
	}

	// 이벤트 삭제
	@Override
	public void eventDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - eventDelete()");
		
		int eventNo = Integer.parseInt(request.getParameter("hidden_eventNo"));
		
		dao.deleteEvent(eventNo);
	}
	
	// ========================= 일반 =========================
	// 이벤트 목록
	@Override
	public void eventList1(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - eventList1()");
		
		String pageNum = request.getParameter("pageNum");
		
		Paging9 paging = new Paging9(pageNum);
		int total = dao.eventCnt();
		
		paging.setTotalCount(total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		List<EventDTO> list = dao.eventList1(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}
}
