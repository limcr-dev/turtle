package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.UserDTO;


public interface AdCustomerDAO {
	// 회원 목록
	public List<UserDTO> customerList(Map<String, Object> map);
	
	// 회원 수 
	public int customerCnt();
	
	// 유저타입에 따라 나뉘는 회원 수
	public int customerCntType(Map<String, Object> map);
	
	// userShow에 따라 나뉘는 회원 수
	public int customerCntShow(Map<String, Object> map);
	
	// 회원 정보 조회
	public UserDTO getCustomerDetail(String userId);

	// 회원 트레이너 지정
	public int updateTrainer(String[] userIds);
	
	// 회원 관리자 지정
	public int updateAdmin(String[] userIds);
	
	// 회원 지정
	public int updateCustomer(String[] userIds);
	
	// 회원 삭제
	public int deleteCustomer(String[] userIds);
	
	// 회원 정보 조회
	public int restoreCustomer(String userId);
}
