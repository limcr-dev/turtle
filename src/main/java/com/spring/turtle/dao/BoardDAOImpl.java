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
		System.out.println("BoardDAOImpl - boardList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.BoardDAO.boardList", map);
	}
	// 자유게시판 게시글 갯수
	@Override
	public int boardCnt(Map<String, Object> map) {
		System.out.println("BoardDAOImpl - boardCnt()");
		
		return sqlSession.selectOne("com.spring.turtle.dao.BoardDAO.boardCnt",map);
	}
		
	// 자유게시판 게시글 상세페이지
	@Override
	public BoardDTO getDetailBoard(int num) {
		System.out.println("BoardDAOImpl - getDetailBoard()");
		
		return sqlSession.selectOne("com.spring.turtle.dao.BoardDAO.getDetailBoard",num);
	}
	
	// 자유게시판 조회수 증가
	@Override
	public void plusViewBoard(int num) {
		System.out.println("BoardDAOImpl - getDetailBoard()");
		
		sqlSession.update("com.spring.turtle.dao.BoardDAO.plusViewBoard",num);
	}
		
	// 자유게시판 게시글 작성
	@Override
	public int insertBoard(BoardDTO dto) {
		System.out.println("BoardDAOImpl - insertBoard()");
		
		return sqlSession.insert("com.spring.turtle.dao.BoardDAO.insertBoard", dto);
	}
	
	// 자유게시판 게시글 삭제
	@Override
	public int deleteBoard(int num) {
		System.out.println("BoardDAOImpl - deleteBoard()");
		
		return sqlSession.update("com.spring.turtle.dao.BoardDAO.deleteBoard", num);
	}
	
	// 자유게시판 게시글 수정
	@Override
	public int updateBoard(BoardDTO dto) {
		System.out.println("BoardDAOImpl - updateBoard()");
		
		return sqlSession.update("com.spring.turtle.dao.BoardDAO.updateBoard", dto);
	}
		
	// 자유게시판 댓글 목록처리
	@Override
	public List<BoardCommentDTO> boardCommentList(int num) {
		System.out.println("BoardDAOImpl - boardCommentList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.BoardDAO.boardCommentList",num);
	}
		
	// 자유게시판 게시글 댓글 작성
	@Override
	public int insertBoardComment(BoardCommentDTO dto) {
		System.out.println("BoardDAOImpl - insertBoardComment()");
		
		return sqlSession.insert("com.spring.turtle.dao.BoardDAO.insertBoardComment",dto);
	}
	
	// 댓글 수 증가
	@Override
	public void plusBoardCommentCnt(int num) {
		System.out.println("BoardDAOImpl - plusBoardCommentCnt()");
		
		sqlSession.update("com.spring.turtle.dao.BoardDAO.plusBoardCommentCnt", num);
	}
	
	// 자유게시판 게시글 댓글 수정
	@Override
	public int updateBoardComment(BoardCommentDTO dto) {
		System.out.println("BoardDAOImpl - updateBoardComment()");
		
		return sqlSession.update("com.spring.turtle.dao.BoardDAO.updateBoardComment", dto);
	}
	
	// 자유게시판 게시글 댓글 삭제
	@Override
	public int deleteBoardComment(Map<String, Object> map) {
		System.out.println("BoardDAOImpl - deleteBoardComment()");
		
		return sqlSession.delete("com.spring.turtle.dao.BoardDAO.deleteBoardComment", map);
	}
	
	// 자유게시판 게시글 댓글 수 감소
	@Override
	public int minusBoardCommentCnt(int num) {
		System.out.println("BoardDAOImpl - minusBoardCommentCnt()");
		
		return sqlSession.update("com.spring.turtle.dao.BoardDAO.minusBoardCommentCnt", num);
	}
	
	// 자유게시판 게시글 복구 관리자
	@Override
	public void adRestoreBoard(int num) {
		System.out.println("BoardDAOImpl - adRestoreBoard()");
		
		sqlSession.update("com.spring.turtle.dao.BoardDAO.adRestoreBoard", num);
	}
}
