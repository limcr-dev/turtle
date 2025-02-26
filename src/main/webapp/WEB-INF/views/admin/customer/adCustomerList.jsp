<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adCustomerList</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
   $(function() {
      // 조회
      $(".selectCustomer").click(function(){
         
         var userId = $(this).closest("tr").find(".userId").text().trim();
         
         document.customerListForm.action = "${path}/adCustomerDetail.ad?userId=" + userId;
         document.customerListForm.submit();
      });
      
      // 체크박스 클릭 시 회원 전체 선택
      $("#checkboxAll").change(function() {
          $(".selectCheck").prop("checked", $(this).prop("checked"));
       });

       // 체크된 userId들을 hidden input에 저장하는 함수
       function getSelectedUserIds() {
           var selectedUserIds = [];
           $(".selectCheck:checked").each(function() {
               selectedUserIds.push($(this).val());
           });

           if (selectedUserIds.length == 0) {
               alert("선택된 회원이 없습니다.");
               return;
           }

           $("#hiddenUserIds").val(selectedUserIds.join(","));
           document.customerListForm.action = "${path}/adCustomerDelete.ad";
           document.customerListForm.submit();
       }
      
      // 셀렉트 박스 선택 시 구분된 목록 조회
      $(document).ready(function(){
          $("#selectUserType").change(function(){
              var userType = $(this).val();
              var userShow = $("#selectUserShow").val();
              var url = "${path}/adCustomerList.ad";
              var param = [];
              
              if (userType) {
               param.push("userType=" + userType);
            }
            if (userShow) {
               param.push("userShow=" + userShow);
            }
              
              if (userType != "") {
                  url += "?" + param.join("&");
              }
               location.href = url;

          });
          
          // 삭제여부
          $("#selectUserShow").change(function(){
             $("#selectUserType"). trigger("change");
             });
      });
      
      // 삭제
      $("#deleteCustomer").click(function(){
         if (getSelectedUserIds() !== null) {
               document.customerListForm.action = "${path}/adCustomerDelete.ad";
               document.customerListForm.submit();
           }
      });
      
      // 트레이너 지정
      $("#updateTrainer").click(function(){
         if (getSelectedUserIds() !== null) {
               document.customerListForm.action = "${path}/userToTrainerAction.ad";
               document.customerListForm.submit();
           }
      });
      
      // 관리자
      $("#updateAdmin").click(function(){
         if (getSelectedUserIds() !== null) {
               document.customerListForm.action = "${path}/userToAdminAction.ad";
               document.customerListForm.submit();
           }
      });
      
      // 일반회원
      $("#updateCustomer").click(function(){
         if (getSelectedUserIds() !== null) {
               document.customerListForm.action = "${path}/updateCutomerAction.ad";
               document.customerListForm.submit();
           }
      });
   });
