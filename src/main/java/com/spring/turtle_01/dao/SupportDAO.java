package com.spring.turtle_01.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle_01.dto.qnaDTO;

public interface SupportDAO {

	// 1대1문의 목록
	public List<qnaDTO> qnaList(Map<String, Object> map);
	
	// 1대1문의 갯수 구하기
	public int qnaCnt();
	
	// 1대1문의 작성
	public int insertQna(qnaDTO dto);
	
	// 1대1문의 글 삭제시 인증
	public int qnapassword_chk(Map<String, Object> map);
	
	// 1대1문의 삭제
	public int deleteQna(int num);
	
	// 1대1문의 상세페이지
	
	
	// 1대1문의 댓글 작성
	
	// 1대1문의 댓글 수정
	
	// 1대1문의 조회수 증가
	
	// ------공지사항-------
	// 공지 목록
	
	// 공지 상세페이지
	
	
	// ------이벤트------
	// 이벤트 목록
	
	// 이벤트 상세페이지

	
	// ------FAQ------
	// FAQ 목록
	
	// FAQ 상세내용
	
	
	// ------자유게시판------
	// 자유게시판 게시글 목록
	
	// 자유게시판 게시글 작성
	
	// 자유게시판 게시글 상세페이지
	
	// 자유게시판 게시글 삭제
	
	// 자유게시판 게시글 댓글 작성
	
	// 자유게시판 게시글 댓글 수정
}
