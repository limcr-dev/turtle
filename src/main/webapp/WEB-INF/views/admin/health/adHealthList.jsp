<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adHealthList</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function(){
		$("#btnInsert").click(function(){
			location.href="${path}/adHealthInsert.ad";
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
					<h1 align="center">헬스 회원 목록</h1>
					<hr>
				</div>
				<!-- 상단 중앙1 종료 -->
				
				<!-- 상단 중앙2 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->               					
					<%@ include file= "/WEB-INF/views/common/leftmenu.jsp" %>
					<!-- 좌측 메뉴 종료 -->
						
						<!-- 우측 화면 시작 -->
						<table class = "table">
							<tr>
								<th scope="col">회원번호</th>
								<th scope="col">회원 이미지</th>
								<th scope="col">이름</th>
								<th scope="col">전화번호</th>
								<th scope="col">유형</th>
								<th scope="col">등록기간</th>
							</tr>
						
						
						<c:forEach var='dto' items="${list}">
							<tr>
								<td>${dto.healthNo}</td>
								<td><img src = "${dto.healthImg}" width="100px"></td>
								<td>${dto.userName}</td>
								<td>${dto.userHp}</td>
								<td>${dto.healthStatus}</td>
								<td>
									${dto.healthStartDate} ~ ${dto.healthEndDate}
								</td>
								<td>
									<input class="" type="button" value="수정"
									onclick="window.location = '${path}/adHealthDetailAction.ad?healthNo=${dto.healthNo}&pageNum=${paging.currentPage}'">
									<input class="" type="button" value="삭제"
									onclick="window.location = '${path}/adHealthDeleteAction.ad?healthNo=${dto.healthNo}'">
								</td>
							</tr>
						</c:forEach>
						
							<tr>
	                            <td colspan=11" align="center">
	                                <ul class="pagination">
	                                    <!-- 이전 버튼 -->
	                                    <c:if test="${paging.startPage > paging.pageSize}">
	                                        <li><a href="${path}/ad_product_list.pd?pageNum=${paging.prev}" class="prevPage">«</a></li>
	                                    </c:if>
	                                    
	                                    <!-- 페이징 번호 -->
	                                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                                        <li>
	                                            <a href="${path}/ad_product_list.pd?pageNum=${num}" 
	                                               class="<c:if test='${num == paging.currentPage}'>active</c:if>">${num}</a>
	                                        </li>
	                                    </c:forEach>
	                                    
	                                    <!-- 다음 버튼 -->
	                                    <c:if test="${paging.endPage < paging.pageCount}">
	                                        <li><a href="${path}/ad_product_list.pd?pageNum=${paging.next}" class="nextPage">»</a></li>
	                                    </c:if>
	                                </ul>
	                            </td>
	                        </tr> 
                                       
                            <tr>
                               <td colspan=11" align="center">
                                  <input type="button" class="inputButton" value="등록" id="btnInsert">
                               </td>
                            </tr>
					</table>
						<!-- 우측 화면 종료 -->		
								
				<!-- 상단 중앙2 종료 -->
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