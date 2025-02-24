<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		<br>
		<!-- 컨텐츠 시작 -->
		<!-- 메뉴목록 -->
		<div align="left">
			<div class="card text-bg-light mb-2" style="max-width: 10rem; text-align:center">
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
			
			<div class="card text-bg-light mb-2" style="max-width: 10rem; text-align:center">
				<div class="card-body">
				  	<h5 class="card-title">예약 관리</h5>
				    <hr>
				    <p class="card-text"><a href="${path}/adReservationList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">예약 현황</a></p>
				</div>
			</div>
			
			<div class="card text-bg-light mb-2" style="max-width: 10rem; text-align:center">
				<div class="card-body">
				    <h5 class="card-title">헬스 관리</h5>
				    <hr>
				    <p class="card-text"><a href="${path}/adHealthList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원 현황</a></p>
				    <p class="card-text"><a href="${path}/adHealthUnPayList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">미결제 회원 현황</a></p>
				  	<p class="card-text"><a href="#" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">트레이너 현황</a></p>
				  	
				</div>
			</div>
			
			<div class="card text-bg-light mb-2" style="max-width: 10rem; text-align:center">
				<div class="card-body">
				  	<h5 class="card-title">회원 관리</h5>
				    <hr>
				    <p class="card-text"><a href="${path}/adCustomerList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원 목록</a></p>
				</div>
			</div>
		<!-- 메뉴목록 -->
		</div>
	</div>
</body>
</html>