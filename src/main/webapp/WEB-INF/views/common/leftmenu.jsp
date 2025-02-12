<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 좌측메뉴</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
</head>
<body>
	<br>
	<!-- 좌측메뉴 시작 -->
	<div id="left">
		<div class="left_inside">
			<!-- 좌측 메뉴바 시작 -->
			<!-- <ul class="nav flex-column"> -->
			<!-- <div class="d-flex align-items-start" align="right"> -->
			
			<div class="btn-group-vertical" role="group" aria-label="Vertical button group">
				<button type="button" class="btn btn-dark">관리자</button>
			  
			  
				<div class="btn-group dropend" role="group">
					<button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						게시판
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${path}/adQnaList.ad">1:1 문의 목록</a></li>
						<li><a class="dropdown-item" href="${path}/adNoticeList.ad">공지 목록</a></li>
						<li><a class="dropdown-item" href="${path}/adNoticeInsert.ad">공지 작성</a></li>
						<li><a class="dropdown-item" href="${path}/adEventList.ad">이벤트 목록</a></li>
						<li><a class="dropdown-item" href="#">이벤트 작성</a></li>
						<li><a class="dropdown-item" href="${path}/adFaqList.ad">FAQ 목록</a></li>
						<li><a class="dropdown-item" href="#">FAQ 작성</a></li>
						<li><a class="dropdown-item" href="${path}/adBoardList.ad">자유게시판 목록</a></li>
					</ul>
				</div>
			
				<div class="btn-group dropend" role="group">
					<button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						예약
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${path}/adReservationList.ad">예약 목록</a></li>
					</ul>
				</div>
			
				<div class="btn-group dropend" role="group">
					<button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						헬스
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${path}/adHealthList.ad">헬스 목록</a></li>
						<li><a class="dropdown-item" href="#">헬스 등록</a></li>
					</ul>
				</div>
			
				<div class="btn-group dropend" role="group">
					<button type="button" class="btn btn-dark dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						회원
					</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="${path}/adCustomerList.ad">회원 목록</a></li>
					</ul>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>