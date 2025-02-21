<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<style>
	#customAccordionButton:focus {
	    box-shadow: none !important; /* 기본 부트스트랩 효과 제거 */
	    border: 2px solid #000000 !important; /* 클릭 시 검은색 테두리 */
  	}
   	.btn btn-light{
  		background-color:orange-500;
  	} 
  	
</style>

<head>
<meta charset="UTF-8">
<title>PT 예약 상세</title>

<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<!-- revPT.js -->
<script src="${path}/resources/js/reservation/revPT.js" defer></script>

<!-- calendar.js, calender.css -->
<script src="${path}/resources/js/reservation/adPTCalendar.js" defer></script>
<link href='${path}/resources/css/common/calendar.css' rel='stylesheet' />

<!-- FullCalendar 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js"></script>

<!-- FullCalendar 언어 CDN --> 
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/locales-all.min.js'></script>

</head>
<body>
<!-- header 시작 -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- header 끝 -->
	<div class="wrap">
		<div id="container">
			<div id="contents">
				<hr>
				<h1 align="center">PT 예약 상세</h1>
				<hr>
				<!-- 컨텐츠 시작 -->
				<div id="section2">
					
					<div style="width:300px">
						<!-- 좌측 메뉴 시작 -->
						<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
						<!-- 좌측메뉴 종료 -->
					</div>
					<c:if test="${dto == null || dto == ''}">
						<script type="text/javascript">
							alert("조회 실패.");
							window.location="${path}/adRevPTList.ad";
						</script>
					</c:if>
					
					<c:if test="${dto != null || dto != ''}">
					<!-- 문의내용 시작 -->
					<input type="hidden" name="hidden_revPTNo" value="${dto.revPTNo}">
					<form name ="updateForm" id="updateForm" action="adRevPTUpdate.ad?revPTNo=${dto.revPTNo}" method="post" onsubmit="return updateRevConsulCheck()"
						style="width:1300px; align:center;">
							
						<table class="table" style="width:900px; margin:auto;" >
						    <tr align="center">
								<th width="30%">예약 번호</th>
								<td width="70%" align="center">${dto.revPTNo}</td>
						    </tr>
						    <tr align="center">
								<th>상태</th>
								<td align="center">
									<select  name="statusType" id="listSize">
										<option value=""
											<c:if test="${dto.revPTStatus == ''}">selected="selected"</c:if>>상태
										</option>
										<option value="대기"
											<c:if test="${dto.revPTStatus == '대기'}">selected="selected"</c:if>>대기
										</option>
										<option value="승인"
											<c:if test="${dto.revPTStatus == '승인'}">selected="selected"</c:if>>승인
										</option>
										
										<!-- PT 예약 날짜가 현재 날짜를 지났을 때만 완료로 변경 가능 -->
										<c:if test="${dto.revPTDate < now}">
											<option value="완료"
												<c:if test="${dto.revPTStatus == '완료'}">selected="selected"</c:if>>완료
											</option>
										</c:if>
										
										<option value="취소"
											<c:if test="${dto.revPTStatus == '취소'}">selected="selected"</c:if>>취소
										</option>
									</select>
								</td>
						    </tr>
						    <tr align="center">
								<th>회원 아이디</th>
								<td colspan="3" align="center">
									${dto.userId}
									<input type="hidden" id="hiddenUserId" name="hiddenUserId" value="${dto.userId}">
								</td>
						    </tr>
						    <tr align="center">
								<th>회원 이름</th>
								<td colspan="3" align="center">
									${dto.userName}
									<input type="hidden" id="hiddenUserName" name="hiddenUserName" value="${dto.userName}">	
								</td>
						    </tr>
						    
						    <tr align="center">
								<th>회원 전화번호</th>
								<td colspan="3" align="center">
									${dto.userHp}
									<input type="hidden" id="hiddenUserHp" name="hiddenUserHp" value="${dto.userHp}">
								</td>
						    </tr>
						    
						    <tr align="center">
								<th>담당자</th>
								<td colspan="3" align="center">
									${dto.trainerId}
									<input type="hidden" id="hiddenTrainerId" name="hiddenTrainerId" value="${dto.trainerId}">
								</td>
						    </tr>
						    
						    <tr align="center">
								<th>상담일</th>
								<td colspan="3" align="center">
									${fn:substring(dto.revPTDate, 0, 10)}
									<input type="hidden" name="hiddenRevDate" value="${fn:substring(dto.revPTDate, 0, 10)}">
								</td>
						    </tr>
						    
						    <tr align="center">
								<th>상담시간</th>
								<td colspan="3" align="center">
									${fn:substring(dto.revPTDate, 10, 16)}
									<input type="hidden" name="hiddenRevTime" value="${fn:substring(dto.revPTDate, 10, 16)}">
								</td>
						    </tr>
						    
						    
						</table>
						<br>
						<table style="width:900px; margin:auto;" >
						    <tr align="center">
						    	<td colspan="2" align="center"><b> 수정할 예약 날짜와 시간을 선택하세요</b><br></td>
						    </tr>
						    <tr align="center">
						    	<td align="center" >
						    		<div style="width:700px" id="calendar" style="display:flex">
										<!-- FullCalendar 띄우는 부분 -->
									</div>
								</td>
								<td align="center" >
									<div style="width:200px" id="revTimeShow" >
										<c:if test="${dayOfWeek == null}">
											<div align="center">날짜를 선택하세요</div>
										</c:if>
									</div> 
						    	</td>
						    </tr>
						    <tr>
						   		<td colspan="2" class="text-end">
						   			<div>
						   				<input type="submit" value="수정" class="btn active"/>
						   				<input type="button" value="목록" class="btn active" onclick="window.location='${path}/adRevPTList.ad'"/>
						   			</div>
						  		</td>
						    </tr>
						</table>
					</form>
					<!-- 문의내용 끝 -->
					</c:if>
					<!-- 컨텐츠 끝 -->
				</div>
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>
