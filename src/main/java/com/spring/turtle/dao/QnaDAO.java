package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.QnaCommentDTO;
import com.spring.turtle.dto.QnaDTO;

public interface QnaDAO {

	// 1대1문의 목록
	public List<QnaDTO> qnaList(Map<String, Object> map);
	
	// 1대1문의 목록 관리자
	public List<QnaDTO> qnaListAdmin(Map<String, Object> map);
	// 1대1문의 갯수 구하기
	public int qnaCnt(Map<String, Object> map);
	
	// 1대1문의 갯수 구하기 관리자
	public int adQnaCnt(Map<String, Object> map);
		
	// 1대1문의 작성
	public int insertQna(QnaDTO dto);
	
	// 1대1문의 수정
	public int qnaUpdate(QnaDTO dto);
	
	// 1대1문의 삭제
	public int deleteQna(int num);
	
	// 1대1문의 상세페이지
	public QnaDTO getQnaDetail(int num);
	
	// 1대1문의 댓글 목록처리
	public List<QnaCommentDTO> qnaCommentList(int num);
		
	// 1대1문의 댓글 작성
	public int insertQnaComment(QnaCommentDTO dto);
	
	// 1대1문의 답변처리
	public void changeQnaCommentStatus(Map<String, Object> map);
		
	// 1대1문의 댓글 수정
	public int updateQnaComment(QnaCommentDTO dto);
	
	// 1대1문의 댓글 삭제
	public int DeleteQnaComment(int num);
	
	// 1대1문의 복구
	public int adRestoreQna(int num);
}