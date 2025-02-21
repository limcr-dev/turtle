package com.spring.turtle.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
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
import com.spring.turtle.dto.RevPTDTO;
import com.spring.turtle.page.Paging10;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;
	
	// ---------------- 상담 예약 ------------------
	// 회원 인증(사용자)
	@Override
	public void revConsultCheckUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - checkUserAction");

		// userId와 userPw의 input값 저장
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		// userPw 입력값이 있을 때 인증 진행
		if(userPw != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("userPw", userPw);
			
			// 회원 인증 결과 selectCnt에 저장 후 전달
			int selectCnt = dao.revConsultCheckUser(map);
			
			// 회원 인증 성공 시 user 정보 불러오기
			if(selectCnt == 1) {
				RevConsultDTO dto = dao.detailConsultUser(userId);
				System.out.println(userId);
				model.addAttribute("dto", dto);
			}
			model.addAttribute("selectCnt", selectCnt);
		}
		model.addAttribute("userId", userId);
	}

	// 상담 시간 체크(사용자/관리자)
	@Override
	public void revConsultDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl >>> revConsultDateCheck");
		Date revDate = Date.valueOf(request.getParameter("revDate"));
		System.out.println(revDate);
		
		@SuppressWarnings("deprecation")
		int dayOfWeek = revDate.getDay();
		
		List<String> timeArr = dao.revConsultDateCheck(revDate);
		model.addAttribute("timeArr", timeArr);
		model.addAttribute("dayOfWeek", dayOfWeek);
		model.addAttribute("revDate", revDate);
	}
	
	// 상담 예약 등록(사용자)
	@Override
	public void insertRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - insertRevConsult");
		
		// input값 불러오기
		String userId = request.getParameter("hiddenUserId");
		String userName = request.getParameter("hiddenUserName");
		String userHp = request.getParameter("hiddenUserHp");
		
		// 예약 날짜와 시간 값 받아서 Timestamp로 형변환
		String revDate = request.getParameter("hiddenRevDate");
		String revTime = request.getParameter("revTime");
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
	
	// 상담 예약 목록(사용자)
	@Override
	public void revConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - revConsultList");	
		
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
		
		dao.updateConsultStatus();
		
		List<RevConsultDTO> list = dao.revConsultList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		
	}

	// 상담 예약 목록(관리자)
	@Override
	public void adRevConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - adRevConsultList");	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 상담 예약 상태 가져오기
		String statusType = "";
		if(request.getParameter("statusType") != null) {
			statusType = request.getParameter("statusType");
		}
		map.put("statusType", statusType);
		
		// 페이지 계산
		String pageNum = request.getParameter("pageNum");
		
		int total = dao.adRevConsultCnt(map);
		
		Paging10 paging = new Paging10(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		// 예약 날짜와 현재 날짜 비교 후, 상태 업데이트
		dao.updateConsultStatus();
		
		// 상담예약 목록 list에 저장
		List<RevConsultDTO> list = dao.adRevConsultList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("statusType", statusType);
	}
	
	// 상담 예약 상세 정보 조회(관리자)
	@Override
	public void adRevConsultDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - adRevConsultDetail");
		
		int revConsultNo = Integer.parseInt(request.getParameter("revConsultNo"));
		RevConsultDTO dto = dao.adRevConsultDetail(revConsultNo);
		
		// 트레이너 지정을 위해 목록 조회
		List<String> trainerList = dao.trainerList();
		
		model.addAttribute("dto", dto);
		model.addAttribute("trainerList", trainerList);
		
	}

	// 상담 예약 수정(관리자)
	@Override
	public void adRevConsultUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - adRevConsultUpdate");
		
		// input값 불러오기
		int revConsultNo = Integer.parseInt(request.getParameter("revConsultNo"));
		String trainerId = request.getParameter("trainerSelect");

		// 상담 예약 상태 가져오기
		String statusType = "";
		if(request.getParameter("statusType") != null) {
			statusType = request.getParameter("statusType");
		}
		System.out.println(statusType);
		// 예약 날짜와 시간 값 받아서 Timestamp로 형변환
		String revDate = request.getParameter("hiddenRevDate").trim();
		String hiddenRevTime = request.getParameter("hiddenRevTime").trim();
		String revTime = request.getParameter("revTime");
		String revConsultDate = "";
		
		if(revTime == null) {
			revConsultDate = revDate + " " + hiddenRevTime + ":00.0";
		}else {
			revConsultDate = revDate + " " + revTime + ":00.0";
		}
		
		Timestamp ts = Timestamp.valueOf(revConsultDate);
		
		RevConsultDTO dto = new RevConsultDTO();
		
		dto.setRevConsultNo(revConsultNo);
		dto.setTrainerId(trainerId);
		dto.setRevConsultStatus(statusType);
		dto.setRevConsultDate(ts);
		
		int updateCnt = dao.adRevConsultUpdate(dto);
		model.addAttribute("updateCnt", updateCnt);
	}

	// 상담 예약 취소(사용자/관리자)
	@Override
	public void deleteRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - deleteRevConsult");
		
		int revConsultNo = Integer.parseInt(request.getParameter("revConsultNo"));
		
		int deleteCnt = dao.deleteRevConsult(revConsultNo);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	
	//------------------ PT 예약 --------------------
	
	// PT 수업 여부 확인(사용자)
	@Override
	public void checkUserPTCount(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - checkUserPTCount");
		
		String userId = (String)request.getSession().getAttribute("sessionID");
		System.out.println(userId);
		if(userId == null || userId == "") {
			return;
		}else {
			int ptCnt = dao.checkUserPTCount(userId);
			
			System.out.println(ptCnt);
			model.addAttribute("ptCnt", ptCnt);
		}
	}
	
	// PT 회원 인증(사용자)
	@Override
	public void revPTCheckUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - revPTCheckUser");

		// userId와 userPw의 input값 저장
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		// userPw 입력값이 있을 때 인증 진행
		if(userPw != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("userPw", userPw);
			
			// 회원 인증 결과 selectCnt에 저장 후 전달
			int selectCnt = dao.revPTCheckUser(map);
			  
			// 회원 인증 성공 시 user 정보 불러오기
			if(selectCnt == 1) {
				RevPTDTO dto = dao.detailPTUserAction(userId);
				System.out.println(userId);
				model.addAttribute("dto", dto);
			}
			
			model.addAttribute("selectCnt", selectCnt);
		}
		model.addAttribute("userId", userId);
	}
	
	// PT 시간 체크(사용자/관리자)
	@Override
	public void revPTDateCheck(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - revPTDateCheck");
		
		// GET 방식으로 넘긴 값 받기
		Date revDate = Date.valueOf(request.getParameter("revDate"));
		System.out.println(revDate);
		String trainerId = request.getParameter("trainerId");
		System.out.println(trainerId);
		
		@SuppressWarnings("deprecation")
		int dayOfWeek = revDate.getDay();	// 주말, 평일 구분
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("revDate", revDate);
		map.put("trainerId", trainerId);
		
		List<String> timeArr = dao.revPTDateCheck(map);
		model.addAttribute("timeArr", timeArr);
		model.addAttribute("dayOfWeek", dayOfWeek);
		model.addAttribute("revDate", revDate);
		model.addAttribute("trainerId", trainerId);
	}
	
	// PT 예약 등록(사용자)
	@Override
	public void insertRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - deleteRevConsult");
		
		// input값 불러오기
		String userId = request.getParameter("hiddenUserId");
		String userName = request.getParameter("hiddenUserName");
		String userHp = request.getParameter("hiddenUserHp");
		String trainerId = request.getParameter("hiddenTrainerId");
		
		// 예약 날짜와 시간 값 받아서 Timestamp로 형변환
		String revDate = request.getParameter("hiddenRevDate");
		String revTime = request.getParameter("revTime");
		String revConsultDate = revDate + " " + revTime + ":00.0";
		
		Timestamp ts = Timestamp.valueOf(revConsultDate);
		
		RevPTDTO dto = new RevPTDTO();
		
		dto.setUserId(userId);
		dto.setUserName(userName);
		dto.setUserHp(userHp);
		dto.setTrainerId(trainerId);
		dto.setRevPTDate(ts);
		
		int insertCnt = dao.insertRevPT(dto);
		model.addAttribute("insertCnt", insertCnt);
	}

	// PT 예약 목록(사용자)
	@Override
	public void revPTList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - revPTList");
		
		String pageNum = request.getParameter("pageNum");
		String userId = (String)request.getSession().getAttribute("sessionID");
		
		int total = dao.revPTCnt(userId);
		
		Paging10 paging = new Paging10(pageNum);
		paging.setTotalCount(total);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("userId", userId);
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		
		dao.updatePTStatus();
		
		List<RevPTDTO> list = dao.revPTList(map);
		int ptCnt = dao.checkUserPTCount(userId);
		
		// jsp에서 현재 시간과 예약일을 비교하기 위한 변수
		Timestamp now = new Timestamp(System.currentTimeMillis());

		model.addAttribute("ptCnt", ptCnt);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("now", now);
	}

	// PT 예약 취소(사용자/관리자)
	@Override
	public void deleteRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - deleteRevConsult");
		
		int revPTNo = Integer.parseInt(request.getParameter("revPTNo"));
		
		int deleteCnt = dao.deleteRevPT(revPTNo);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	// PT 상태 완료로 변경(사용자)
	@Override
	public void completeRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - completeRevPT");
		
		int revPTNo = Integer.parseInt(request.getParameter("revPTNo"));
		int updateCnt = dao.completeRevPT(revPTNo);
		if(updateCnt == 1) {
			dao.updatePTCnt(request.getParameter("userId"));
		}
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void adRevPTList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - adRevPTList");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String trainerId = (String) request.getSession().getAttribute("sessionID");
		map.put("trainerId", trainerId);
		
		// 상담 예약 상태 가져오기
		String statusType = "";
		if(request.getParameter("statusType") != null) {
			statusType = request.getParameter("statusType");
		}
		map.put("statusType", statusType);
		
		// 페이지 계산
		String pageNum = request.getParameter("pageNum");
		
		int total = dao.adRevPTCnt(map);
		
		Paging10 paging = new Paging10(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		// 예약 날짜와 현재 날짜 비교 후, 상태 업데이트
		dao.updatePTStatus();
		
		// 상담예약 목록 list에 저장
		List<RevPTDTO> list = dao.adRevPTList(map);
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("statusType", statusType);
		model.addAttribute("now", now);
	}

	@Override
	public void adRevPTDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - adRevPTDetail");
		
		int revPTNo = Integer.parseInt(request.getParameter("revPTNo"));
		RevPTDTO dto = dao.adRevPTDetail(revPTNo);
		
		Timestamp now = new Timestamp(System.currentTimeMillis());
		
		model.addAttribute("dto", dto);
		model.addAttribute("now", now);
		
	}

	@Override
	public void adRevPTUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - adRevPTUpdate");
		
		// input값 불러오기
		int revPTNo = Integer.parseInt(request.getParameter("revPTNo"));

		// 상담 예약 상태 가져오기
		String statusType = "";
		if(request.getParameter("statusType") != null) {
			statusType = request.getParameter("statusType");
		}
		
		// 예약 날짜와 시간 값 받아서 Timestamp로 형변환
		String revDate = request.getParameter("hiddenRevDate").trim();
		
		// 기존 예약 시간
		String hiddenRevTime = request.getParameter("hiddenRevTime").trim();
		
		// 변경된 예약 시간
		String revTime = request.getParameter("revTime");
		String revPTDate = "";
		
		if(revTime == null) {
			revPTDate = revDate + " " + hiddenRevTime + ":00.0";
		}else {
			revPTDate = revDate + " " + revTime + ":00.0";
		}
		System.out.println(revPTDate);
		Timestamp ts = Timestamp.valueOf(revPTDate);
		System.out.println(ts);
		RevPTDTO dto = new RevPTDTO();
		
		dto.setRevPTNo(revPTNo);
		dto.setRevPTStatus(statusType);
		dto.setRevPTDate(ts);
		
		int updateCnt = dao.updateAdRevPT(dto);
		
		// statusType이 완료이고 updateCnt가 1일 때 ptCnt 차감
		if(statusType.equals("완료") && updateCnt == 1) {
			dao.updatePTCnt(request.getParameter("hiddenUserId"));
		}
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void completeAdRevPT(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ReservationServiceImpl - completeAdRevPT");
		
		int revPTNo = Integer.parseInt(request.getParameter("revPTNo"));
		int updateCnt = dao.completeRevPT(revPTNo);
		
		if(updateCnt == 1) {
			dao.updatePTCnt(request.getParameter("userId"));
		}
		model.addAttribute("updateCnt", updateCnt);
	}


}
