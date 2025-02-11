<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<link href="${path}/resources/css/common/header.css" rel="stylesheet">
<title>Header</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar">
		<!-- 로고 -->
		<ul class="navbar_title">
			<li><a href="${path}/main.do">TURTLE</a></li>
		</ul>
		
		<!-- 상단 메뉴 -->
		<ul class="navbar_menu">
			<li><a href="${path}/facility.do">내부시설</a></li>
			<li><a href="${path}/productList.do">상품</a></li>
			<li><a href="${path}/programList.do">프로그램</a></li>
			<li><a href="${path}/reservation.do">예약</a></li>
			<li class="dropdown">
				<a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					고객지원
				</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="${path}/noticeList.bo">공지사항</a></li>
					<li><a class="dropdown-item" href="${path}/eventList.bo">이벤트</a></li>
					<li><a class="dropdown-item" href="${path}/boardList.bo">자유게시판</a></li>
					<li><a class="dropdown-item" href="${path}/faqList.bo">FAQ</a></li>
					<li><a class="dropdown-item" href="${path}/qnaList.bo">1:1문의</a></li>
				</ul>
			</li>
		</ul>
		
		<!-- 로그인 여부에 따라 버튼이 바뀜 -->
		<ul class="navbar_icons">
			<c:if test="${sessionScope.sessionID!=null}">
				<!-- 로그인한 사람의 userType이 'A'일 때만 관리자 버튼 노출 -->
				<c:if test="${sessionScope.sessionType == 'admin' || sessionScope.sessionType == 'trainer'}">
					<li><a href="${path}/adMain.ad">관리자</a></li>
				</c:if>
				
				<li><a href="${path}/mypage.do">${sessionScope.sessionID}님</a></li>
				<li><a href="${path}/logout.do">로그아웃</a></li>
			</c:if>
			
			<c:if test="${sessionScope.sessionID==null}">
				<li><a href="${path}/login.do">로그인</a></li>
				<li><a href="${path}/join.do">회원가입</a></li>
			</c:if>
		</ul>
      
		
		<!-- 반응형웹 - 햄버거 아이콘 -->
		<a href="#" class="navbar_toggleBtn">
			<i class="fa-solid fa-bars"></i>
		</a>
	</nav>
</body>
</html>

     
