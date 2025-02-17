package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.RevConsultDTO;
import com.spring.turtle.dto.UserDTO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원 인증
	@Override
	public int checkUserAction(Map<String, Object> map) {
		System.out.println("checkUserAction");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.checkUserAction", map);
	}
	
	// 회원 인증
	@Override
	public UserDTO detailUserAction(String userId) {
		System.out.println("detailUserAction");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.detailUserAction", userId);
	}

	// 상담 예약 등록
	@Override
	public int insertRevConsult(RevConsultDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 상담 예약 상세 정보 조회
	@Override
	public RevConsultDTO revConsultDetail(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	// 상담 예약 수정(관리자)
	@Override
	public int updateRevConsult(RevConsultDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 상담 예약 삭제
	@Override
	public int deleteRevConsult(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 상담 예약 목록
	@Override
	public List<RevConsultDTO> revConsultList(int start, int end) {
		// TODO Auto-generated method stub
		return null;
	}

}
