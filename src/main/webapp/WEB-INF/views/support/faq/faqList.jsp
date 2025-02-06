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
			<button type="button" class="btn btn-secondary">예약관련</button>
			<button type="button" class="btn btn-secondary">로그인/회원가입 관련</button>
			<button type="button" class="btn btn-secondary">시설관련</button>
			<br><br>
		</div>
		<!-- 질문카테고리 끝 -->
		
		<!-- 질문 시작 -->	
		<div class="accordion" id="accordionExample" style="width:1000px; margin:auto;">
			<div class="accordion-item">
				<h2 class="accordion-header">
				    <button class="accordion-button bg-light " id="customAccordionButton" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
						1차 팀프로젝트
				    </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
			    	<div class="accordion-body ">
						화이팅
			    	</div>
			    </div>
			</div>
			
			<div class="accordion-item">
			    <h2 class="accordion-header">
					<button class="accordion-button collapsed bg-light" id="customAccordionButton" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
			       		1차 프로젝트
			        </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						화이팅
			      </div>
			    </div>
			</div>
			  
			<div class="accordion-item">
				<h2 class="accordion-header">
			    	<button class="accordion-button collapsed bg-light" id="customAccordionButton" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
			      		1차 프로젝트
			    	</button>
			 	</h2>
				<div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						화이팅
					</div>
			    </div>
			</div>
		</div>
		<!-- 질문 끝 -->	
			
		<!-- 컨텐츠 끝 -->
		<p align="center">
			SELECT *<br>
				FROM faq_tb<br>
				WHERE faqNo = faqNo <br>
				AND faqShow = 'Y' <br>
				AND faqNo >= start <br>
				AND faqNo <= end <br>
		</p>
	</div>
	<!-- footer 시작 -->
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>