package com.spring.turtle.dao;

import java.util.Arrays;
import java.util.HashMap;
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
	
	// 유저타입에 따라 나뉘는 회원 수
	@Override
	public int customerCntType(Map<String, Object> map) {
		System.out.println("DAO - customerCntType()");
		
		int total = sqlSession.selectOne("com.spring.turtle.dao.AdCustomerDAO.customerCntType", map);
		
		return total;
	}
	
	// userShow에 따라 나뉘는 회원 수
	@Override
	public int customerCntShow(Map<String, Object> map) {
		System.out.println("DAO - customerCntShow()");
		
		int total = sqlSession.selectOne("com.spring.turtle.dao.AdCustomerDAO.customerCntShow", map);
		
		return total;
	}

	// 회원 정보 조회
	@Override
	public UserDTO getCustomerDetail(String userId) {
		System.out.println("DAO - getCustomerDetail()");
		
		UserDTO dto = sqlSession.selectOne("com.spring.turtle.dao.AdCustomerDAO.getCustomerDetail", userId);
		
		return dto;
	}
	
	// 회원 트레이너 지정
	@Override
	public int updateTrainer(String[] userIds) {
		System.out.println("DAO - updateTrainer()");
		
		// 배열을 Map에 담아서 전달
	    Map<String, Object> map = new HashMap<>();
	  	map.put("userIds", userIds);

		int updateCnt = sqlSession.update("com.spring.turtle.dao.AdCustomerDAO.updateTrainer", userIds);
		
		return updateCnt;
	}

	// 회원 관리자 지정
	@Override
	public int updateAdmin(String[] userIds) {
		System.out.println("DAO - updateAdmin()");
		
		// 배열을 Map에 담아서 전달
	    Map<String, Object> map = new HashMap<>();
	  	map.put("userIds", userIds);

		int updateCnt = sqlSession.update("com.spring.turtle.dao.AdCustomerDAO.updateAdmin", userIds);
		
		return updateCnt;
	}
	
	// 회원 지정
	@Override
	public int updateCustomer(String[] userIds) {
		System.out.println("DAO - updateCustomer()");
		
		// 배열을 Map에 담아서 전달
	    Map<String, Object> map = new HashMap<>();
	  	map.put("userIds", userIds);

		int updateCnt = sqlSession.update("com.spring.turtle.dao.AdCustomerDAO.updateCustomer", userIds);
		
		return updateCnt;
	}
	
	// 회원 삭제
	@Override
	public int deleteCustomer(String[] userIds) {
		System.out.println("DAO - deleteCustomer()");
		
		// 배열을 Map에 담아서 전달
	    Map<String, Object> map = new HashMap<>();
	  	map.put("userIds", userIds);
	  	
		int deleteCnt = sqlSession.update("com.spring.turtle.dao.AdCustomerDAO.deleteCustomer", userIds);
		
		return deleteCnt;
	}
	
	// 회원 복구
	@Override
	public int restoreCustomer(String userId) {
		System.out.println("DAO - restoreCustomer()");
		
		int updateCnt = sqlSession.update("com.spring.turtle.dao.AdCustomerDAO.restoreCustomer", userId);
		
		return updateCnt;
	}
}
