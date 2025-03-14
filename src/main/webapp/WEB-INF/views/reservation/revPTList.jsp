<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PT 예약</title>
<!-- revPT.js -->
<script src="${path}/resources/js/reservation/revPT.js" defer></script>

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
		<c:if test="${sessionScope.sessionID == null}">
			<script type="text/javascript">
				alert("로그인 후 이용해주세요.");
				window.location="${path}/login.do"
			</script>
		</c:if>
		
		<h3 align="center">PT 예약 조회</h3>
		<br><br>
			
		<!-- PT 목록 시작 -->
		<table class="table" style="width:1000px; margin:auto;" align="center">
			<thead>
				<tr>
					<td colspan="9" align="right"> PT 잔여 횟수 : ${ptCnt}</td>
				</tr>
			    <tr align="center">
					<th scope="col" style="width:5%">번호</th>
			        <th scope="col" style="width:10%">아이디</th>
			        <th scope="col" style="width:10%">예약자</th>
			        <th scope="col" style="width:20%">전화번호</th>
			        <th scope="col" style="width:15%">트레이너</th>
			        <th scope="col" style="width:15%">예약일</th>
			        <th scope="col" style="width:10%">예약시간</th>
			        <th scope="col" style="width:10%">상태</th>
			        <th scope="col" style="width:10%"></th>
			    </tr>
			</thead>
		    <tbody>
		    	<c:if test="${paging.count == 0}">
					<tr>
						<td colspan="8" align="center">예약된 PT 수업이 존재하지 않습니다.</td>
					</tr>
				</c:if>
			    <c:forEach var="dto" items="${list}" >
					<tr align="center">
						<th scope="row">${dto.revPTNo}</th>
				        <td>${dto.userId}</td>
				        <td>${dto.userName}</td>
				        <td>${dto.userHp}</td>
				        <td>${dto.trainerId}</td>
				        <td>${fn:substring(dto.revPTDate, 0, 10)}</td>
				        <td>${fn:substring(dto.revPTDate, 10, 16)}</td>
				        <td>${dto.revPTStatus}</td>
				        <td>
					        <c:if test="${(dto.revPTStatus == '대기') || (dto.revPTStatus == '승인' && dto.revPTDate >= now)}">
					        	<input type="submit" value="취소" class="btn btn-secondary" onclick="window.location='${path}/revPTDelete.do?revPTNo=${dto.revPTNo}'">
					   		</c:if>
					   		<c:if test="${dto.revPTStatus == '승인' && dto.revPTDate < now}">
					        	<input type="submit" value="완료" class="btn btn-dark" onclick="window.location='${path}/revPTComplete.do?revPTNo=${dto.revPTNo}&userId=${dto.userId}'">
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
						    <a class="page-link" href="${path}/revPTList.do?pageNum=${paging.prev}" aria-label="Previous">
						      <span aria-hidden="true">&laquo;</span>
						    </a>
					    </c:if>
					</li>
					
					<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
						<li class="page-item"><a class="page-link" href="${path}/revPTList.do?pageNum=${num}">${num}</a></li>
					</c:forEach>
					
					<li class="page-item">
						<c:if test="${paging.endPage < paging.pageCount}">
						    <a class="page-link" href="${path}/revPTList.do?pageNum=${paging.next}" aria-label="Next">
						      <span aria-hidden="true">&raquo;</span>
						    </a>
					    </c:if>
				    </li>
				</ul>
			</nav>
		</div>
		<!-- 페이지컨트롤 끝 -->
		</c:if>
		
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>