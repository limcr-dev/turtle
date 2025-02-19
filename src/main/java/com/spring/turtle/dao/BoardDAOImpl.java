package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.BoardCommentDTO;
import com.spring.turtle.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	// 자유게시판 게시글 목록
	@Override
	public List<BoardDTO> boardList(Map<String, Object> map) {
		System.out.println("QnaDAOImpl - boardList()");
		
		return null;
	}
	
	// 자유게시판 게시글 작성
	@Override
	public int insertBoard(BoardDTO dto) {
		System.out.println("QnaDAOImpl - insertBoard()");
		
		return 0;
	}
	
	// 자유게시판 게시글 상세페이지
	@Override
	public BoardDTO getDetailBoard(int num) {
		System.out.println("QnaDAOImpl - getDetailBoard()");
		
		return null;
	}
	
	// 자유게시판 게시글 삭제
	@Override
	public int deleteBoard(int num) {
		System.out.println("QnaDAOImpl - deleteBoard()");
		
		return 0;
	}
	
	// 자유게시판 게시글 댓글 작성
	@Override
	public int insertBoardComment(BoardCommentDTO dto) {
		System.out.println("QnaDAOImpl - insertBoardComment()");
		
		return 0;
	}
	
	// 자유게시판 게시글 댓글 수정
	@Override
	public int updateBoardComment(BoardCommentDTO dto) {
		System.out.println("QnaDAOImpl - updateBoardComment()");
		
		return 0;
	}
	
	// 자유게시판 댓글 목록처리
	@Override
	public List<BoardCommentDTO> boardCommentList(int num) {
		System.out.println("QnaDAOImpl - boardCommentList()");
		
		return null;
	}
	
	// 댓글 수 증가
	@Override
	public void plusBoardCommentCnt(int num) {
		System.out.println("QnaDAOImpl - plusBoardCommentCnt()");
	}
}
