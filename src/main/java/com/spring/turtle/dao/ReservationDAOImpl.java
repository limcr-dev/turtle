package com.spring.turtle.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.RevConsultDTO;
import com.spring.turtle.dto.RevPTDTO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원 인증(사용자)
	@Override
	public int revConsultCheckUser(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - revConsultCheckUser");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.revConsultCheckUser", map);
	}
	
	// 회원 이름, 전화번호 조회(사용자)
	@Override
	public RevConsultDTO detailConsultUser(String userId) {
		System.out.println("ReservationDAOImpl - detailUserAction");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.detailUserAction", userId);
	}
	
	// 상담 시간 체크(사용자/관리자)
	@Override
	public List<String> revConsultDateCheck(Date date) {
		System.out.println("ReservationDAOImpl - revConsultDateCheck");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.revConsultDateCheck", date);
	}
	
	// 상담 예약 등록(사용자)
	@Override
	public int insertRevConsult(RevConsultDTO dto) {
		System.out.println("ReservationDAOImpl - insertRevConsult");
		return sqlSession.insert("com.spring.turtle.dao.ReservationDAO.insertRevConsult", dto);
	}
	
	// 상담 예약 상태 업데이트(예약 날짜 지나면 상태 완료로 변경)(사용자/관리자)
	@Override
	public void updateConsultStatus() {
		System.out.println("ReservationDAOImpl - updateConsultStatus");
		sqlSession.update("com.spring.turtle.dao.ReservationDAO.updateConsultStatus");
	}
	
	// 상담 예약 목록(사용자)
	@Override
	public List<RevConsultDTO> revConsultList(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - revConsultList");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.revConsultList", map);
	}
	
	// 상담 예약 개수(사용자)
	@Override
	public int revConsultCnt(String userId) {
		System.out.println("ReservationDAOImpl - revConsultCnt");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.revConsultCnt", userId);
	}

	// 상담 예약 목록(관리자)
	@Override
	public List<RevConsultDTO> adRevConsultList(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - adRevConsultList");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.adRevConsultList", map);
	}
	
	// 상담 예약 갯수(관리자)
	@Override
	public int adRevConsultCnt(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - adRevConsultCnt");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.adRevConsultCnt", map);
	}
	
	// 상담 예약 상세 정보 조회(관리자)
	@Override
	public RevConsultDTO adRevConsultDetail(int revConsultNo) {
		System.out.println("ReservationDAOImpl - adRevConsultDetail");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.adRevConsultDetail", revConsultNo);
	}

	// 상담 예약 수정(관리자)
	@Override
	public int adRevConsultUpdate(RevConsultDTO dto) {
		System.out.println("ReservationDAOImpl - adRevConsultUpdate");
		return sqlSession.update("com.spring.turtle.dao.ReservationDAO.adRevConsultUpdate", dto);
	}

	// 상담 예약 삭제(관리자)
	@Override
	public int deleteRevConsult(int revConsultNo) {
		System.out.println("ReservationDAOImpl - deleteRevConsult");
		return sqlSession.update("com.spring.turtle.dao.ReservationDAO.deleteRevConsult", revConsultNo);
	}

	// 트레이너 목록(관리자)
	@Override
	public List<String> trainerList() {
		System.out.println("ReservationDAOImpl - trainerList");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.trainerList");
	}

	//------------------ PT 예약 --------------------
	
	// PT 수업 여부 확인(사용자)
	@Override
	public int checkUserPTCount(String userId) {
		System.out.println("ReservationDAOImpl - checkUserPTCount");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.checkUserPTCount", userId);
	}
	
	// PT 회원 인증
	@Override
	public int revPTCheckUser(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - revPTCheckUser");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.revPTCheckUser", map);
	}

	// PT 시간 체크(사용자/관리자)
	@Override
	public List<String> revPTDateCheck(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - revPTDateCheck");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.revPTDateCheck", map);
	}
	
	// PT 회원 이름, 전화번호 조회(사용자)
	@Override
	public RevPTDTO detailPTUserAction(String userId) {
		System.out.println("ReservationDAOImpl - detailPTUserAction");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.detailPTUserAction", userId);
	}
	
	// PT 예약 등록(사용자)
	@Override
	public int insertRevPT(RevPTDTO dto) {
		System.out.println("ReservationDAOImpl - insertRevPT");
		return sqlSession.insert("com.spring.turtle.dao.ReservationDAO.insertRevPT", dto);
	}

	// PT 예약 상태 업데이트(예약 날짜 지나면 상태 변경, 대기 > 취소)(사용자/관리자)
	@Override
	public void updatePTStatus() {
		System.out.println("ReservationDAOImpl - updatePTStatus");
		sqlSession.update("com.spring.turtle.dao.ReservationDAO.updatePTStatus");
	}
	
	// PT 예약 목록(사용자)
	@Override
	public List<RevPTDTO> revPTList(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - revPTList");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.revPTList", map);
	}

	// PT 예약 갯수(사용자)
	@Override
	public int revPTCnt(String userId) {
		System.out.println("ReservationDAOImpl - revPTCnt");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.revPTCnt", userId);
	}
	
	// PT 예약 취소(사용자/관리자)
	@Override
	public int deleteRevPT(int revPTNo) {
		System.out.println("ReservationDAOImpl - deleteRevPT");
		return sqlSession.update("com.spring.turtle.dao.ReservationDAO.deleteRevPT", revPTNo);
	}

	// PT 예약 상태 완료로 변경(사용자/관리자)
	@Override
	public int completeRevPT(int revPTNo) {
		System.out.println("ReservationDAOImpl - completeRevPT");
		return sqlSession.update("com.spring.turtle.dao.ReservationDAO.completeRevPT", revPTNo);
	}
	
	// PT 예약 상태 완료로 변경(사용자/관리자)
	@Override
	public int updatePTCnt(String userId) {
		System.out.println("ReservationDAOImpl - updatePTCnt");
		return sqlSession.update("com.spring.turtle.dao.ReservationDAO.updatePTCnt", userId);
	}
	
	// PT 예약 목록(관리자)
	@Override
	public List<RevPTDTO> adRevPTList(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - adRevPTList");
		return sqlSession.selectList("com.spring.turtle.dao.ReservationDAO.adRevPTList", map);
	}
	
	// PT 예약 갯수(관리자)
	@Override
	public int adRevPTCnt(Map<String, Object> map) {
		System.out.println("ReservationDAOImpl - adRevPTCnt");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.adRevPTCnt", map);
	}
	
	// PT 예약 상세 정보 조회(관리자)
	@Override
	public RevPTDTO adRevPTDetail(int revPTNo) {
		System.out.println("ReservationDAOImpl - adRevPTDetail");
		return sqlSession.selectOne("com.spring.turtle.dao.ReservationDAO.adRevPTDetail", revPTNo);
	}
	
	// PT 예약 수정(관리자)
	@Override
	public int updateAdRevPT(RevPTDTO dto) {
		System.out.println("ReservationDAOImpl - updateRevPT");
		return sqlSession.update("com.spring.turtle.dao.ReservationDAO.updateRevPT", dto);
	}

	
	
	
}
