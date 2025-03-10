package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.BoardCommentDTO;
import com.spring.turtle.dto.BoardDTO;

public interface BoardDAO {
	// 자유게시판 게시글 목록
	public List<BoardDTO> boardList(Map<String, Object> map);
	
	// 자유게시판 게시글 갯수
	public int boardCnt(Map<String, Object> map);
	
	// 자유게시판 게시글 상세페이지
	public BoardDTO getDetailBoard(int num);
	
	// 자유게시판 조회수 증가
	public void plusViewBoard(int num);
		
	// 자유게시판 게시글 작성
	public int insertBoard(BoardDTO dto);
	
	// 자유게시판 게시글 삭제
	public int deleteBoard(int num);
	
	// 자유게시판 게시글 수정
	public int updateBoard(BoardDTO dto);
		
	// 자유게시판 댓글 목록처리
	public List<BoardCommentDTO> boardCommentList(int num);
	
	
	// 자유게시판 게시글 댓글 작성
	public int insertBoardComment(BoardCommentDTO dto);
	
	// 댓글 수 증가
	public void plusBoardCommentCnt(int num);
		
	// 자유게시판 게시글 댓글 수정
	public int updateBoardComment(BoardCommentDTO dto);
	
	// 자유게시판 게시글 댓글 삭제
	public int deleteBoardComment(Map<String, Object> map);
	
	// 자유게시판 게시글 댓글 수 감소
	public int minusBoardCommentCnt(int num);
		
	// 자유게시판 게시글 복구 관리자
	public void adRestoreBoard(int num);
}
