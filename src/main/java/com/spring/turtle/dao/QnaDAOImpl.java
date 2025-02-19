package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.QnaCommentDTO;
import com.spring.turtle.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1대1문의 목록
	@Override
	public List<QnaDTO> qnaList(Map<String, Object> map) {
		System.out.println("QnaDAOImpl - qnaList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.QnaDAO.qnaList", map);
	}
	
	// 1대1문의 목록 관리자
	@Override
	public List<QnaDTO> qnaListAdmin(Map<String, Object> map) {
		System.out.println("QnaDAOImpl - qnaListAdmin()");
		
		return sqlSession.selectList("com.spring.turtle.dao.QnaDAO.qnaListAdmin", map);
	}
	
	// 1대1문의 갯수 구하기
	@Override
	public int qnaCnt(Map<String, Object> map) {
		System.out.println("QnaDAOImpl - qnaCnt()");

		return sqlSession.selectOne("com.spring.turtle.dao.QnaDAO.qnaCnt",map);
	}
	
	// 1대1문의 갯수 구하기 관리자
	@Override
	public int adQnaCnt(Map<String, Object> map) {
		System.out.println("QnaDAOImpl - adQnaCnt()");

		return sqlSession.selectOne("com.spring.turtle.dao.QnaDAO.adQnaCnt",map);
	}

	// 1대1문의 상세페이지
	@Override
	public QnaDTO getQnaDetail(int num) {
		System.out.println("QnaDAOImpl - getQnaDetail()");
		
		return sqlSession.selectOne("com.spring.turtle.dao.QnaDAO.getQnaDetail", num);
	}
	
	// 1대1문의 작성
	@Override
	public int insertQna(QnaDTO dto) {
		System.out.println("QnaDAOImpl - insertQna()");
		
		return sqlSession.insert("com.spring.turtle.dao.QnaDAO.insertQna", dto);
	}

	// 1대1문의 수정
	@Override
	public int qnaUpdate(QnaDTO dto) {
		System.out.println("QnaDAOImpl - qnaUpdate()");

		return sqlSession.update("com.spring.turtle.dao.QnaDAO.qnaUpdate", dto);
	}

	// 1대1문의 삭제
	@Override
	public int deleteQna(int num) {
		System.out.println("QnaDAOImpl - deleteQna()");

		return sqlSession.update("com.spring.turtle.dao.QnaDAO.deleteQna", num);
	}

	// 1대1문의 댓글 목록처리
	@Override
	public List<QnaCommentDTO> qnaCommentList(int num) {
		System.out.println("QnaDAOImpl - qnaCommentList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.QnaDAO.qnaCommentList", num);
	}

	// 1대1문의 댓글 작성
	@Override
	public int insertQnaComment(QnaCommentDTO dto) {
		System.out.println("QnaDAOImpl - insertQnaComment()");
		
		return sqlSession.insert("com.spring.turtle.dao.QnaDAO.insertQnaComment", dto);
	}
	
	// 1대1문의 답변처리
	@Override
	public void changeQnaCommentStatus(Map<String, Object> map) {
		System.out.println("QnaDAOImpl - changeQnaCommentStatus()");
		
		sqlSession.update("com.spring.turtle.dao.QnaDAO.changeQnaCommentStatus", map);
	}
	// 1대1문의 댓글 수정
	@Override
	public int updateQnaComment(QnaCommentDTO dto) {
		System.out.println("QnaDAOImpl - updateQnaComment()");
		
		return sqlSession.update("com.spring.turtle.dao.QnaDAO.updateQnaComment", dto);
	}
	
	// 1대1문의 댓글 삭제
	@Override
	public int DeleteQnaComment(int num) {
		System.out.println("QnaDAOImpl - DeleteQnaComment()");
		
		return sqlSession.delete("com.spring.turtle.dao.QnaDAO.DeleteQnaComment", num);
	}

	// 1대1문의 복구
	@Override
	public int adRestoreQna(int num) {
		System.out.println("QnaDAOImpl - adRestoreQna()");
		
		return sqlSession.delete("com.spring.turtle.dao.QnaDAO.adRestoreQna", num);
	}
}