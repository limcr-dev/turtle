<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adHealthInsert</title>

<!-- join.js -->
<script src="${path}/resources/js/health/insert.js" defer></script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		<br>
		
		<div id ="container">
			<div id="contents">
				<div id="section1">
					<h1 align="center">헬스회원 수정</h1>
				</div>
				
				<div id="section2">
					<div id="right">
						<div class="table_div"> 
							<form name="adHealthDetail" action="adHealthUpdateAction.ad" method="post" enctype="multipart/form-data">
								<table>
								
									<tr>
										<th> 회원 번호 </th>
										<td>
											${dto.healthNo}
										</td>
									</tr>
									
									<tr>
										<th> 아이디 </th>
										<td>
											<input type="text" class="input" name="userId" id="userId" value="${dto.userId}" size="50">
										</td>
									</tr>
									
									<tr>
										<th> 이름 </th>
										<td>
											<input type="text" class="input" name="userName" id="userName" value="${dto.userName}" size="50">
										</td>
									</tr>
									
									
									<tr>
										<th> 핸드폰번호 </th>
										<td>
											<c:if test="${dto.getUserHp() == null}">
			                                   <input type="text" class="input" name="userHp1" size="3" style="width:50px">
			                                   -
			                                   <input type="text" class="input" name="userHp2" size="4" style="width:70px">
			                                   -
			                                   <input type="text" class="input" name="userHp3" size="4" style="width:70px">
			                                </c:if>
			                                
			                                <c:if test="${dto.getUserHp() != null}"> 
			                                   <c:set var="hpArr" value="${fn:split(dto.getUserHp(),'-')}" />  
			                                   
			                                   <input type="text" class="input" name="userHp1" size="3" value="${hpArr[0]}" style="width:50px">
			                                   -
			                                   <input type="text" class="input" name="userHp2" size="4" value="${hpArr[1]}" style="width:70px">
			                                   -
			                                   <input type="text" class="input" name="userHp3" size="4" value="${hpArr[2]}" style="width:70px">
			                                </c:if>
		                                </td>
									</tr>
									
									<tr>
										<th> 상품이미지 </th>
										<td colspan="2" style="width:120px">
											<img src = "${dto.healthImg}" style="width:200px"><br>
											<input type="file" class="input" name="hmImg" id="hmImg" value="${dto.healthImg}" accept="image/*">
										</td>
									</tr>
									
									<tr>
										<th> P.T 횟수 </th>
										<td>
											<select class="input" name="ptCnt" id="ptCnt" required>
												<option value="">횟수</option>
												<option value=12>12회</option>
												<option value=24>24회</option>
												<option value=36>36회</option>
											</select>
										</td>
									</tr>
									
									
									
									<tr>
										<th> 등록기간 </th>
										<td>
										
											<div class="row g-3 align-items-center">
												
												<div class="col-md-10">
													<input type="date" id="healthStartDate" name="healthStartDate" class="form-control form-control-lg" placeholder="시작일을 입력하세요" required>~
													<input type="date" id="healthEndDate" name="healthEndDate" class="form-control form-control-lg" placeholder="생년월일을 입력하세요" >
												</div>
											</div>
											<select class="input" name="ptCnt" id="ptCnt" required>
												<option value="">횟수</option>
												<option value=12>12회</option>
												<option value=24>24회</option>
												<option value=36>36회</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<th>상태</th>
										<td>
											<input type="text" class="input" name="healthStatus" id="healthStatus" value="${dto.healthStatus}" size="50">
										</td>
									</tr>
									
									<tr>	
										<td colspan ="2">
											<br>
											<div align="right">
												<input class="inputButton" type="submit" value="수정">
												<input class="inputButton" type="button" value="회원목록" onclick="window.location='${path}/adHealthList.ad'">
												
												<input type="hidden" name="hiddenPageNum" value="${pageNum}"/>
			                           			<input type="hidden" name="hiddenHealthNo" value="${dto.healthNo}"/>
			                           			<input type="hidden" name="hiddenHmImg" value="${dto.healthImg}"/> 
											</div>
										</td>
									</tr>
								</table>
							</form>
						</div>		
					</div>
				</div>
			</div>
		</div>
	
			
		<br>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>