package com.spring.turtle.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	// ID 중복확인 처리
	@Override
	public int useridCheck(String userId) {
		System.out.println("DAO - useridCheck()");
		
		int selectCnt = sqlSession.selectOne("com.spring.turtle.dao.UserDAO.useridCheck", userId);
		return selectCnt;
	}
	
	// 회원가입처리
	@Override
	public int insertUser(UserDTO dto) {
		System.out.println("DAO - insertUser()");
		
		int insertCnt = sqlSession.insert("com.spring.turtle.dao.UserDAO.insertUser", dto);
		return insertCnt;
	}
	
	// 로그인처리 (회원정보인증)
	@Override
	public int idPwChk(Map<String, Object> map) {
		System.out.println("DAO - idPwChk()");
		
		int selectCnt = sqlSession.selectOne("com.spring.turtle.dao.UserDAO.idPwChk", map);
		return selectCnt;
	}
	
	// 회원,관리자 구분
	@Override
	public String getUserType(String userId) {
		System.out.println("DAO - getUserType()");
		
		String userType = sqlSession.selectOne("com.spring.turtle.dao.UserDAO.getUserType", userId);
		
		return userType;
	}
	
	// 회원정보 인증후 상세페이지
	@Override
	public UserDTO userDetail(String userId) {
		System.out.println("DAO - userDetail()");
		
		UserDTO dto = sqlSession.selectOne("com.spring.turtle.dao.UserDAO.userDetail", userId);
		
		return dto;
	}
	
	// 회원정보 수정 처리
	@Override
	public int updateUser(UserDTO dto) {
		System.out.println("DAO - updateUser()");
		
		int updateCnt = sqlSession.update("com.spring.turtle.dao.UserDAO.updateUser", dto);
		
		return updateCnt;
	}

	// 회원정보 인증후 탈퇴 처리
	@Override
	public int deleteUser(String userId) {
		System.out.println("DAO - deleteUser()");
		
		int deleteCnt = sqlSession.update("com.spring.turtle.dao.UserDAO.deleteUser", userId);
		return deleteCnt;
	}

}
