<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page(Health)</title>
<script type="text/javascript">
$(function(){
	$("insert").click(function(){
		location.href="${path}/healthInsert.ad";
	})
})
</script>

<style>
td a {
   color: black;
   text-decoration: none;
}
</style>

</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
		<!-- 컨텐츠 시작 -->
		<hr>
		<h3 align="center">관리자 메뉴</h3>
		<br>
		<br>
			
		<!-- 메뉴목록 -->
		
		<div align="center">
			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
			  <div class="card-body">
			    <h5>게시판</h5>
			    <hr color= orange >
			    <p class="card-text"><a href="${path}/adNoticeList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">공지사항</a></p>
			  	<p class="card-text"><a href="${path}/adEventList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">이벤트</a></p>
			  	<p class="card-text"><a href="${path}/adBoardList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">자유게시판</a></p>
			  	<p class="card-text"><a href="${path}/adFaqList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">FAQ</a></p>
			  	<p class="card-text"><a href="${path}/adQnaList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">1:1문의</a></p>
			  </div>
			</div>
			
			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
			  <div class="card-body">
			  	<h5 class="card-title">예약 관리</h5>
			    <hr>
			    <p class="card-text"><a href="${path}/adReservationList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">예약 현황</a></p>
		
			  </div>
			</div>
			
			<div class="card text-bg-light mb-3" style="max-width: 18rem;">
			  <div class="card-body">
			    <h5 class="card-title">헬스 관리</h5>
			    <hr>
			    <p class="card-text"><a href="${path}/adHealthList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원 현황</a></p>
			  	<p class="card-text"><a href="#" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">트레이너 현황</a></p>
			</div>
		</div>
			
			

			
			

			
			
		<!-- 메뉴목록 -->
		
		
		
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>