package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.NoticeDTO;

public interface NoticeDAO {
	// 공지사항 목록
	public List<NoticeDTO> noticeList(Map<String, Object> map);
	
	// 공지사항 갯수 
	public int noticeCnt();
	
	// noticeShow에 따른 공지사항 갯수
	public int noticeCntShow(Map<String, Object> map);
	
	// 조회수 증가
	public void plusReadCnt(int noticeNo);
	
	// 공지사항 상세페이지
	public NoticeDTO getNoticeDetail(int noticeNo);
	
	// 공지사항 작성
	public int insertNotice(NoticeDTO dto);
	
	// 공지사항 수정
	public int updateNotice(NoticeDTO dto);
	
	// 공지사항 삭제
	public int deleteNotice(int noticeNo);
	
	// 공지사항 다중 삭제
	public int deleteNoticeSeveral(String[] noticeMul);
}
