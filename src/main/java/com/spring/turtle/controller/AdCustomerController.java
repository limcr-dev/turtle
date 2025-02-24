package com.spring.turtle.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.turtle.service.AdCustomerServiceImpl;

@Controller
public class AdCustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdCustomerController.class);
	
	@Autowired
	private AdCustomerServiceImpl service;
	
	// 관리자메인
	@RequestMapping("/adMain.ad")
	public String adMain() {
		logger.info("<<< url ==>  /adMain.ad >>>");
		return "admin/common/adMain";
	}
	
	// 회원 목록
	@RequestMapping("/adCustomerList.ad")
	public String adCustomerList(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adCustomerList.ad >>>");
		
		service.customerList(request, response, model);
		
		return "admin/customer/adCustomerList";
	}	
	
	// 회원 정보 조회
	@RequestMapping("/adCustomerDetail.ad")
	public String adCustomerDetail(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adNoticeDetail.ad >>>");

		service.customerDetail(request, response, model);
		
		return "admin/customer/adCustomerDetail";
	}
	
	// 체크박스 회원 트레이너 지정
	@RequestMapping("/userToTrainerAction.ad")
	public String userToTrainer(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /userToTrainerAction.ad >>>");
		
		String[] userIds = request.getParameter("userIds").split(",");

		if (userIds == null || userIds.length == 0) {
	        return "redirect:/adCustomerList.ad";
	    }
		
		service.userToTrainer(userIds);
		
		return "redirect:/adCustomerList.ad";
	}
	
	// 체크박스 회원 관리자 지정
	@RequestMapping("/userToAdminAction.ad")
	public String userToAdmin(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /userToAdminAction.ad >>>");
		
		String[] userIds = request.getParameter("userIds").split(",");
		
		if (userIds == null || userIds.length == 0) {
	        return "redirect:/adCustomerList.ad";
	    }
		
		service.userToAdmin(userIds);
		
		return "redirect:/adCustomerList.ad";
	}
	
	// 체크박스 일반 회원 지정
	@RequestMapping("/updateCutomerAction.ad")
	public String updateCustomer(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /updateCutomerAction.ad >>>");
		
		String[] userIds = request.getParameter("userIds").split(",");
		
		if (userIds == null || userIds.length == 0) {
	        return "redirect:/adCustomerList.ad";
	    }
		
		service.updateCustomer(userIds);
		
		return "redirect:/adCustomerList.ad";
	}
	
	// 체크박스 회원 삭제
	@RequestMapping("/adCustomerDelete.ad")
	public String adCustomerDelete(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes)
    		throws ServletException, IOException {
		logger.info("<<< url ==>  /adCustomerDelete.ad >>>");
		
		String[] userIds = request.getParameter("userIds").split(",");
		
		if (userIds == null || userIds.length == 0) {
	        return "redirect:/adCustomerList.ad";
	    }
		
		service.customerDelete(userIds);
		
		return "redirect:/adCustomerList.ad";
	}
	
	// 회원 복구
   @RequestMapping("/adCustomerRestore.ad")
   public String adCustomerDelete(HttpServletRequest request, HttpServletResponse response, Model model)
          throws ServletException, IOException {
      logger.info("<<< url ==>  /adCustomerRestore.ad >>>");

      service.customerRestore(request, response, model);
      
      String viewPage = request.getContextPath() + "/adCustomerList.ad";
      response.sendRedirect(viewPage);
      
      return "admin/customer/adCustomerList";
   }
}
