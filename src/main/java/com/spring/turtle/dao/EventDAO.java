package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.EventDTO;

public interface EventDAO {
	
	// 이벤트 목록
	public List<EventDTO> eventList(Map<String, Object> map);
	
	// 이벤트 글 갯수
	public int eventCnt();
	
	// eventShow에 따른 갯수
	public int eventCntShow(Map<String, Object> map);
	
	// 조회수 증가
	public void plusReadCnt(int eventNo);
	
	// 이벤트 상세페이지
	public EventDTO getEventDetail(int eventNo);
	
	// 이벤트 작성
	public int insertEvent(EventDTO dto);
	
	// 이벤트 수정
	public int updateEvent(EventDTO dto);
	
	// 이벤트 삭제
	public int deleteEvent(int eventNo);
	
	// ========================= 일반 =========================
	public List<EventDTO> eventList1(Map<String, Object> map);
	// ========================= 일반 =========================
}
