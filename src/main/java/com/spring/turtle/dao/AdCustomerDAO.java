package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.UserDTO;


public interface AdCustomerDAO {
	// 회원 목록
	public List<UserDTO> customerList(Map<String, Object> map);
	
	// 회원 수 
	public int customerCnt();
	
	// 회원 정보 조회
	public UserDTO getCustomerDetail(int userNo);
	
	// 회원 관리자 지정
	public int updateCustomer(UserDTO dto);
	
	// 회원 삭제
	public int deleteCustomer(int userNo);
}
