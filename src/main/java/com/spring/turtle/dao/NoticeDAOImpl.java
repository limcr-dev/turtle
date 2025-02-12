package com.spring.turtle.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.turtle.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession; 

	// 공지사항 목록
	@Override
	public List<NoticeDTO> noticeList(Map<String, Object> map) {
		System.out.println("DAO - noticeList()");
		
		List<NoticeDTO> list = sqlSession.selectList("com.spring.turtle.dao.NoticeDAO.noticeList", map);
		
		return list;
	}

	// 공지사항 갯수
	@Override
	public int noticeCnt() {
		System.out.println("DAO - noticeCnt()");
		
		int total = sqlSession.selectOne("com.spring.turtle.dao.NoticeDAO.noticeCnt");
				
		return total;
	}

	// 조회수 증가
	@Override
	public void plusReadCnt(int noticeNo) {
		System.out.println("DAO - plusReadCnt()");
		
		sqlSession.update("com.spring.turtle.dao.NoticeDAO.plusReadCnt", noticeNo);
	}

	// 공지사항 상세페이지
	@Override
	public NoticeDTO getNoticeDetail(int noticeNo) {
		System.out.println("DAO - getNoticeDetail()");
		
		NoticeDTO dto = sqlSession.selectOne("com.spring.turtle.dao.NoticeDAO.getNoticeDetail", noticeNo);
		
		return dto;
	}

	// 공지사항 작성
	@Override
	public int insertNotice(NoticeDTO dto) {
		System.out.println("DAO - insertNotice()");
		
		int insertCnt = sqlSession.insert("com.spring.turtle.dao.NoticeDAO.insertNotice", dto);
		
		return insertCnt;
	}

	// 공지사항 수정
	@Override
	public int updateNotice(NoticeDTO dto) {
		System.out.println("DAO - updateNotice()");

		int updateCnt = sqlSession.update("com.spring.turtle.dao.NoticeDAO.updateNotice", dto);
		
		return updateCnt;
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		System.out.println("DAO - deleteNotice()");
		
		int deleteCnt = sqlSession.update("com.spring.turtle.dao.NoticeDAO.deleteNotice", noticeNo);
		
		return deleteCnt;
	}
}
