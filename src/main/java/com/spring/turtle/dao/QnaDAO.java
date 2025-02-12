package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import com.spring.turtle.dto.BoardCommentDTO;
import com.spring.turtle.dto.BoardDTO;
import com.spring.turtle.dto.EventDTO;
import com.spring.turtle.dto.FaqDTO;
import com.spring.turtle.dto.NoticeDTO;
import com.spring.turtle.dto.QnaCommentDTO;
import com.spring.turtle.dto.QnaDTO;

public interface QnaDAO {

	// 1대1문의 목록
	public List<QnaDTO> qnaList(Map<String, Object> map);
	
	// 1대1문의 목록 관리자
	public List<QnaDTO> qnaListAdmin(Map<String, Object> map);
	// 1대1문의 갯수 구하기
	public int qnaCnt(Map<String, Object> map);
	
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
	// ------공지사항-------
	// 공지 목록
	public List<NoticeDTO> noticeList(Map<String, Object> map);
	
	// 공지 상세페이지
	public NoticeDTO getNoticeDetail();
	
	// ------이벤트------
	// 이벤트 목록
	public List<EventDTO> eventList(Map<String, Object> map);
	
	// 이벤트 상세페이지
	public EventDTO getEventDetail(int num);
	
	// ------FAQ------
	// FAQ 목록
	public List<FaqDTO> faqList(Map<String, Object> map);
	
	// FAQ 상세내용
	public FaqDTO getDetailFaq(int num);
	
	// ------자유게시판------
	// 자유게시판 게시글 목록
	public List<BoardDTO> boardList(Map<String, Object> map);
	
	// 자유게시판 게시글 작성
	public int insertBoard(BoardDTO dto);
	
	// 자유게시판 게시글 상세페이지
	public BoardDTO getDetailBoard(int num);
	
	// 자유게시판 게시글 삭제
	public int deleteBoard(int num);
	
	// 자유게시판 게시글 댓글 작성
	public int insertBoardComment(BoardCommentDTO dto);
	
	// 자유게시판 게시글 댓글 수정
	public int updateBoardComment(BoardCommentDTO dto);
	
	// 자유게시판 댓글 목록처리
	public List<BoardCommentDTO> boardCommentList(int num);
	
	// 댓글 수 증가
	public void plusBoardCommentCnt(int num);
		
}
