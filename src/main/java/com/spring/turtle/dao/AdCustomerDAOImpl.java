package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.UserDTO;

@Repository
public class AdCustomerDAOImpl implements AdCustomerDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession; 

	// 회원 목록
	@Override
	public List<UserDTO> customerList(Map<String, Object> map) {
		System.out.println("DAO - customerList()");
		
		List<UserDTO> list = sqlSession.selectList("com.spring.turtle.dao.AdCustomerDAO.customerList", map);
		
		return list;
	}
	
	// 회원 수
	@Override
	public int customerCnt() {
		System.out.println("DAO - customerCnt()");
		
		int total = sqlSession.selectOne("com.spring.turtle.dao.AdCustomerDAO.customerCnt");
		
		return total;
	}

	// 회원 정보 조회
	@Override
	public UserDTO getCustomerDetail(int userNo) {
		System.out.println("DAO - getCustomerDetail()");
		
		UserDTO dto = sqlSession.selectOne("com.spring.turtle.dao.AdCustomerDAO.getCustomerDetail", userNo);
		
		return dto;
	}

	// 회원 관리자 지정
	@Override
	public int updateCustomer(UserDTO dto) {
		System.out.println("DAO - updateCustomer()");

		int updateCnt = sqlSession.update("com.spring.turtle.dao.AdCustomerDAO.updateCustomer", dto);
		
		return updateCnt;
	}
	
	// 회원 삭제
	@Override
	public int deleteCustomer(int userNo) {
		System.out.println("DAO - deleteCustomer()");
		
		int deleteCnt = sqlSession.update("com.spring.turtle.dao.AdCustomerDAO.deleteCustomer", userNo);
		
		return deleteCnt;
	}
}
