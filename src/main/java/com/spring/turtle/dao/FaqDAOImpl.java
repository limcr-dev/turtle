package com.spring.turtle.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.FaqDTO;

@Repository
public class FaqDAOImpl implements FaqDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	// FAQ 목록
	@Override
	public List<FaqDTO> faqList(String category) {
		System.out.println("FaqDAOImpl - faqList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.FaqDAO.faqList", category);
	}
	
	// FAQ 목록 관리자
	@Override
	public List<FaqDTO> adFaqList(String category) {
		System.out.println("FaqDAOImpl - adFaqList()");
		
		return sqlSession.selectList("com.spring.turtle.dao.FaqDAO.adFaqList", category);
	}
	
	// FAQ 작성
	@Override
	public int adInsertFaq(FaqDTO dto) {
		System.out.println("FaqDAOImpl - adInsertFaq()");
		
		return sqlSession.insert("com.spring.turtle.dao.FaqDAO.adInsertFaq", dto);
	}
	
	// FAQ 상세페이지
	@Override
	public FaqDTO getFaqDetail(int faqNo) {
		System.out.println("FaqDAOImpl - getFaqDetail()");
		
		return sqlSession.selectOne("com.spring.turtle.dao.FaqDAO.getFaqDetail", faqNo);
	}
	// FAQ 수정
	@Override
	public int adUpdateFaq(FaqDTO dto) {
		System.out.println("FaqDAOImpl - adUpdateFaq()");
		
		return sqlSession.update("com.spring.turtle.dao.FaqDAO.adUpdateFaq", dto);
	}
	
	// FAQ 삭제
	@Override
	public int adDeleteFaq(int num) {
		System.out.println("FaqDAOImpl - adDeleteFaq()");
		
		return sqlSession.update("com.spring.turtle.dao.FaqDAO.adDeleteFaq", num);
	}
	
	// FAQ 복구
	@Override
	public int adRestoreFaq(int num) {
		System.out.println("FaqDAOImpl - adRestoreFaq()");
		
		return sqlSession.update("com.spring.turtle.dao.FaqDAO.adRestoreFaq", num);
	}
}