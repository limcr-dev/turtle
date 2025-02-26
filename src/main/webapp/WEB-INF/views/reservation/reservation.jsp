<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br><br>
		<h3 align="center">예약</h3>
		<br>
		<br>
		<div class="row" style="width:1000px; margin:auto">
			<div class="col-md-1 ">
			</div>
			<div class="col-md-5 ">
				<div class="card" style="width: 500px 18rem;">
					<img src="./resources/images/revConsult.png" height="300px" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><b>상담 예약</b></h5>
						<p class="card-text">
							상담 예약하기 <br>
							평일: 06:00~23:00 <br>
							주말 및 공휴일: 09:00~18:00 <br>
						</p>
						<p class="card-text" align="right">
							<span style="color:gray; font-size:12px; align:right" >
								<br>
								* 로그인 후 이용 가능합니다.
							</span>
						</p>
						
						<div align="right">
							<c:if test="${sessionType.equals('admin') || sessionType.equals('trainer')}">
								<input class="btn btn-warning" type="button" value="관리자" onclick="window.location='${path}/adMain.ad'">
							</c:if>
							<c:if test="${sessionType==null || sessionType.equals('user')}">
								<a href="${path}/revConsult.do" class="btn btn-dark">예약하기</a>
								<a href="${path}/revConsultList.do" class="btn btn-secondary">예약조회</a>
							</c:if>
						</div>
						
				    </div>
				</div>
			</div>
			<div class="col-md-5 ">
				<div class="card" style="width: 500px 18rem;">
					<img src="./resources/images/revPT.png" height="300px" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><b>피티 예약</b></h5>
						<p class="card-text">
							피티 예약하기 <br>
							평일: 06:00~23:00 <br>
							주말 및 공휴일: 09:00~18:00 <br>
						</p>
						<p class="card-text" align="right">
							<span style="color:gray; font-size:12px; align:right" >
								* 로그인 후 이용 가능합니다.<br>
								* 피티 등록 후 이용 가능합니다.
							</span>
						</p>
						
						<div align="right">
							<c:if test="${sessionType.equals('admin') || sessionType.equals('trainer')}">
								<input class="btn btn-warning" type="button" value="관리자" onclick="window.location='${path}/adMain.ad'">
							</c:if>
							<c:if test="${sessionType==null || sessionType.equals('user')}">
								<a href="${path}/revPT.do" class="btn btn-dark">예약하기</a>
								<a href="${path}/revPTList.do" class="btn btn-secondary">예약조회</a>
							</c:if>
						</div>
				    </div>
				</div>
			</div>
			<div class="col-md-1 ">
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>