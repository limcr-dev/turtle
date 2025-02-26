<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 목록</title>
<link rel="stylesheet" href="${path}/resources/css/common/leftbar.css">
<script>
	$(function() {
		// 작성
		$("#insertNotice").click(function() {
			location.href = "${path}/adNoticeInsert.ad"
		});
		
		// 체크박스 클릭 시 회원 전체 선택
		$("#checkboxAll").change(function() {
			 $(".selectCheck").prop("checked", $(this).prop("checked"));
	    });
		
		function getSelectedNotice() {
			var selectedNoticeMul = [];
			$(".selectCheck:checked").each(function() {
				selectedNoticeMul.push($(this).val());
			});
			
			if(selectedNoticeMul.length == 0) {
				alert("선택된 게시글이 없습니다.");
				return;
			}
			
			$("#hiddenNoticeMul").val(selectedNoticeMul.join(","));
			document.noticeListForm.action = "${path}/adNoticeDelete.ad";
			document.noticeListForm.submit();
		}
		
		// 셀렉트 박스 삭제 유무 조회
		$(document).ready(function() {
			$("#selectNoticeShow").change(function() {
				var noticeShow = $(this).val();
				var url = "${path}/adNoticeList.ad";
				
				if(noticeShow != "") {
					url += "?noticeShow=" + noticeShow;
				}
				location.href = url;
			});
		});
		
		// 삭제
		$("#deleteNotice").click(function(){
			if(getSelectedNotice() != null){
				document.noticeListForm.action = "${path}/adNoticeDelete.ad";
				document.noticeListForm.submit();
			}
		});
	});
</script>
</head>
<body>
	<div class="wrap"> <!-- 스타일을 해주려고 class명을 지정함  -->
		<!-- header 시작 -->
		<%@include file= "/WEB-INF/views/common/header.jsp"%>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
	            <!-- 상단 중앙1 시작 -->
	            <div>
	               <hr>
	               <h1 align="center">공지 사항</h1>
	               <hr>
	            </div>
	            <!-- 상단 중앙1 종료 -->
	            
	            <!-- 상단 중앙2 시작 -->
	            <div id="section2">
               
					<!-- 좌측 메뉴 시작 -->                              
					<%@ include file= "/WEB-INF/views/admin/common/adMainLeft.jsp" %>
					<!-- 좌측메뉴 종료 -->
					<!-- 우측매뉴 시작 -->
					<form name="noticeListForm" method="post" style="width:7000px">
						<table class="table">
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" id="checkboxAll"></th>
									<th scope="col" style="text-align:center;">제목</th>
									<th scope="col" style="text-align:center;">작성자</th>
									<th scope="col" style="text-align:center;">등록일</th>
									<th scope="col" style="text-align:center;">조회수</th>
									<td>
										<select name="noticeShow" id="selectNoticeShow">
											<option value="" <c:if test="${noticeShow == ''}">selected</c:if>>삭제여부</option>
											<option value="Y" <c:if test="${noticeShow == 'Y'}">selected</c:if>>Y</option>
											<option value="N" <c:if test="${noticeShow == 'N'}">selected</c:if>>N</option>
										</select>
									</td>
								</tr>
							</thead>
							<tbody class="table-group-divider">
								<c:forEach var="dto" items="${list}">
									<tr>
										<td style="text-align:left; vertical-align:middle;"><input type="checkbox" class="selectCheck" value="${dto.noticeNo}"></td>
										<%-- <td style="text-align:left">${dto.noticeNo}</td> --%>
										<td style="text-align:left; width:500px; vertical-align:middle;">
											<a style="color:black;" href="${path}/adNoticeDetail.ad?noticeNo=${dto.noticeNo}">${dto.noticeTitle}</a>
										</td>
										<td style="text-align:center; width:200px; vertical-align:middle;">${dto.noticeWriter}</td>
										<td style="text-align:center; width:300px; vertical-align:middle;">${dto.noticeRegdate}</td>
										<td style="text-align:center; width:150px; vertical-align:middle;">${dto.noticeViews}</td>
										<td style="width:50px; text-align:center; vertical-align:middle;">${dto.noticeShow}</td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
						  		<td colspan="10" class="text-end">
						  			<input type="hidden" name="hidden_noticeNo" value="${dto.noticeNo}">
						  			<input type="hidden" name="noticeMul" id="hiddenNoticeMul">
						  			<input type="hidden" name="hidden_noticeShow" value="${dto.noticeShow}">
						  			<button type="button" id="deleteNotice" class="btn active" data-bs-toggle="button" aria-pressed="true">삭제</button>
						  			<button type="button" id="insertNotice" class="btn active" data-bs-toggle="button" aria-pressed="true">공지작성</button>
					  			</td>
							</tr>
						</table>
						<!-- 페이지컨트롤 시작 -->
						<div style="width:920px; margin:auto" >
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
							    	<li class="page-item">
							        	<c:if test="${paging.startPage > 10}">
							    			<a class="page-link" href="${path}/adNoticeList.ad?pageNum=${paging.prev}" aria-label="Previous">
							      				<span aria-hidden="true">&laquo;</span>
							    			</a>
							 			</c:if>
									</li>
							
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<li class="page-item"><a class="page-link" href="${path}/adNoticeList.ad?pageNum=${num}">${num}</a></li>
									</c:forEach>
							
									<li class="page-item">
							   			<c:if test="${paging.endPage < paging.pageCount}">
							    			<a class="page-link" href="${path}/adNoticeList.ad?pageNum=${paging.next}" aria-label="Next">
							      				<span aria-hidden="true">&raquo;</span>
							    			</a>
							 			</c:if>
									</li>
								</ul>
							</nav>
						</div>
						<!-- 페이지컨트롤 끝 -->
					</form>
					<br>
					<!-- 우측메뉴 종료 -->
					<!-- 상단 중앙2 종료 -->
					</div>
				</div>
				<!-- 컨텐츠 끝 -->
				<hr>
			</div>
		</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>