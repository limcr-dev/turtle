package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.EventDTO;

@Repository
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession; 

	// 이벤트 목록
	@Override
	public List<EventDTO> eventList(Map<String, Object> map) {
		System.out.println("DAO - eventList()");
		
		List<EventDTO> list = sqlSession.selectList("com.spring.turtle.dao.EventDAO.eventList", map);
		
		return list;
	}

	// 이벤트 글 갯수
	@Override
	public int eventCnt() {
		System.out.println("DAO - eventCnt()");
		
		int total = sqlSession.selectOne("com.spring.turtle.dao.EventDAO.eventCnt");
		
		return total;
	}

	// eventShow에 따른 갯수
	@Override
	public int eventCntShow(Map<String, Object> map) {
		System.out.println("DAO - eventCntShow()");
		
		int total = sqlSession.selectOne("com.spring.turtle.dao.EventDAO.eventCntShow", map);
		
		return total;
	}

	// 조회수 증가
	@Override
	public void plusReadCnt(int eventNo) {
		System.out.println("DAO - plusReadCnt()");
		
		sqlSession.update("com.spring.turtle.dao.EventDAO.plusReadCnt", eventNo);
	}

	// 이벤트 상세페이지
	@Override
	public EventDTO getEventDetail(int eventNo) {
		System.out.println("DAO - getEventDetail()");

		EventDTO dto = sqlSession.selectOne("com.spring.turtle.dao.EventDAO.getEventDetail", eventNo);
		
		return dto;
	}

	// 이벤트 작성
	@Override
	public int insertEvent(EventDTO dto) {
		System.out.println("DAO - insertEvent()");

		int insertCnt = sqlSession.insert("com.spring.turtle.dao.EventDAO.insertEvent", dto);
		
		return insertCnt;
	}

	// 이벤트 수정
	@Override
	public int updateEvent(EventDTO dto) {
		System.out.println("DAO - updateEvent()");

		int updateCnt = sqlSession.update("com.spring.turtle.dao.EventDAO.updateEvent", dto);
		
		return updateCnt;
	}

	// 이벤트 삭제
	@Override
	public int deleteEvent(int eventNo) {
		System.out.println("DAO - deleteEvent()");

		int deleteCnt = sqlSession.update("com.spring.turtle.dao.EventDAO.deleteEvent", eventNo);
		
		return deleteCnt;
	}
	// ========================= 관리 =========================
	
	// ========================= 일반 =========================
	public List<EventDTO> eventList1(Map<String, Object> map){
		System.out.println("DAO - eventList1()");
		
		List<EventDTO> list = sqlSession.selectList("com.spring.turtle.dao.EventDAO.eventList1", map);
		
		return list;
	}
	// ========================= 일반 =========================
}
