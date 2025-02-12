package com.spring.turtle.dao;

import java.util.Map;

import com.spring.turtle.dto.UserDTO;

public interface UserDAO {
	
	// ID 중복확인 처리
	public int useridCheck(String userId);
	
	// 회원가입처리
	public int insertUser(UserDTO dto);
	
	// 로그인처리 (회원정보인증)
	public int idPwChk(Map<String, Object> map);
	
	// 회원정보 인증후 상세페이지
	public UserDTO userDetail(String userId) ;
	
	// 회원,관리자 구분
	public String getUserType(String userId);
	
	// 회원정보 수정 처리
	public int updateUser(UserDTO dto);
	
	// 회원정보 인증후 탈퇴 처리
	public int deleteUser(String userId);
}
