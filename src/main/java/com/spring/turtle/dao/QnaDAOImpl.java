package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.BoardCommentDTO;
import com.spring.turtle.dto.BoardDTO;
import com.spring.turtle.dto.EventDTO;
import com.spring.turtle.dto.FaqDTO;
import com.spring.turtle.dto.NoticeDTO;
import com.spring.turtle.dto.QnaCommentDTO;
import com.spring.turtle.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1대1문의 목록
	@Override
	public List<QnaDTO> qnaList(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - qnaList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.QnaDAO.qnaList", map);
	}
	
	// 1대1문의 목록 관리자
	@Override
	public List<QnaDTO> qnaListAdmin(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - qnaListAdmin()");
		
		return sqlSession.selectList("com.spring.turtle.dao.QnaDAO.qnaListAdmin", map);
	}
	
	// 1대1문의 갯수 구하기
	@Override
	public int qnaCnt(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - qnaCnt()");

		return sqlSession.selectOne("com.spring.turtle.dao.QnaDAO.qnaCnt",map);
	}

	// 1대1문의 상세페이지
	@Override
	public QnaDTO getQnaDetail(int num) {
		System.out.println("SupportDAOImpl - getQnaDetail()");
		
		return sqlSession.selectOne("com.spring.turtle.dao.QnaDAO.getQnaDetail", num);
	}
	
	// 1대1문의 작성
	@Override
	public int insertQna(QnaDTO dto) {
		System.out.println("SupportDAOImpl - insertQna()");
		
		return sqlSession.insert("com.spring.turtle.dao.QnaDAO.insertQna", dto);
	}

	// 1대1문의 수정
	@Override
	public int qnaUpdate(QnaDTO dto) {
		System.out.println("SupportDAOImpl - qnaUpdate()");

		return sqlSession.update("com.spring.turtle.dao.QnaDAO.qnaUpdate", dto);
	}

	// 1대1문의 삭제
	@Override
	public int deleteQna(int num) {
		System.out.println("SupportDAOImpl - deleteQna()");

		return sqlSession.update("com.spring.turtle.dao.QnaDAO.deleteQna", num);
	}

	// 1대1문의 댓글 목록처리
	@Override
	public List<QnaCommentDTO> qnaCommentList(int num) {
		System.out.println("SupportDAOImpl - qnaCommentList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.QnaDAO.qnaCommentList", num);
	}

	// 1대1문의 댓글 작성
	@Override
	public int insertQnaComment(QnaCommentDTO dto) {
		System.out.println("SupportDAOImpl - insertQnaComment()");
		
		return sqlSession.insert("com.spring.turtle.dao.QnaDAO.insertQnaComment", dto);
	}
	
	// 1대1문의 답변처리
	@Override
	public void changeQnaCommentStatus(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - changeQnaCommentStatus()");
		
		sqlSession.update("com.spring.turtle.dao.QnaDAO.changeQnaCommentStatus", map);
	}
	// 1대1문의 댓글 수정
	@Override
	public int updateQnaComment(QnaCommentDTO dto) {
		System.out.println("SupportDAOImpl - updateQnaComment()");
		
		return sqlSession.update("com.spring.turtle.dao.QnaDAO.updateQnaComment", dto);
	}
	
	// 1대1문의 댓글 삭제
	@Override
	public int DeleteQnaComment(int num) {
		System.out.println("SupportDAOImpl - DeleteQnaComment()");
		
		return sqlSession.delete("com.spring.turtle.dao.QnaDAO.DeleteQnaComment", num);
	}

	// ------공지사항-------
	// 공지 목록
	@Override
	public List<NoticeDTO> noticeList(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - noticeList()");
		
		return null;
	}

	// 공지 상세페이지
	@Override
	public NoticeDTO getNoticeDetail() {
		System.out.println("SupportDAOImpl - getNoticeDetail()");
		
		return null;
	}

	// ------이벤트------
	// 이벤트 목록
	@Override
	public List<EventDTO> eventList(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - eventList()");
		
		return null;
	}

	// 이벤트 상세페이지
	@Override
	public EventDTO getEventDetail(int num) {
		System.out.println("SupportDAOImpl - getEventDetail()");
		
		return null;
	}

	// ------FAQ------
	// FAQ 목록
	@Override
	public List<FaqDTO> faqList(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - faqList()");
		
		return null;
	}
	
	// FAQ 상세내용
	@Override
	public FaqDTO getDetailFaq(int num) {
		System.out.println("SupportDAOImpl - getDetailFaq()");
		
		return null;
	}
	
	// ------자유게시판------
	// 자유게시판 게시글 목록
	@Override
	public List<BoardDTO> boardList(Map<String, Object> map) {
		System.out.println("SupportDAOImpl - boardList()");
		
		return null;
	}
	
	// 자유게시판 게시글 작성
	@Override
	public int insertBoard(BoardDTO dto) {
		System.out.println("SupportDAOImpl - insertBoard()");
		
		return 0;
	}
	
	// 자유게시판 게시글 상세페이지
	@Override
	public BoardDTO getDetailBoard(int num) {
		System.out.println("SupportDAOImpl - getDetailBoard()");
		
		return null;
	}
	
	// 자유게시판 게시글 삭제
	@Override
	public int deleteBoard(int num) {
		System.out.println("SupportDAOImpl - deleteBoard()");
		
		return 0;
	}
	
	// 자유게시판 게시글 댓글 작성
	@Override
	public int insertBoardComment(BoardCommentDTO dto) {
		System.out.println("SupportDAOImpl - insertBoardComment()");
		
		return 0;
	}
	
	// 자유게시판 게시글 댓글 수정
	@Override
	public int updateBoardComment(BoardCommentDTO dto) {
		System.out.println("SupportDAOImpl - updateBoardComment()");
		
		return 0;
	}
	
	// 자유게시판 댓글 목록처리
	@Override
	public List<BoardCommentDTO> boardCommentList(int num) {
		System.out.println("SupportDAOImpl - boardCommentList()");
		
		return null;
	}
	
	// 댓글 수 증가
	@Override
	public void plusBoardCommentCnt(int num) {
		System.out.println("SupportDAOImpl - plusBoardCommentCnt()");
		
		
	}
}
