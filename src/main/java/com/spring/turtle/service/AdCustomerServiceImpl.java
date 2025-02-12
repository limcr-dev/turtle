package com.spring.turtle.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.turtle.dao.AdCustomerDAOImpl;
import com.spring.turtle.dto.UserDTO;
import com.spring.turtle.page.Paging10;

@Service
public class AdCustomerServiceImpl implements AdCustomerService{
	
	@Autowired
	private AdCustomerDAOImpl dao;
	
	// 회원 목록
	@Override
	public void customerList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - customerList()");
		
		String pageNum = request.getParameter("pageNum");
		
		Paging10 paging = new Paging10(pageNum);
		int total = dao.customerCnt();
		
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<UserDTO> list = dao.customerList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
	}

	// 회원 정보 조회
	@Override
	public void customerDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - customerDetail()");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		UserDTO dto = new UserDTO();
		
		dto = dao.getCustomerDetail(userNo);
		
		System.out.println("dto ===> " + dto);
		System.out.println("userNo ===> " + userNo);
		
		model.addAttribute("dto", dto);
	}

	// 회원 관리자 지정
	@Override
	public void userToAdmin(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - userToAdmin()");
		
	}

	// 회원 삭제
	@Override
	public void customerDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - customerDelete()");
		
		int userNo = Integer.parseInt(request.getParameter("hidden_noticeNo"));
		
		dao.deleteCustomer(userNo);
	}
}
