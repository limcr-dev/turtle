package com.spring.turtle.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.turtle.dao.ReservationDAO;
import com.spring.turtle.dto.UserDTO;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDAO dao;
	
	// 회원 인증
	@Override
	public void checkUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
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
		// TODO Auto-generated method stub
		
	}
	
	// 상담 예약 상세 정보 조회
	@Override
	public void revConsultDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	// 상담 예약 수정(관리자)
	@Override
	public void modifyRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	// 상담 예약 삭제
	@Override
	public void deleteRevConsult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	// 상담 예약 목록
	@Override
	public void revConsultList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
