package com.spring.turtle.service;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.turtle.dao.UserDAOImpl;
import com.spring.turtle.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAOImpl dao;
	
	// ID 중복확인 처리
	@Override
	public void idConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - idConfirmAction()");
		
		String userId = request.getParameter("userId");
		
		int selectCnt = dao.useridCheck(userId);
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("userId", userId);
		
	}
	
	// Email 중복확인 처리
	@Override
	public void emailConfirmAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - emailConfirmAction()");
		
		String userEmail = request.getParameter("userEmail");
		
		int selectCnt = dao.useremailCheck(userEmail);
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("userEmail", userEmail);
		
	}
	
	// Email 중복확인 처리
	@Override
	public void emailConfirmAction2(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - emailConfirmAction2()");
		
		String userEmail = request.getParameter("userEmail");
		
		model.addAttribute("userEmail", userEmail);
		
	}
	
	// 회원가입처리
	@Override
	public void signInAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - signInAction()");
		
		UserDTO dto = new UserDTO();
		dto.setUserId(request.getParameter("userId"));
		dto.setUserPw(request.getParameter("userPw"));
		dto.setUserName(request.getParameter("userName"));
		dto.setUserGender(request.getParameter("userGender"));
		dto.setUserBirthday(Date.valueOf(request.getParameter("userBirthday")));
		dto.setUserAddress(request.getParameter("userAddress"));
		
		String userHp1 = request.getParameter("userHp1");
		String userHp2 = request.getParameter("userHp2");
		String userHp3 = request.getParameter("userHp3");
		String userHp = "";
		if(!userHp1.equals("") && !userHp2.equals("") && !userHp3.equals("")) {
			userHp = userHp1 + "-" + userHp2 + "-" + userHp3;
		}
		
		dto.setUserHp(userHp);
		
		String userEmail1 = request.getParameter("userEmail1");
		String userEmail2 = request.getParameter("userEmail2");
		String userEmail = userEmail1 + "@" + userEmail2;
				
		dto.setUserEmail(userEmail);
		dto.setUserType(request.getParameter("userType"));	// 회원-U/관리자-A 구분
		
		int insertCnt = dao.insertUser(dto);
		
		model.addAttribute("insertCnt", insertCnt);
	}
	
	// 로그인처리 (회원정보인증)
	@Override
	public void loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - loginAction()");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", userPw);

		int selectCnt = dao.idPwChk(map);
		
		// 로그인 성공 시 sessionID 값 전달
		if(selectCnt == 1) {
			request.getSession().setAttribute("sessionID", userId);
			
			// userType 불러와서 sessionType 값 전달
			String userType = dao.getUserType(userId);
			request.getSession().setAttribute("sessionType", userType);
		}
		
	}
	
	// 회원 상세정보 불러오기(mypage)
	public void userDetail(HttpServletRequest request, HttpServletResponse response, Model model) {
		System.out.println("서비스 - getUserType()");
		
		String userId = (String)request.getSession().getAttribute("sessionID");

		UserDTO dto = new UserDTO();
		dto = dao.userDetail(userId);
		model.addAttribute("dto", dto);
	}
	
	// 회원정보 인증후 상세페이지
	@Override
	public void modifyDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - modifyDetailAction()");
		
		String userId = (String)request.getSession().getAttribute("sessionID");
		String userPw = request.getParameter("userPw");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		
		int selectCnt = dao.idPwChk(map);
		
		UserDTO dto = null;
		
		if(selectCnt == 1) {
			dto = dao.userDetail(userId);
		}
		System.out.println("dto : " + dto);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("dto", dto);
		
	}
	
	// 회원정보 수정 처리
	@Override
	public void modifyUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - modifyUserAction()");
		
		UserDTO dto = new UserDTO();
		String userId = request.getParameter("hiddenUserId");
		String sessionID = (String)request.getSession().getAttribute("sessionID");
		
		// 주소 api 세션 끊김 현상 해결
		if(sessionID == null || sessionID == "") {
			request.getSession().setAttribute("sessionID", userId);
			String userType = dao.getUserType(userId);
			request.getSession().setAttribute("sessionType", userType);
			
		} else {
			
			dto.setUserPw(request.getParameter("userPw"));
			dto.setUserName(request.getParameter("userName"));
			dto.setUserAddress(request.getParameter("userAddress"));
			dto.setUserBirthday(Date.valueOf(request.getParameter("userBirthday")));
			
			String userHp1 = request.getParameter("userHp1");
			String userHp2 = request.getParameter("userHp2");
			String userHp3 = request.getParameter("userHp3");
			String userHp = "";
			if(!userHp1.equals("") && !userHp2.equals("") && !userHp3.equals("")) {
				userHp = userHp1 + "-" + userHp2 + "-" + userHp3;
			}
			
			dto.setUserHp(userHp);
			
			String userEmail1 = request.getParameter("userEmail1");
			String userEmail2 = request.getParameter("userEmail2");
			String userEmail = userEmail1 + "@" + userEmail2;
			
			dto.setUserEmail(userEmail);
			
			dto.setUserId(userId);
			
			System.out.println("dto" + dto);
			
			int updateCnt = dao.updateUser(dto);
			
			model.addAttribute("updateCnt", updateCnt);
			model.addAttribute("dto", dto);
			}
	}
	
	// 회원정보 인증후 탈퇴 처리
	@Override
	public void deleteUserAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - deleteUserAction()");
		
		int deleteCnt = 0;
		
		String userId = (String)request.getSession().getAttribute("sessionID");
		String userPw = request.getParameter("userPw");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		
		int selectCnt = dao.idPwChk(map);
		if(selectCnt == 1 ) {
			deleteCnt = dao.deleteUser(userId);
			if(deleteCnt == 1) {
				request.getSession().invalidate(); // 세션삭제
			}
		}
		
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("deleteCnt", deleteCnt);
	}

}
