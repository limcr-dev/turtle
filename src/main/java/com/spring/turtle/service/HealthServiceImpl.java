package com.spring.turtle.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.turtle.dao.HealthDAOImpl;
import com.spring.turtle.dto.HealthDTO;
import com.spring.turtle.dto.UserDTO;
import com.spring.turtle.page.Paging10;

@Service
public class HealthServiceImpl implements HealthService{

   @Autowired
   private HealthDAOImpl dao;
   
   // 헬스 트레이너 목록
   @Override
   public void healthJoin(HttpServletRequest request, HttpServletResponse response, Model model)
      throws ServletException, IOException {
	   
	  String userId = (String) request.getSession().getAttribute("sessionID");
	  if(userId == null || userId == "") {
		  return;
	  }
	  
	  int selectCnt = dao.isInserted(userId);
	  
      List<String> list = dao.trainerList();
      
      model.addAttribute("selectCnt", selectCnt);
      model.addAttribute("list", list);
      
   }
   
   // 헬스 회원 등록
   @Override
   public void healthJoinAction(HttpServletRequest request, HttpServletResponse response, Model model)
      throws ServletException, IOException {
      System.out.println("HealthServiceImpl - healthListAction");   
   
         HealthDTO dto = new HealthDTO();
         
         dto.setUserName(request.getParameter("hiddenuserName"));
         dto.setUserId(request.getParameter("hiddenUserid"));
         dto.setUserHp(request.getParameter("hiddenuserHp"));
         
         dto.setHealthStartDate(Date.valueOf(request.getParameter("healthStartDate")));
         System.out.println("healthStartDate" + request.getParameter("healthStartDate"));
         dto.setHealthEndDate(Date.valueOf(request.getParameter("healthEndDate")));
         dto.setPtCnt(Integer.parseInt(request.getParameter("ptCnt")));
         
         dto.setHealthStatus(request.getParameter("healthStatus"));
         
         String trainerId = request.getParameter("trainerId");
         
         if(trainerId != null && trainerId != "") {
        	 dto.setTrainerId(trainerId);
         }
        
         int insertCnt = dao.healthJoin(dto);
         System.out.println("insertCnt = " + insertCnt);
         model.addAttribute("insertCnt", insertCnt);
}         
   //헬스회원 목록
   @Override
   public void healthListAction(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
         
         System.out.println("HealthServiceImpl - healthListAction");
      
         String pageNum = request.getParameter("pageNum");
      
         Paging10 paging = new Paging10(pageNum);
         
         String statusType = "";
         if(request.getParameter("statusType") != null) {
            statusType = request.getParameter("statusType");
         }
         
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("statusType", statusType);
         
         int total = dao.healthCnt(map);
         paging.setTotalCount(total);
         
         int start = paging.getStartRow();
         int end = paging.getEndRow();
         
         map.put("start", start);
         map.put("end", end);
         
         List<HealthDTO> list = dao.healthList(map);
         
         model.addAttribute("statusType", statusType);
         model.addAttribute("list", list);
         model.addAttribute("paging", paging);
   }
   
   //헬스 미결제회원 목록
   @Override
   public void healthUnPayListAction(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      
      System.out.println("HealthServiceImpl - healthUnPayListAction");
      
      String pageNum = request.getParameter("pageNum");
      
      Paging10 paging = new Paging10(pageNum);
      String statusType = "";
      if(request.getParameter("statusType") != null) {
         statusType = request.getParameter("statusType");
      }
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("statusType", statusType);
      
      int total = dao.healthUnPayCnt(map);
      paging.setTotalCount(total);
      
      int start = paging.getStartRow();
      int end = paging.getEndRow();
      
      map.put("start", start);
      map.put("end", end);
      
      List<HealthDTO> list = dao.healthUnPayList(map);
      
      
      model.addAttribute("statusType", statusType);
      model.addAttribute("list", list);
      model.addAttribute("paging", paging);
      
      
   }

   // 헬스 미결제 회원 승인
   @Override
   public void healthUnPayListApprove(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      
      int healthNo = Integer.parseInt(request.getParameter("healthNo"));
      int updateCnt = dao.healthUnPayUpdate(healthNo);
      model.addAttribute("updateCnt", updateCnt);
      
   }
   
   // 헬스회원 등록시(Id 조회)
   @Override
   public void IdCheckAction(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      
      System.out.println("HealthServiceImpl - IdCheckAction");
      
      String userId = request.getParameter("userId");
      
      int selectCnt = dao.isInserted(userId);
      
      if(selectCnt == 0) {
	      UserDTO dto = dao.userIdCheck(userId);
	      model.addAttribute("dto", dto);
      }
      
	  model.addAttribute("selectCnt", selectCnt);
	  model.addAttribute("userId", userId);

   }
   
   // 헬스 트레이너 목록
   @Override
   public void healthInsert(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      List<String> list = dao.trainerList();
      model.addAttribute("list", list);
   }

   
   // 헬스 회원 등록 
   @Override
   public void healthInsertAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("HealthServiceImpl - healthListAction");   
      
      MultipartFile file = request.getFile("hmImg");
      
      
      String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/healthMember/");
      String realDir = "D:\\DEV\\workspace_team_pj\\team_pj\\turtle\\src\\main\\webapp\\resources\\images\\healthMember\\";
      
      FileInputStream fis = null;
      FileOutputStream fos = null;
      