</script>
</head>
<body>
   <div class="wrap"> <!-- 스타일을 해주려고 class명을 지정함  -->
      <!-- header 시작 -->
      <%@include file= "/WEB-INF/views/common/header.jsp"%>
      <!-- header 끝 -->
      
      <!-- 컨텐츠 시작 -->
      <div id="container">
         <div id="contents">
            <!-- 상단 중앙1 시작 -->
            <div>
            <hr>
            <h1 align="center">회원 목록</h1>
            <hr>
            </div>
            <!-- 상단 중앙1 종료 -->
         
            <!-- 상단 중앙2 시작 -->
            <div id="section2">
   
               <!-- 좌측 메뉴 시작 -->                              
               <%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
               <!-- 좌측메뉴 종료 -->
               <!-- 우측매뉴 시작 -->
               <form name ="customerListForm" method="post" style="width:7000px;">
                  <table class="table">
                     <thead>
                        <tr>
                           <th scope="col"><input type="checkbox" id="checkboxAll"></th>
                           <th scope="col" style="text-align:center;">ID</th>
                           <th scope="col" style="text-align:center;">이름</th>
                           <!-- userDTO에 성별 추가 되면 추가할 예정
                           <th scope="col" style="text-align:center;">성별</th> -->
                           <th scope="col" style="text-align:center;">가입일</th>
                           <td> 
                              <select name="userType" id="selectUserType">
                                 <option value="" <c:if test="${userType == ''}">selected</c:if>>회원구분</option>
                                 <option value="admin" <c:if test="${userType == 'admin'}">selected</c:if>>관리자</option>
                                 <option value="trainer" <c:if test="${userType == 'trainer'}">selected</c:if>>트레이너</option>
                                 <option value="user" <c:if test="${userType == 'user'}">selected</c:if>>일반회원</option>
                              </select>
                           </td>
                           <!-- 삭제여부 추후 추가 --> 
                           <td> 
                              <select name="userShow" id="selectUserShow">
                                 <option value="" <c:if test="${userShow == ''}">selected</c:if>>삭제여부</option>
                                 <option value="Y" <c:if test="${userShow == 'Y'}">selected</c:if>>Y</option>
                                 <option value="N" <c:if test="${userShow == 'N'}">selected</c:if>>N</option>
                              </select>
                           </td>
                           <th scope="col">조회</th>
                        </tr>
                     </thead>
                     <tbody class="table-group-divider">
                        <c:forEach var="dto" items="${list}">
                           <tr>
                              <td><input type="checkbox" class="selectCheck" value="${dto.userId}"></td>
                              <td class="userId" style="width:300px; text-align:center; vertical-align:middle;">${dto.userId}</td>
                              <td style="width:300px; text-align:center; vertical-align:middle;">${dto.userName}</td>
                              <%-- <c:if test="${dto.userGender == 'F'}" >
                                 <td style="width:300px; text-align:left">여자</td>
                              </c:if>
                              <c:if test="${dto.userGender == 'M'}" >
                                 <td style="width:300px; text-align:left">남자</td>
                              </c:if> --%>
                              <td style="width:400px; text-align:center; vertical-align:middle;">${fn:substring(dto.userRegDate, 0, 16)}</td>
                              <c:if test="${dto.userType == 'admin'}" >
                                 <td style="width:200px; text-align:center; vertical-align:middle;">관리자</td>
                              </c:if>
                              <c:if test="${dto.userType == 'user'}">
                                 <td style="width:200px; text-align:center; vertical-align:middle;">일반회원</td>
                              </c:if>
                              <c:if test="${dto.userType == 'trainer'}">
                                 <td style="width:200px; text-align:center; vertical-align:middle;">트레이너</td>
                              </c:if>
                              <td style="width:50px; text-align:center; vertical-align:middle;">${dto.userShow}</td>
                              <td style="width:100px; text-align:center; vertical-align:middle;"><button type="button" class="selectCustomer btn active" data-bs-toggle="button" aria-pressed="true">조회</button></td>
                           </tr>
                        </c:forEach>
                     </tbody>
                     <tr>
                          <td colspan="10" class="text-end">
                             <input type="hidden" name="userIds" id="hiddenUserIds">
                             <input type="hidden" name="hidden_userId" value="${dto.userId}">
                             <input type="hidden" name="userType" value="${dto.userType}">
                             <input type="hidden" name="userShow" id="hiddenUserShow" value="${dto.userShow}">
                             <button type="button" id="updateTrainer" class="btn active" data-bs-toggle="button" aria-pressed="true">트레이너</button>
                             <button type="button" id="updateAdmin" class="btn active" data-bs-toggle="button" aria-pressed="true">관리자</button>
                             <button type="button" id="updateCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">일반회원</button>
                             <button type="button" id="deleteCustomer" class="btn active" data-bs-toggle="button" aria-pressed="true">삭제</button>
                          </td>
                     </tr>
                  </table>
            
                  <!-- 페이지컨트롤 시작 -->
                  <c:if test="${paging.count != 0}">
                     <div style="width:1000px; margin:auto" >
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <c:if test="${paging.startPage > 10}">
                                        <a class="page-link" href="${path}/adCustomerList.ad?pageNum=${paging.prev}" aria-label="Previous">
                                             <span aria-hidden="true">&laquo;</span>
                                        </a>
                                     </c:if>
                                 </li>
                                 
                                 <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                                    <li class="page-item"><a class="page-link" href="${path}/adCustomerList.ad?pageNum=${num}&userType=${userType}&userShow=${userShow}">${num}</a></li>
                                 </c:forEach>
                              
                                 <li class="page-item">
                                    <c:if test="${paging.endPage < paging.pageCount}">
                                        <a class="page-link" href="${path}/adCustomerList.ad?pageNum=${paging.next}" aria-label="Next">
                                             <span aria-hidden="true">&raquo;</span>
                                        </a>
                                     </c:if>
                                  </li>
                              </ul>
                           </nav>
                     </div>
                  </c:if>
                  <!-- 페이지컨트롤 끝 -->
               </form>   
            </div>
         </div>
         <!-- 컨텐츠 끝 -->
         <hr>
      </div>
   </div>
   <!-- footer 시작 -->
   <%@ include file="/WEB-INF/views/common/footer.jsp" %>
   <!-- footer 끝 -->
</body>
</html>
