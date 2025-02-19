package com.spring.turtle.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.RevConsultDTO;
import com.spring.turtle.dto.UserDTO;


public interface ReservationDAO {
	
	// 회원 인증
	public int checkUserAction(Map<String, Object> map);
	
	// 회원 이름, 전화번호 조회
	public UserDTO detailUserAction(String userId);
	
	// 상담 예약 등록
	public int insertRevConsult(RevConsultDTO dto);
	
	// 상담 예약 상세 정보 조회
	public RevConsultDTO revConsultDetail(String userId);
	
	// 상담 예약 목록
	public List<RevConsultDTO> revConsultList(Map<String, Object> map);
	
	// 상담 예약 개수(개인)
	public int revConsultCnt(String userId);
	
	// 상담 예약 수정(관리자)
	public int updateRevConsult(RevConsultDTO dto);
	
	// 상담 예약 삭제(관리자)
	public int deleteRevConsult(int revConsultNo);
		
	// 상담 시간 체크
	public List<String> revConsultDateCheck(Date date);
}
