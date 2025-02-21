package com.spring.turtle.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.RevConsultDTO;
import com.spring.turtle.dto.RevPTDTO;
import com.spring.turtle.dto.UserDTO;


public interface ReservationDAO {
	
	// ---------------- 상담 예약 ------------------
	// 회원 인증(사용자)
	public int revConsultCheckUser(Map<String, Object> map);
	
	// 회원 이름, 전화번호 조회(사용자)
	public RevConsultDTO detailConsultUser(String userId);
	
	// 상담 시간 체크(사용자/관리자)
	public List<String> revConsultDateCheck(Date date);
		
	// 상담 예약 등록(사용자)
	public int insertRevConsult(RevConsultDTO dto);
	
	// 상담 예약 상태 업데이트(예약 날짜 지나면 상태 완료로 변경)(사용자/관리자)
	public void updateConsultStatus();
	
	// 상담 예약 목록(사용자)
	public List<RevConsultDTO> revConsultList(Map<String, Object> map);
	
	// 상담 예약 갯수(사용자)
	public int revConsultCnt(String userId);
	
	// 상담 예약 목록(관리자)
	public List<RevConsultDTO> adRevConsultList(Map<String, Object> map);
	
	// 상담 예약 갯수(관리자)
	public int adRevConsultCnt(Map<String, Object> map);
	
	// 상담 예약 상세 정보 조회(관리자)
	public RevConsultDTO adRevConsultDetail(int revConsultNo);
		
	// 상담 예약 수정(관리자)
	public int adRevConsultUpdate(RevConsultDTO dto);
	
	// 상담 예약 취소(사용자/관리자)
	public int deleteRevConsult(int revConsultNo);
	
	// 트레이너 목록(관리자)
	public List<String> trainerList();
	
	//------------------ PT 예약 --------------------
	
	// PT 수업 여부 확인(사용자)
	public int checkUserPTCount(String userId);
	
	// PT 회원 인증
	public int revPTCheckUser(Map<String, Object> map);
	
	// PT 시간 체크(사용자/관리자)
	public List<String> revPTDateCheck(Map<String, Object> map);
	
	// 회원 이름, 전화번호 조회(사용자)
	public RevPTDTO detailPTUserAction(String userId);
	
	// PT 예약 등록(사용자)
	public int insertRevPT(RevPTDTO dto);
	
	// PT 예약 상태 업데이트(예약 날짜 지나면 상태 변경, 대기 > 취소)(사용자/관리자)
	public void updatePTStatus();
	
	// PT 예약 목록(사용자)
	public List<RevPTDTO> revPTList(Map<String, Object> map);
	
	// PT 예약 갯수(사용자)
	public int revPTCnt(String userId);
	
	// PT 예약 취소(사용자/관리자)
	public int deleteRevPT(int revPTNo);
		
	// PT 상태 완료로 변경(사용자)
	public int completeRevPT(int revPTNo);
	
	public int updatePTCnt(String userId);
	
	// PT 예약 목록(관리자)
	public List<RevPTDTO> adRevPTList(Map<String, Object> map);
	
	// PT 예약 갯수(관리자)
	public int adRevPTCnt(Map<String, Object> map);
	
	// PT 예약 상세 정보 조회(관리자)
	public RevPTDTO adRevPTDetail(int revPTNo);
		
	// PT 예약 수정(관리자)
	public int updateAdRevPT(RevPTDTO dto);
	
}
