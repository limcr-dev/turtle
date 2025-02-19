package com.spring.turtle.dao;

import java.sql.Date;
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
		System.out.println("DAO >>> checkUserAction");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.checkUserAction", map);
	}
	
	// 회원 정보 가져오기
	@Override
	public UserDTO detailUserAction(String userId) {
		System.out.println("DAO >>> detailUserAction");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.detailUserAction", userId);
	}

	// 상담 예약 등록
	@Override
	public int insertRevConsult(RevConsultDTO dto) {
		System.out.println("DAO >>> insertRevConsult");
		return sqlSession.insert("com.spring.turtle.dao.ReservationDAO.insertRevConsult", dto);
	}
	
	// 상담 예약 목록(개인)
	@Override
	public List<RevConsultDTO> revConsultList(Map<String, Object> map) {
		System.out.println("DAO >>> revConsultList");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.revConsultList", map);
	}
	
	// 상담 예약 갯수(개인)
	@Override
	public int revConsultCnt(String userId) {
		System.out.println("DAO >>> revConsultCnt");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.revConsultCnt", userId);
	}

	// 상담 예약 상세 정보 조회(관리자)
	@Override
	public RevConsultDTO revConsultDetail(String userId) {
		System.out.println("DAO >>> revConsultDetail");
		return null;
	}

	// 상담 예약 수정(관리자)
	@Override
	public int updateRevConsult(RevConsultDTO dto) {
		System.out.println("DAO >>> updateRevConsult");
		return 0;
	}

	// 상담 예약 삭제
	@Override
	public int deleteRevConsult(int revConsultNo) {
		System.out.println("DAO >>> deleteRevConsult");
		return sqlSession.update("com.spring.turtle.dao.ReservationDAO.deleteRevConsult", revConsultNo);
	}

	

	// 상담 시간 체크
	@Override
	public List<String> revConsultDateCheck(Date date) {
		System.out.println("DAO >>> revConsultDateCheck");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.revConsultDateCheck", date);
	}

	

}
