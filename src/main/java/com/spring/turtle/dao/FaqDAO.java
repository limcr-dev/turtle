package com.spring.turtle.dao;

import java.util.List;

import com.spring.turtle.dto.FaqDTO;

public interface FaqDAO {

	// ------FAQ------
	// FAQ 목록
	public List<FaqDTO> faqList(String category);
	
	// FAQ 목록 관리자
	public List<FaqDTO> adFaqList(String category);
	
	// FAQ 작성
	public int adInsertFaq(FaqDTO dto);
	
	// FAQ 상세페이지
	public FaqDTO getFaqDetail(int faqNo);
	
	// FAQ 수정
	public int adUpdateFaq(FaqDTO dto);
	
	// FAQ 삭제
	public int adDeleteFaq(int num);
	
	// FAQ 복구
	public int adRestoreFaq(int num);
}