<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
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
		<hr>
		<br>
		<h3 align="center">관리자 메뉴</h3>
		<br><br><br>
	
		<div align="center">
			<div style="display: flex; justify-content: center; gap:100px; flex-wrap: wrap;">
				<div class="card text-bg-light mb-2" style="max-width: 18rem;">
					<div class="card-body" style="min-width: 220px">
						<h5 class="card-title">회원 관리</h5>
						<hr>
						<p class="card-text"><a href="${path}/adCustomerList.ad?userType=admin" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">관리자 목록</a></p>
						<p class="card-text"><a href="${path}/adCustomerList.ad?userType=trainer" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">트레이너 목록</a></p>
						<p class="card-text"><a href="${path}/adCustomerList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원 목록</a></p>
					</div>
				</div>
				
				<div class="card text-bg-light mb-3" style="max-width: 18rem;">
					<div class="card-body" style="min-width: 220px">
						<h5 class="card-title">헬스 관리</h5>
						<hr>
						<p class="card-text"><a href="${path}/adHealthInsert.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원 등록</a></p>
						<p class="card-text"><a href="${path}/adHealthList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">회원 목록</a></p>
						<p class="card-text"><a href="${path}/adHealthUnPayList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">미결제 회원 목록</a></p>
					</div>
				</div>
				
				<div class="card text-bg-light mb-3" style="max-width: 18rem;">
					<div class="card-body" style="min-width: 220px">
						<h5 class="card-title">예약 관리</h5>
						<hr>
						<p class="card-text"><a href="${path}/adRevConsultList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">상담 예약 현황</a></p>
						<p class="card-text"><a href="${path}/adRevPTList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">PT 예약 현황</a></p>
					</div>
				</div>
				
				<div class="card text-bg-light mb-3" style="max-width: 18rem;">
					<div class="card-body" style="min-width: 220px">
						<h5>게시판</h5>
						<hr color="orange">
						<p class="card-text"><a href="${path}/adNoticeList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">공지사항</a></p>
						<p class="card-text"><a href="${path}/adEventList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">이벤트</a></p>
						<p class="card-text"><a href="${path}/adBoardList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">자유게시판</a></p>
						<p class="card-text"><a href="${path}/adFaqList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">FAQ</a></p>
						<p class="card-text"><a href="${path}/adQnaList.ad" class="link-secondary link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">1:1문의</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 컨텐츠 끝 -->
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>