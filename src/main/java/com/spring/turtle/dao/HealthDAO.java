 package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.HealthDTO;
import com.spring.turtle.dto.UserDTO;

public interface HealthDAO {
	
	// 헬스회원 등록 신청(회원용)
	public int healthJoin(HealthDTO dto);
	
	//헬스 회원 목록(갯수)
	public int healthCnt();
		
	// 헬스회원 목록
	public List<HealthDTO> healthList(Map<String, Object> map);
	
	// 헬스 미결제 회원 목록
	public List<HealthDTO> healthUnPayList(Map<String, Object> map);
	
	// 헬스 미결제 회원 승인
	public int healthUnPayUpdate(int healthNo);
	
	// 헬스회원 등록시(Id 조회)
	public UserDTO userIdCheck(String userId);
	
	//헬스트레이너 목록
	public List<String> trainerList();
	
	// 헬스회원 등록 처리
	public int healthInsert(HealthDTO dto);
	
	// 헬스회원 상세페이지
	public HealthDTO healthDetail(int healthNo);
	
	// 헬스회원 수정 처리
	public int healthUpdate(HealthDTO dto);
	
	// 헬스회원 삭제
	public int healthDelete(int healthNo);
	
	

}