      try {
         file.transferTo(new File(saveDir + file.getOriginalFilename()));
         fis = new FileInputStream(saveDir + file.getOriginalFilename());
         fos = new FileOutputStream(realDir + file.getOriginalFilename());
         
         int data = 0;
         while((data = fis.read()) != -1) {
            fos.write(data);
            }
         
         HealthDTO dto = new HealthDTO();
         
         
         
         dto.setUserName(request.getParameter("hiddenuserName"));
         dto.setUserId(request.getParameter("hiddenUserid"));
         dto.setUserHp(request.getParameter("hiddenuserHp"));
         
         String HmImg = "/turtle/resources/images/healthMember/" + file.getOriginalFilename();
         dto.setHealthImg(HmImg);
         dto.setHealthStartDate(Date.valueOf(request.getParameter("healthStartDate")));
         dto.setHealthEndDate(Date.valueOf(request.getParameter("healthEndDate")));
         dto.setPtCnt(Integer.parseInt(request.getParameter("ptCnt")));
         dto.setHealthStatus(request.getParameter("healthStatus"));
         
         String trainerId = request.getParameter("trainerId");
         
         if(trainerId != null && trainerId != "") {
        	 dto.setTrainerId(trainerId);
         }
         
         int insertCnt = dao.healthInsert(dto);
         model.addAttribute("insertCnt", insertCnt);
         
         }catch(IOException e) {
        	 e.printStackTrace();
         }finally {
	         if(fis != null)fis.close();
	         if(fos != null)fos.close();
         }
      
      
   }
   
   // 헬스회원 수정(상세내용)
   @Override
   public void healthDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("HealthServiceImpl - healthDetailAction");
      

      int healthNo = Integer.parseInt(request.getParameter("healthNo"));
      int pageNum = Integer.parseInt(request.getParameter("pageNum"));
      
      List<String> list = dao.trainerList();
      model.addAttribute("list", list);
      
      HealthDTO dto = dao.healthDetail(healthNo);
      
      model.addAttribute("list", list);
      model.addAttribute("dto", dto);
      model.addAttribute("pageNum", pageNum);
      
   }
   
   //헬스회원 수정
   @Override
   public void healthUpdateAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("HealthServiceImpl - healthUpdateAction");
   
      String hiddenPageNum =  request.getParameter("hiddenPageNum"); 
      int hiddenHealthNo = Integer.parseInt(request.getParameter("hiddenHealthNo"));
      String hiddenHmImg = request.getParameter("hiddenHmImg");
      
      MultipartFile file = request.getFile("hmImg");
      
      
      String saveDir = request.getSession().getServletContext().getRealPath("/resources/images/healthMember/");
      String realDir = "D:\\DEV\\workspace_team_pj\\team_pj\\turtle\\src\\main\\webapp\\resources\\images\\healthMember\\";
      
      FileInputStream fis = null;
      FileOutputStream fos = null;
      
      String hm_Img = "";
      
      if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
         try {
            file.transferTo(new File(saveDir + file.getOriginalFilename()));
            fis = new FileInputStream(saveDir + file.getOriginalFilename());
            fos = new FileOutputStream(realDir + file.getOriginalFilename());
            
            int data = 0;
            while((data = fis.read()) != -1) {
               fos.write(data);
            }
            hm_Img = "/turtle/resources/images/healthMember/" + file.getOriginalFilename();
         }catch(IOException e) {
            e.printStackTrace();
         }finally {
            if(fis != null)fis.close();
            if(fos != null)fos.close();
         }
         
         
      } else {
         hm_Img = hiddenHmImg;
      }
         
         HealthDTO dto = new HealthDTO();
         
         dto.setHealthNo(hiddenHealthNo);
         dto.setUserName(request.getParameter("userName"));
         dto.setUserId(request.getParameter("userId"));
         
         String userHp = "";
         String userHp1 = request.getParameter("userHp1");
         String userHp2 = request.getParameter("userHp2");
         String userHp3 = request.getParameter("userHp3");
         
         if(!userHp1.equals("") && !userHp2.equals("") && !userHp3.equals("")) {
            userHp = userHp1 + "-" + userHp2 + "-" + userHp3;
         }

         dto.setUserHp(userHp);
         dto.setHealthImg(hm_Img);
         
         dto.setPtCnt(Integer.parseInt(request.getParameter("ptCnt")));
         dto.setHealthStartDate(Date.valueOf(request.getParameter("healthStartDate")));
         dto.setHealthEndDate(Date.valueOf(request.getParameter("healthEndDate")));
         dto.setHealthStatus(request.getParameter("healthStatus"));
         String trainerId = request.getParameter("trainerId");
         
         if(trainerId != null && trainerId != "") {
        	 dto.setTrainerId(trainerId);
         }
         
         int updateCnt = dao.healthUpdate(dto);
         model.addAttribute("updateCnt", updateCnt);
      
      model.addAttribute("hiddenPageNum", hiddenPageNum);
      model.addAttribute("hiddenHealthNo", hiddenHealthNo);
   }
   //헬스회원 
   @Override
   public void healthDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
         throws ServletException, IOException {
      System.out.println("HealthServiceImpl - healthDeleteAction");
      
      int healthNo= Integer.parseInt(request.getParameter("healthNo"));
      
      int deleteCnt = dao.healthDelete(healthNo);
      
      model.addAttribute("deleteCnt", deleteCnt);
   }

}
