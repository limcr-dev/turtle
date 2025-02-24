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
		String userType = request.getParameter("userType");
		String userShow = request.getParameter("userShow");
		
		Paging10 paging = new Paging10(pageNum);
		int total = 0; 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (userShow != null && !userShow.isEmpty()) {
			map.put("userShow", userShow);
			total = dao.customerCntShow(map);
	    }
		
		if (userType != null) {
			map.put("userType", userType);
	        total = dao.customerCntType(map); // 특정 유형 회원 수 조회
	    } else {
	    	total = dao.customerCnt(); // 전체 회원 수 조회
	    }
		
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		List<UserDTO> list = dao.customerList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("userType", userType);
		model.addAttribute("userShow", userShow);
	}

	// 회원 정보 조회
	@Override
	public void customerDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - customerDetail()");
		
		String userId = request.getParameter("userId");
		
		UserDTO dto = new UserDTO();
		
		dto = dao.getCustomerDetail(userId);
		
		model.addAttribute("dto", dto);
	}
	
	// 회원 트레이너 지정
	@Override
	public void userToTrainer(String[] userIds)
			throws ServletException, IOException {
		System.out.println("서비스 - userToAdmin()");
		
		dao.updateTrainer(userIds);
	}

	// 회원 관리자 지정
	@Override
	public void userToAdmin(String[] userIds)
			throws ServletException, IOException {
		System.out.println("서비스 - userToAdmin()");
		
		dao.updateAdmin(userIds);
	}
	
	// 회원 관리자 지정
	@Override
	public void updateCustomer(String[] userIds)
			throws ServletException, IOException {
		System.out.println("서비스 - updateCustomer()");
		
		dao.updateCustomer(userIds);
	}

	// 회원 삭제
	@Override
	public void customerDelete(String[] userIds)
			throws ServletException, IOException {
		System.out.println("서비스 - customerDelete()");
		
		dao.deleteCustomer(userIds);
	}
	
	// 회원 복구
	@Override
	public void customerRestore(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - customerRestore()");
		
		String userId = request.getParameter("hidden_userId");
	      
	      dao.restoreCustomer(userId);;
	}
}
