package com.spring.turtle.dao;

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
	
	// 상담 예약 수정(관리자)
	public int updateRevConsult(RevConsultDTO dto);
	
	// 상담 예약 삭제
	public int deleteRevConsult(String userId);
	
	// 상담 예약 목록
	public List<RevConsultDTO> revConsultList(int start, int end);
}
