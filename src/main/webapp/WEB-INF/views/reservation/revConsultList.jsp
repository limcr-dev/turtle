<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약</title>
<!-- revConsult.js -->
<script src="${path}/resources/js/reservation/revConsult.js" defer></script>

<!-- calendar.js, calender.css -->
<script src="${path}/resources/js/reservation/calendar.js" defer></script>
<link href='${path}/resources/css/common/calendar.css' rel='stylesheet' />

<!-- FullCalendar 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>

<!-- FullCalendar 언어 CDN --> 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/locales-all.min.js'></script>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
		
		<!-- 세션이 없는 경우 : 예약 불가로 alert창 띄운 후, 로그인 페이지로 이동 -->
		<c:if test="${sessionScope.sessionID == null || sessionScope.sessionID == ''}">
			<script type="text/javascript">
				alert("로그인 후 이용해주세요.");
				window.location="${path}/login.do"
			</script>
		</c:if>
		
		<c:if test="${sessionScope.sessionID != null}">
			<h3 align="center">상담 예약 조회</h3>
			<br><br>
			
			<table class="table" style="width:1000px; margin:auto;"  align="center">
				<thead>
				    <tr align="center">
						<th scope="col" style="width:5%">번호</th>
				        <th scope="col" style="width:10%">아이디</th>
				        <th scope="col" style="width:10%">예약자</th>
				        <th scope="col" style="width:20%">전화번호</th>
				        <th scope="col" style="width:15%">예약일</th>
				        <th scope="col" style="width:10%">예약시간</th>
				        <th scope="col" style="width:10%">상태</th>
				        <th scope="col" style="width:10%"></th>
				    </tr>
				</thead>
			    <tbody>
			    	<c:if test="${paging.count == 0}">
						<tr>
							<td colspan="8" align="center">상담 예약이 존재하지 않습니다.</td>
						</tr>
					</c:if>
				    <c:forEach var="dto" items="${list}" >
						<tr align="center">
							<th scope="row">${dto.revConsultNo}</th>
					        <td>${dto.userId}</td>
					        <td>${dto.userName}</td>
					        <td>${dto.userHp}</td>
					        <td>${fn:substring(dto.revConsultDate, 0, 10)}</td>
					        <td>${fn:substring(dto.revConsultDate, 10, 16)}</td>
					        <td>${dto.revConsultStatus}</td>
					        <td>
						        <c:if test="${dto.revConsultStatus == '대기' || dto.revConsultStatus == '승인'}">
						        	<input type="submit" value="취소" class="btn btn-dark" onclick="window.location='${path}/revConsultDelete.do?revConsultNo=${dto.revConsultNo}'">
						   		</c:if>
					   		</td>
					    </tr>
				    </c:forEach>
				</tbody>
			</table>
			<br>
			
			<c:if test="${paging.count != 0}">	
				<!-- 페이지컨트롤 시작 -->
				<div style="width:1000px; margin:auto" >
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item">
								<c:if test="${paging.startPage > 10}">
								    <a class="page-link" href="${path}/revConsultList.do?pageNum=${paging.prev}" aria-label="Previous">
								      <span aria-hidden="true">&laquo;</span>
								    </a>
							    </c:if>
							</li>
							
							<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
								<li class="page-item"><a class="page-link" href="${path}/revConsultList.do?pageNum=${num}">${num}</a></li>
							</c:forEach>
							
							<li class="page-item">
								<c:if test="${paging.endPage < paging.pageCount}">
								    <a class="page-link" href="${path}/revConsultList.do?pageNum=${paging.next}" aria-label="Next">
								      <span aria-hidden="true">&raquo;</span>
								    </a>
							    </c:if>
						    </li>
						</ul>
					</nav>
				</div>
				<!-- 페이지컨트롤 끝 -->
			</c:if>
		</c:if>
	<!-- 컨텐츠 끝 -->
	</div>
<!-- footer 시작 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>