<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	$(function(){
		// [삭제 버튼] 클릭시 
		$("#faqDelete").click(function(){
			alert("삭제합니다")
			location.href="${path}/adFaqDelete.ad?faqNo=${dto.faqNo}";
		});
	});
</script>
<head>
<meta charset="UTF-8">
<title>FAQ Detail</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙 시작 -->
				<hr>
				<h1 align="center">FAQ 상세페이지</h1>
				<hr>
				<!-- 상단 중앙 종료 -->
				<!-- 컨텐츠 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->               					
					<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
					<!-- 좌측메뉴 종료 -->
					
					<!-- FAQ 상세페이지 시작 -->
					<input type="hidden" name="hidden_faqNo" value="${dto.faqNo}">
					<form name ="detailForm" id="detailForm" action="${path}/adfaqList.ad" method="post" style="width:1300px">
						<table class="table" style="width:1050px; margin:auto;">
							<thead>
								<tr>
									<td colspan="7" align="right">
									<!-- 삭제버튼 시작 -->
										<div style="text-align: right">
											<input type="button" value="수정" class="btn active" onclick="window.location='adFaqUpdate.ad?faqNo=${dto.faqNo}'">
											<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
											  삭제
											</button>
											
											<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-bs-backdrop="false">
												<div class="modal-dialog modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-header">
											        		<h1 class="modal-title fs-5" id="exampleModalLabel">확인</h1>
											       			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      		</div>
												     	<div class="modal-body">
												        	삭제하겠습니까?
												      	</div>
												      	<div class="modal-footer">
												        	<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="faqDelete">예</button>
												        	<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">아니요</button>
												      	</div>
													</div>
												</div>
											</div>
										</div>
									<!-- 삭제버튼 끝 -->
									</td>
								</tr>
							    <tr>
									<th style="width:70%">
										<h2>${dto.faqTitle}</h2>
									</th>
									<td align="right" style="width:20%"> 
										작성자 : ${dto.faqWriter}<br>
										질문타입 : ${dto.faqType}
									</td>
							    </tr>
						    </thead>
						    <tbody>
							    <tr>
							        <td colspan="7">
							      	 	<p class="text-start"> ${dto.faqContent}</p>
							        </td>
							    </tr>
								<!-- 목록 버튼 시작 -->
							    <tr>
							   		<td colspan="7" class="text-end">
										<input type="button" value="목록" class="btn active" onclick="window.location='adFaqList.ad'">
							  		</td>
							    </tr>
							    <!-- 목록 버튼 끝-->
						    </tbody>
						</table>
					</form>
					<!-- FAQ 상세페이지 끝 -->
				</div>
				<!-- 컨텐츠 끝 -->
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>