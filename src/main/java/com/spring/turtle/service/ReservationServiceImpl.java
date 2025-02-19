package com.spring.turtle.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.turtle.dao.ReservationDAO;
import com.spring.turtle.dto.RevConsultDTO;
import com.spring.turtle.dto.UserDTO;
import com.spring.turtle.page.Paging10;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;
	
	// 회원 인증
	@Override
	public void checkUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service >>> checkUserAction");

		// userId와 userPw의 input값 저장
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		// 회원 조회 후 user 정보를 담기 위한 dto 생성
		
		// userPw 입력값이 있을 때 인증 진행
		if(userPw != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("userPw", userPw);
			
			// 회원 인증 결과 selectCnt에 저장 후 전달
			int selectCnt = dao.checkUserAction(map);
			
			// 회원 인증 성공 시 user 정보 불러오기
			if(selectCnt == 1) {
				UserDTO dto = dao.detailUserAction(userId);
				System.out.println(userId);
				model.addAttribute("dto", dto);
			}
			model.addAttribute("selectCnt", selectCnt);
		}
		model.addAttribute("userId", userId);
	}

	// 상담 예약 등록
	@Override
	public void insertRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service >>> insertRevConsult");
		
		// input값 불러오기
		String userId = request.getParameter("hiddenUserId");
		String userName = request.getParameter("hiddenUserName");
		String userHp = request.getParameter("hiddenUserHp");
		
		// 예약 날짜와 시간 값 받아서 Timestamp로 형변환
		String revDate = request.getParameter("hiddenRevDate");
		String revTime = request.getParameter("hiddenRevTime");
		String revConsultDate = revDate + " " + revTime + ":00.0";
		
		Timestamp ts = Timestamp.valueOf(revConsultDate);
		
		RevConsultDTO dto = new RevConsultDTO();
		
		dto.setUserId(userId);
		dto.setUserName(userName);
		dto.setUserHp(userHp);
		dto.setRevConsultDate(ts);
		
		int insertCnt = dao.insertRevConsult(dto);
		model.addAttribute("insertCnt", insertCnt);
		
	}
	
	// 상담 예약 상세 정보 조회
	@Override
	public void revConsultDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service >>> revConsultDetail");
		
		
	}

	// 상담 예약 수정(관리자)
	@Override
	public void modifyRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service >>> modifyRevConsult");		
	}

	// 상담 예약 삭제
	@Override
	public void deleteRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service >>> deleteRevConsult");
		
		int revConsultNo = Integer.parseInt(request.getParameter("revConsultNo"));
		System.out.println("revConsultNo >>>> " + revConsultNo);
		int deleteCnt = dao.deleteRevConsult(revConsultNo);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 상담 예약 목록
	@Override
	public void revConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("Service >>> revConsultList");	
		
		String pageNum = request.getParameter("pageNum");
		String userId = (String)request.getSession().getAttribute("sessionID");
		
		int total = dao.revConsultCnt(userId);
		
		Paging10 paging = new Paging10(pageNum);
		paging.setTotalCount(total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("userId", userId);
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		List<RevConsultDTO> list = dao.revConsultList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}

	// 상담 시간 체크
	@Override
	public void revConsultDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl >>> revConsultDateCheck");
		Date revDate = Date.valueOf(request.getParameter("revDate"));
		System.out.println(revDate);
		
		@SuppressWarnings("deprecation")
		int dayOfWeek = revDate.getDay();
		
		SimpleDateFormat simpleDateFormatting = new SimpleDateFormat("yy/MM/dd");
		String strDate = simpleDateFormatting.format(revDate);
		
		System.out.println("strDate : " + strDate);
		
		List<String> timeArr = dao.revConsultDateCheck(revDate);
		model.addAttribute("timeArr", timeArr);
		model.addAttribute("dayOfWeek", dayOfWeek);
		model.addAttribute("revDate", revDate);
	}

}
