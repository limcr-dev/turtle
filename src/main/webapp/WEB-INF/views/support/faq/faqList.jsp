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
<title>FAQ Page</title>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<!-- 상단 메뉴바 -->
		<br>
		<div  style="width:1000px; margin:auto" class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
			<div class="btn-group me-2" role="group" aria-label="Second group">
				<button type="button" class="btn btn-light">
					<a href="${path}/noticeList.bo" style="text-decoration: none; color: inherit;">공지사항</a>
				</button>
				<button type="button" class="btn btn-light">
					<a href="${path}/eventList.bo" style="text-decoration: none; color: inherit;">이벤트</a>
				</button>
				<button type="button" class="btn btn-light">
					<a href="${path}/boardList.bo" style="text-decoration: none; color: inherit;">자유게시판</a>
				</button>
			    <button type="button" class="btn btn-warning" >
					<a href="${path}/faqList.bo" style="text-decoration: none; color: inherit;"> FAQ</a>
			    </button>
			    <button type="button" class="btn btn-light" >
					<a href="${path}/qnaList.bo" style="text-decoration: none; color: inherit;">1대1문의</a>
				</button>
			</div>
		</div>
		<!-- 상단 메뉴바 끝 -->
		
		<hr>
		<h3 align="center">FAQ</h3>
			
		<!-- 질문카테고리 시작 -->
		<div  style="width:1000px; margin:auto">
			<br>
			<button type="button" class="btn btn-secondary"onclick="window.location='${path}/faqList.bo?category=예약관련'">예약관련</button>
			<button type="button" class="btn btn-secondary"onclick="window.location='${path}/faqList.bo?category=로그인관련'">로그인/회원가입 관련</button>
			<button type="button" class="btn btn-secondary"onclick="window.location='${path}/faqList.bo?category=시설관련'">시설관련</button>
			<button type="button" class="btn btn-secondary"onclick="window.location='${path}/faqList.bo?category=프로그램관련'">프로그램 관련</button>
			<button type="button" class="btn btn-secondary"onclick="window.location='${path}/faqList.bo?category=상품관련'">상품관련</button>
			<br><br>
		</div>
		<!-- 질문카테고리 끝 -->
		
		<!-- FAQ 시작 -->	
		<div class="accordion" id="accordionExample" style="width:1000px; margin:auto;">
			<c:forEach var="dto" items="${list}">
				<div class="accordion-item">
					<h2 class="accordion-header">
					    <button class="accordion-button collapsed bg-light " id="customAccordionButton" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${dto.faqNo}" aria-expanded="false" aria-controls="collapse${dto.faqNo}">
							<div style="font-size:20px; margin-bottom: -16px"><p><i class="fa-solid fa-q fa-lg"></i>  ${dto.faqTitle}</p></div>
					    </button>
				    </h2>
				    <div id="collapse${dto.faqNo}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				    	<div class="accordion-body">
							&nbsp&nbsp <i class="fa-solid fa-a"></i>. ${dto.faqContent}
				    	</div>
				    </div>
				</div>
			</c:forEach>
		</div>
		<!-- FAQ 끝 -->	
			
		<!-- 컨텐츠 끝 -->
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>