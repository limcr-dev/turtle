package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.HealthDTO;
import com.spring.turtle.dto.UserDTO;

@Repository
public class HealthDAOImpl implements HealthDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 헬스회원 등록 신청(회원용)
	@Override
	public int healthJoin(HealthDTO dto) {
		System.out.println("HealthDAOImpl - healthInsert");
		
		return sqlSession.insert("com.spring.turtle.dao.HealthDAO.healthJoin",dto);
	}
	
	//헬스 회원 목록(갯수)
	@Override
	public int healthCnt(Map<String, Object> map) {
		System.out.println("HealthDAOImpl - healthCnt");
		
		int total =sqlSession.selectOne("com.spring.turtle.dao.HealthDAO.healthCnt", map);
		
		return total;
	}
	
	// 헬스회원 목록
	@Override
	public List<HealthDTO> healthList(Map<String, Object> map) {
		System.out.println("HealthDAOImpl - healthList");
		
		List<HealthDTO> list = sqlSession.selectList("com.spring.turtle.dao.HealthDAO.healthList", map);
		
		return list;
	}
	
	//헬스 회원 목록(갯수)
	@Override
	public int healthUnPayCnt(Map<String, Object> map) {
		System.out.println("HealthDAOImpl - healthCnt");
		
		int total =sqlSession.selectOne("com.spring.turtle.dao.HealthDAO.healthUnPayCnt", map);
		
		return total;
	}
	
	// 헬스 미결제회원 목록
	@Override
	public List<HealthDTO> healthUnPayList(Map<String, Object> map) {
		System.out.println("HealthDAOImpl - healthUnPayList");
		
		List<HealthDTO> list = sqlSession.selectList("com.spring.turtle.dao.HealthDAO.healthUnPayList", map);
		
		return list;
	}
	
	// 헬스 미결제 회원 승인
	@Override
	public int healthUnPayUpdate(int healthNo) {
		
		
		return sqlSession.update("com.spring.turtle.dao.HealthDAO.healthUnPayUpdate", healthNo);
	}
	
	// 헬스회원 등록시(Id 조회)
	@Override
	public UserDTO userIdCheck(String userId) {
		System.out.println("HealthDAOImpl - userIdCheck");
	
		return sqlSession.selectOne("com.spring.turtle.dao.HealthDAO.userIdCheck", userId);
	}
	
	//헬스트레이너 목록
	public List<String> trainerList() {
		System.out.println("HealthDAOImpl - trainerList");
		
		List<String> list = sqlSession.selectList("com.spring.turtle.dao.HealthDAO.trainerList");
		return list;
		
	}
	
	//헬스 회원 등록
	@Override
	public int healthInsert(HealthDTO dto) {
		System.out.println("HealthDAOImpl - healthInsert");
		
		return sqlSession.insert("com.spring.turtle.dao.HealthDAO.healthInsert",dto);
	}

	// 헬스회원 상세페이지
	@Override
	public HealthDTO healthDetail(int healthNo) {
		System.out.println("HealthDAOImpl - healthDetail");
		
		return sqlSession.selectOne("com.spring.turtle.dao.HealthDAO.healthDetail", healthNo);
	}

	// 헬스회원 수정 처리
	@Override
	public int healthUpdate(HealthDTO dto) {
		System.out.println("HealthDAOImpl - healthUpdate");
		
		return sqlSession.update("com.spring.turtle.dao.HealthDAO.healthUpdate", dto);
	}
	
	//헬스회원 삭제
	@Override
	public int healthDelete(int healthNo) {
		System.out.println("HealthDAOImpl - healthDelete");
		
		return sqlSession.delete("com.spring.turtle.dao.HealthDAO.healthDelete", healthNo);
	}

	@Override
	public int isInserted(String userId) {
		System.out.println("HealthDAOImpl - isInserted");
		return sqlSession.selectOne("com.spring.turtle.dao.HealthDAO.isInserted", userId);
	}
	
}
