<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약</title>
</head>
<body>

	<div class="radioButtonStyle">
	
		<h4 style="color:#ee8432" align="center">${revDate}</h4>
		<br>
		<!-- 주말일 때 예약 시간 출력(09:00~17:00) -->
		<c:if test="${dayOfWeek == 0 || dayOfWeek == 6}">
			<label class="radioStyle">
				<input type="radio" id="revTime9" name="revTime" value="09:00"
					<c:if test="${fn:contains(timeArr, '09:00')}"> disabled </c:if> />
				<span>09:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime10" name="revTime" value="10:00"
					<c:if test="${fn:contains(timeArr, '10:00')}"> disabled </c:if> />
				<span>10:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime11" name="revTime" value="11:00"
					<c:if test="${fn:contains(timeArr, '11:00')}"> disabled </c:if> />
				<span>11:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime12" name="revTime" value="12:00"
					<c:if test="${fn:contains(timeArr, '12:00')}"> disabled </c:if> />
				<span>12:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime13" name="revTime" value="13:00"
					<c:if test="${fn:contains(timeArr, '13:00')}"> disabled </c:if> />
				<span>13:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime14" name="revTime" value="14:00"
					<c:if test="${fn:contains(timeArr, '14:00')}"> disabled </c:if> />
				<span>14:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime15" name="revTime" value="15:00"
					<c:if test="${fn:contains(timeArr, '15:00')}"> disabled </c:if> />
				<span>15:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime16" name="revTime" value="16:00"
					<c:if test="${fn:contains(timeArr, '16:00')}"> disabled </c:if> />
				<span>16:00</span>
			</label>
			<label class="radioStyle">
				<input type="radio" id="revTime17" name="revTime" value="17:00"
					<c:if test="${fn:contains(timeArr, '17:00')}"> disabled </c:if> />
				<span>17:00</span>
			</label>
		</c:if>
		
		<!-- 평일일 때 예약 시간 출력(07:00~21:00) -->
		<c:if test="${dayOfWeek >= 1 && dayOfWeek <= 5}">
			<c:if test="${trainerId == 'trainer1'|| trainerId == 'trainer2' || trainerId == 'trainer3'}">
				<label class="radioStyle">
					<input type="radio" id="revTime7" name="revTime" value="07:00"
						<c:if test="${fn:contains(timeArr, '07:00')}"> disabled </c:if> />
					<span>07:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime8" name="revTime" value="08:00"
						<c:if test="${fn:contains(timeArr, '08:00')}"> disabled </c:if> />
					<span>08:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime9" name="revTime" value="09:00"
						<c:if test="${fn:contains(timeArr, '09:00')}"> disabled </c:if> />
					<span>09:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime10" name="revTime" value="10:00"
						<c:if test="${fn:contains(timeArr, '10:00')}"> disabled </c:if> />
					<span>10:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime11" name="revTime" value="11:00"
						<c:if test="${fn:contains(timeArr, '11:00')}"> disabled </c:if> />
					<span>11:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime11" name="revTime" value="12:00"
						<c:if test="${fn:contains(timeArr, '12:00')}"> disabled </c:if> />
					<span>12:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime13" name="revTime" value="13:00"
						<c:if test="${fn:contains(timeArr, '13:00')}"> disabled </c:if> />
					<span>13:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime14" name="revTime" value="14:00"
						<c:if test="${fn:contains(timeArr, '14:00')}"> disabled </c:if> />
					<span>14:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime15" name="revTime" value="15:00"
						<c:if test="${fn:contains(timeArr, '15:00')}"> disabled </c:if> />
					<span>15:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime16" name="revTime" value="16:00"
						<c:if test="${fn:contains(timeArr, '16:00')}"> disabled </c:if> />
					<span>16:00</span>
				</label>
			</c:if>
			
			<c:if test="${trainerId == 'trainer4' || trainerId == 'trainer5' || trainerId == 'trainer6' || trainerId == 'trainer7'}">
				<label class="radioStyle">
					<input type="radio" id="revTime9" name="revTime" value="09:00"
						<c:if test="${fn:contains(timeArr, '09:00')}"> disabled </c:if> />
					<span>09:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime10" name="revTime" value="10:00"
						<c:if test="${fn:contains(timeArr, '10:00')}"> disabled </c:if> />
					<span>10:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime11" name="revTime" value="11:00"
						<c:if test="${fn:contains(timeArr, '11:00')}"> disabled </c:if> />
					<span>11:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime11" name="revTime" value="12:00"
						<c:if test="${fn:contains(timeArr, '12:00')}"> disabled </c:if> />
					<span>12:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime13" name="revTime" value="13:00"
						<c:if test="${fn:contains(timeArr, '13:00')}"> disabled </c:if> />
					<span>13:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime14" name="revTime" value="14:00"
						<c:if test="${fn:contains(timeArr, '14:00')}"> disabled </c:if> />
					<span>14:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime15" name="revTime" value="15:00"
						<c:if test="${fn:contains(timeArr, '15:00')}"> disabled </c:if> />
					<span>15:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime16" name="revTime" value="16:00"
						<c:if test="${fn:contains(timeArr, '16:00')}"> disabled </c:if> />
					<span>16:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime17" name="revTime" value="17:00"
						<c:if test="${fn:contains(timeArr, '17:00')}"> disabled </c:if> />
					<span>17:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime18" name="revTime" value="18:00"
						<c:if test="${fn:contains(timeArr, '18:00')}"> disabled </c:if> />
					<span>18:00</span>
				</label>
			</c:if>
			
			<c:if test="${trainerId == 'trainer8' || trainerId == 'trainer9' || trainerId == 'trainer10'}">
				<label class="radioStyle">
					<input type="radio" id="revTime11" name="revTime" value="12:00"
						<c:if test="${fn:contains(timeArr, '12:00')}"> disabled </c:if> />
					<span>12:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime13" name="revTime" value="13:00"
						<c:if test="${fn:contains(timeArr, '13:00')}"> disabled </c:if> />
					<span>13:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime14" name="revTime" value="14:00"
						<c:if test="${fn:contains(timeArr, '14:00')}"> disabled </c:if> />
					<span>14:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime15" name="revTime" value="15:00"
						<c:if test="${fn:contains(timeArr, '15:00')}"> disabled </c:if> />
					<span>15:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime16" name="revTime" value="16:00"
						<c:if test="${fn:contains(timeArr, '16:00')}"> disabled </c:if> />
					<span>16:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime17" name="revTime" value="17:00"
						<c:if test="${fn:contains(timeArr, '17:00')}"> disabled </c:if> />
					<span>17:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime18" name="revTime" value="18:00"
						<c:if test="${fn:contains(timeArr, '18:00')}"> disabled </c:if> />
					<span>18:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime19" name="revTime" value="19:00"
						<c:if test="${fn:contains(timeArr, '19:00')}"> disabled </c:if> />
					<span>19:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime20" name="revTime" value="20:00"
						<c:if test="${fn:contains(timeArr, '20:00')}"> disabled </c:if> />
					<span>20:00</span>
				</label>
				<label class="radioStyle">
					<input type="radio" id="revTime21" name="revTime" value="21:00"
						<c:if test="${fn:contains(timeArr, '21:00')}"> disabled </c:if> />
					<span>21:00</span>
				</label>
			</c:if>
		</c:if>
	</div>
</body>
</html>
